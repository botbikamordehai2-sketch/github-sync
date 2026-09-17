# Multi-Agent Research Vision

**Owner:** Mordehai Botbika  
**Status:** DRAFT VISION · RESEARCH_ONLY  
**Scope:** Future architecture proposal  
**Decision owner:** Human  
**Execution authority:** None

## 1. Purpose

This document defines a future vision for a governed multi-agent research
system. The system is intended to organize fragmented information into
traceable research outputs while keeping a human as the final decision maker.

It does not authorize implementation, deployment, automation, trading,
publishing, or external writes.

## 2. What the system does

A multi-agent AI system does not predict markets and does not replace human
judgment. Its intended role is to operate as a research center that can:

- collect information from approved sources;
- normalize data into a consistent structure;
- detect anomalies, changing themes, and missing evidence;
- compare claims against primary sources;
- produce documented research drafts;
- record sources, timestamps, confidence, limitations, and approval status;
- route drafts to a human reviewer before any external use.

Every output remains a draft until it is reviewed and approved by a human.

## 3. Research domains

| Domain | Intended input | Intended output | Boundary |
|---|---|---|---|
| FX and indices | Approved market data, macro calendars, primary news | Market-state research report | RESEARCH_ONLY |
| Equities | Filings, company announcements, approved market data | Company research card and event timeline | No recommendation |
| Sentiment | Approved public text sources | Change-in-discussion summary | Context, not causality |
| RSS and news | Approved feeds and primary sources | Candidate research queue | LEAD_UNVERIFIED until checked |
| SEO | Search intent and approved keyword data | Content brief and outline | Draft only |
| Content | Approved research artifacts | Platform-specific draft | Human review required |
| Governance | Source, time, version, agent, approval state | Audit trail | Append-only where practical |

## 4. Evidence model

Every material claim must use one of these labels:

- **FACT** — supported by a verified source.
- **OBSERVATION** — an interpretation derived from available evidence.
- **UNSUPPORTED** — not verified or missing sufficient evidence.

Additional operational states may include:

- **LEAD_UNVERIFIED** — candidate item awaiting validation.
- **DATA_QUALITY_BLOCKED** — output blocked because required data is missing,
  stale, contradictory, or invalid.
- **DRAFT** — generated artifact awaiting review.
- **APPROVED** — explicitly approved by the human decision owner.
- **REJECTED** — reviewed and not approved for further use.

## 5. Conceptual architecture

The future system may contain the following logical layers:

1. **Source intake** — approved APIs, feeds, repositories, and documents.
2. **Normalization** — common schemas, timestamps, identifiers, and metadata.
3. **Evidence validation** — source checks, duplication checks, and freshness.
4. **Specialist agents** — bounded analysis for macro, markets, sentiment, SEO,
   content, security, or software.
5. **Synthesis** — combines evidence without hiding disagreement or uncertainty.
6. **Governance gate** — applies safety rules and blocks unsupported actions.
7. **Human approval** — the only authority that may approve an external action.
8. **Audit trail** — records provenance, versions, decisions, and outcomes.

These layers are a conceptual proposal, not evidence that the components exist.

## 6. Agent responsibilities

Future agents should have narrow, explicit responsibilities:

- collect only from approved sources;
- distinguish evidence from interpretation;
- expose uncertainty and missing data;
- preserve source provenance;
- avoid duplicate work;
- produce drafts rather than final decisions;
- stop when required evidence or authorization is absent;
- never expose credentials, tokens, private URLs, or confidential material.

No agent may expand its own authority.

## 7. Human control

The human decision owner remains responsible for:

- approving sources and integrations;
- approving project and status changes;
- authorizing external writes;
- reviewing research conclusions;
- approving publication;
- deciding whether any proposed implementation proceeds.

Silence, an automated message, or another agent's output is not approval.

## 8. Market-research restrictions

All market-related work is permanently **RESEARCH_ONLY**.

The system must not:

- place, modify, or close trades;
- connect research outputs directly to execution;
- generate automated trading triggers;
- present sentiment as proof of causality;
- present model output as a price prediction;
- describe research as financial advice;
- bypass human review.

Missing or conflicting market data must produce
**DATA_QUALITY_BLOCKED**, not an invented completion.

## 9. Content and copyright controls

AI-generated content is a draft only. Before publication, a human reviewer must
check:

- factual accuracy;
- primary-source support;
- copyright and licensing;
- privacy and confidential information;
- platform rules;
- disclosure requirements;
- consistency with approved brand and governance rules.

The system should summarize sources in original language and should not copy
protected material at length.

## 10. Security and privacy

The future architecture must follow least-privilege access and data minimization.

It must not store secrets in prompts, logs, ordinary fields, data stores, or
research artifacts. Sensitive values must use approved secret-management
mechanisms and must never appear in screenshots or chat messages.

External calls, integrations, triggers, and scheduled actions require separate
human approval before implementation.

## 11. Quality gates

A research artifact may advance only when:

- required sources are available and current;
- material claims are labeled;
- source provenance is retained;
- contradictions are visible;
- confidence is explained;
- sensitive information is absent;
- the relevant human approval is recorded.

Failure of any required gate blocks advancement.

## 12. Relationship to Trinity Slack Gateway

The existing Trinity Slack Gateway is a secure transport layer for requests
between Slack, Vercel, and Make. It is not the multi-agent research system
described here.

Any future connection between the gateway and research agents requires a
separate specification, threat review, implementation plan, testing plan, cost
limit, and explicit human approval.

## 13. Governance alignment

This vision is subordinate to:

- `GOVERNANCE.md`
- `SAFETY_RULES.md`
- `PROJECT_INDEX.md`
- `MULTI_AGENT_COORDINATION.md`

If this document conflicts with a governing document, the governing document
takes precedence.

## 14. Current evidence status

### FACT

- `GOVERNANCE.md` requires explicit human approval for external actions.
- `SAFETY_RULES.md` requires FACT / OBSERVATION / UNSUPPORTED labels.
- `SAFETY_RULES.md` defines FX projects as RESEARCH_ONLY.
- This document is a future vision and grants no execution authority.

### OBSERVATION

- Separating collection, validation, specialist analysis, synthesis, approval,
  and auditing may reduce ambiguity and improve accountability.
- Narrow agent roles may reduce duplicated or conflicting work.

### UNSUPPORTED

- Production readiness of the proposed research architecture.
- Accuracy or performance of future agents.
- Availability, licensing, or reliability of future data sources.
- Cost, latency, scalability, and operational requirements.
- Any claim that the proposed system can predict market outcomes.

## 15. Non-goals

This document does not:

- approve implementation;
- create an automation;
- authorize a new integration;
- approve a deployment;
- change a project status;
- authorize trading;
- authorize publishing;
- alter any governance file.

## 16. Next approval gates

Before implementation, the human decision owner must separately approve:

1. a bounded use case;
2. approved sources and licenses;
3. data schemas and retention;
4. agent roles and permissions;
5. security and privacy controls;
6. acceptance tests;
7. cost and rate limits;
8. logging and audit requirements;
9. rollback and shutdown procedures;
10. a staged implementation plan.
