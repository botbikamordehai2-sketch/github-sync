# ChatGPT ↔ n8n Bridge v1

Status: DRAFT FOR HUMAN REVIEW  
Scope: governed bridge for TROS / github-sync  
Mode: READ-ONLY FIRST  
Human owner: Moti

## 1. Goal

Allow ChatGPT to act as a controlled interface for n8n workflows without granting unrestricted execution authority.

The bridge must:
- accept structured requests,
- authenticate and validate them,
- classify risk,
- route only permitted actions,
- return a structured response,
- write an audit record,
- fail closed on ambiguity.

## 2. Trust boundary

ChatGPT is a request originator, not the final authority.

n8n is the orchestration layer.

The Policy Gate is authoritative for:
- action allow/deny,
- risk class,
- required human approval,
- tool scope,
- persistent writes.

## 3. Request envelope

```json
{
  "version": "1.0",
  "correlation_id": "uuid",
  "source": "chatgpt",
  "actor": "moti",
  "target": "github-sync",
  "action": "repo.inspect",
  "risk_class": "R0",
  "requires_approval": false,
  "payload": {},
  "timestamp": "ISO-8601"
}
```

Required fields:
- version
- correlation_id
- source
- actor
- target
- action
- timestamp

## 4. Response envelope

```json
{
  "ok": true,
  "correlation_id": "uuid",
  "status": "completed",
  "action": "repo.inspect",
  "risk_class": "R0",
  "approval": "not_required",
  "result": {},
  "audit_id": "event-id",
  "timestamp": "ISO-8601"
}
```

Error form:

```json
{
  "ok": false,
  "correlation_id": "uuid",
  "status": "blocked",
  "reason": "approval_required",
  "risk_class": "R2",
  "timestamp": "ISO-8601"
}
```

## 5. Initial action registry

### R0 — automatic
- repo.inspect
- repo.read_file
- repo.list_prs
- repo.list_issues
- repo.compare_refs
- repo.health_summary

### R1 — approval required
- repo.create_branch
- repo.create_draft_file
- repo.open_draft_pr
- repo.create_issue

### R2 — approval + validation + diff review
- repo.update_tracked_file
- repo.modify_workflow
- repo.modify_integration_config

### R3 — prohibited in v1
- repo.merge_pr
- repo.delete_file
- repo.delete_branch
- repo.change_permissions
- repo.change_visibility
- secrets.write
- production.deploy

## 6. Webhook security

Minimum controls:
1. HTTPS only.
2. Shared secret or HMAC signature.
3. Timestamp freshness check.
4. Correlation ID required.
5. Idempotency check.
6. Allow-list action registry.
7. Payload size limit.
8. No credentials in request body.
9. Fail closed on unknown action.
10. Log every decision.

Recommended headers:
- X-TROS-Timestamp
- X-TROS-Signature
- X-TROS-Correlation-Id

HMAC input:
```
timestamp + "." + raw_body
```

Signature:
```
hex(HMAC_SHA256(shared_secret, timestamp + "." + raw_body))
```

Reject if:
- signature invalid,
- timestamp older than configured freshness window,
- correlation_id already completed,
- action unknown,
- action exceeds allowed risk class.

## 7. n8n v1 flow

Webhook
→ Normalize Request
→ Validate Required Fields
→ Verify Signature
→ Check Freshness
→ Idempotency Check
→ Resolve Action Registry
→ Risk Classifier
→ Policy Gate
→ Execute R0 Handler
→ Validate Result
→ Write Audit Event
→ Respond to Webhook

R1/R2:
Policy Gate
→ Approval Required response
→ stop

No write execution is enabled in the initial workflow.

## 8. Audit schema

```json
{
  "audit_id": "uuid",
  "correlation_id": "uuid",
  "agent_id": "chatgpt-n8n-bridge-v1",
  "actor": "moti",
  "target": "github-sync",
  "action": "repo.inspect",
  "risk_class": "R0",
  "decision": "allowed",
  "approval_status": "not_required",
  "input_summary": "...",
  "result_summary": "...",
  "timestamp": "ISO-8601"
}
```

Do not store:
- tokens,
- passwords,
- API keys,
- raw secrets,
- environment values.

## 9. Fail-closed rules

Block when:
- action is missing,
- target is missing,
- correlation_id is missing,
- signature validation fails,
- freshness check fails,
- action is not registered,
- R1/R2 lacks explicit approval,
- R3 is requested,
- execution result cannot be verified.

## 10. Rollout plan

Phase 1:
- bridge contract
- webhook skeleton
- R0 request/response path
- audit event

Phase 2:
- GitHub read handlers
- validation
- idempotency store

Phase 3:
- R1 approval gate
- reversible draft writes only

Phase 4:
- R2 guarded writes after acceptance tests

R3 remains prohibited until a separate governance decision.

## 11. Acceptance criteria

v1 is accepted when:
- unsigned requests fail,
- stale requests fail,
- duplicate correlation IDs do not execute twice,
- unknown actions fail,
- R3 fails,
- R0 returns a valid response envelope,
- all decisions produce audit events,
- no secrets appear in logs,
- no repository writes occur.

## 12. Current implementation status

Implemented in the workflow JSON:
- fixed target allow-list for `github-sync`,
- R0 GitHub REST read routing,
- `repo.inspect`,
- `repo.read_file`,
- `repo.list_prs`,
- `repo.list_issues`,
- `repo.compare_refs`,
- `repo.health_summary` metadata path,
- best-effort duplicate `correlation_id` blocking after successful completion,
- append-oriented in-workflow audit buffer,
- R1/R2 blocking,
- R3 hard blocking.

The workflow-static-data duplicate check is not atomic across concurrent executions and the in-workflow audit buffer is not durable. Acceptance criteria for reliable idempotency and audit still require persistent storage or serialized execution and separate tests.

The workflow intentionally remains `active: false`.

Before activation, configure real webhook authentication and freshness validation. The current JSON must not be exposed publicly as a live endpoint until the authentication gate is configured and tested.

Because the target repository is public, the first R0 GitHub handler uses unauthenticated public GitHub REST reads. A GitHub credential should only be added later if private-repository access or higher API limits are required.
