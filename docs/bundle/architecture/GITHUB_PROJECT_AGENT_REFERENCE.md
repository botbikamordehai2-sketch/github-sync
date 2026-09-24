# GitHub Project Agent — Reference Architecture

Status: DRAFT FOR HUMAN REVIEW  
Scope: github-sync reference implementation  
Execution authority: READ-FIRST; no merge/deploy/delete authority  
Human owner: Moti

## 1. Purpose

Define the first governed TROS agent: a GitHub Project Agent that can inspect repository state, summarize project health, propose changes, and prepare reviewable artifacts without silently modifying production state.

The design separates:
- reasoning from orchestration,
- tool access from model access,
- transient self-correction from persistent self-improvement,
- low-risk reads from approval-gated writes.

## 2. Core flow

Input -> n8n Orchestrator -> Policy Gate -> Agent Core -> GitHub Tools -> Validator -> Human Approval (when required) -> Action -> Audit Log -> Evaluation

## 3. Default permission model

### Allowed without approval
- Read repository metadata.
- Read files and directories.
- Read commits, issues, pull requests, branches, workflow status, and repository health information.
- Compare refs/commits.
- Produce summaries, diagnostics, and proposed patches.
- Create internal evaluation records.

### Approval required
- Create or update repository files.
- Create branches.
- Open or modify pull requests.
- Create or modify issues.
- Add labels or assignees.
- Trigger workflows with side effects.
- Persist a proposed agent improvement.

### Prohibited for the reference implementation
- Merge pull requests.
- Delete branches or files.
- Change repository visibility.
- Change secrets, credentials, tokens, or environment values.
- Change governance/safety policy without explicit human approval.
- Deploy to production.
- Execute arbitrary code on the host.

## 4. Agent profile

agent_id: github-project-agent-v1  
deployment: controlled orchestration layer  
primary_orchestrator: n8n  
target_repository: github-sync  
autonomy: bounded  
state_mode: explicit session state + audited persistent state  
tool_access: least privilege  
write_mode: approval-gated  
code_execution: sandbox only, when separately enabled

## 5. State model

Minimum state record:

- correlation_id
- agent_id
- user_request
- repository
- branch_or_ref
- task_type
- risk_level
- requested_tools
- approved_tools
- evidence
- proposed_action
- validation_result
- approval_status
- execution_result
- timestamp

Persistent memory must not contain:
- API keys
- tokens
- passwords
- private environment values
- unredacted secrets

## 6. Risk classes

### R0 — Read only
Examples: repository scan, PR summary, issue search.
Action: automatic.

### R1 — Reversible write
Examples: create branch, create draft document, open draft PR.
Action: explicit user approval required.

### R2 — Material project change
Examples: update tracked source, alter workflow logic, change integration behavior.
Action: explicit approval + validation + reviewable diff.

### R3 — Critical / irreversible
Examples: merge, delete, production deploy, permission changes, secrets operations.
Action: prohibited in v1.

## 7. n8n workflow

1. Trigger
2. Normalize request
3. Generate correlation_id
4. Resolve repository
5. Policy / permission check
6. Classify risk
7. Read context from GitHub
8. Agent reasoning
9. Generate proposed action
10. Validate proposal
11. If R0 -> return result
12. If R1/R2 -> Human Approval Gate
13. Execute only approved action
14. Verify post-condition
15. Write audit event
16. Return one final response

## 8. Self-correction vs self-improvement

### Self-correction
Allowed inside a run:
- retry a failed read,
- revise a summary,
- re-plan a task,
- choose a different permitted read tool.

These changes are transient and do not alter the agent permanently.

### Candidate self-improvement
Any proposed persistent change to:
- prompts,
- memory schema,
- policies,
- workflow logic,
- tool routing,
- code.

Required path:

Detect problem -> propose improvement -> isolated evaluation -> compare old/new -> human approval -> persist -> audit.

The agent may propose a persistent improvement but may not install it autonomously.

## 9. Audit requirements

Every meaningful tool action should record:
- correlation_id
- agent_id
- actor
- repository
- action
- risk_class
- input_summary
- approval_reference
- result
- validation
- timestamp

Audit data should be append-oriented and reviewable.

## 10. Validation requirements

Before any approved write:
- confirm repository and branch,
- confirm target path,
- confirm operation matches approved scope,
- scan proposed content for secrets,
- verify governance files are not changed unless explicitly approved,
- verify resulting diff.

After a write:
- fetch resulting state,
- compare expected vs actual,
- log the result,
- stop on mismatch.

## 11. Failure rules

Fail closed when:
- permission is ambiguous,
- approval is missing,
- repository identity is uncertain,
- validation fails,
- secret-like content is detected,
- tool result differs from expected post-condition.

Do not silently downgrade a required approval.

## 12. Acceptance criteria for v1

The reference implementation is acceptable when it can:

- inspect github-sync without writes;
- summarize repository state with evidence;
- classify actions into R0-R3;
- refuse/protect R3 actions;
- prepare a reversible R1 proposal;
- require approval before the R1 write;
- log correlation_id, action, approval, and result;
- verify post-write state;
- keep secrets outside prompts, memory, and logs;
- distinguish transient self-correction from persistent self-improvement.

## 13. Non-goals

This document does not authorize:
- autonomous merges,
- autonomous deployment,
- credential management,
- host-level code execution,
- unrestricted multi-agent delegation.

## 14. Next implementation slice

Build a read-only n8n workflow first:

Trigger -> Request Normalizer -> Policy Gate -> GitHub Read Tools -> Agent Analysis -> Validator -> Audit -> Final Response

Only after the read-only path passes acceptance tests should R1 draft-write actions be added.
