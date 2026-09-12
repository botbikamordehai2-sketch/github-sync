# github-sync

Sync/architecture agent home. Manages the connection layer between GitHub, Notion,
applications, and AI model wrappers — keeping clean separation between layers,
proposing safe changes, and documenting every action clearly.

## Architecture principles

- This repo (`github-sync`) is the home of the sync agent's code, connectors,
  mapping rules, and sync automations.
- Trading engines live in their own dedicated repo (e.g. `fx_strength` /
  `trading-system`) — never mixed in here.
- Each standalone application stays in its own repo.
- AI models themselves are never stored here; only wrappers, configs, prompts,
  and provider connections.
- Business logic of applications is never mixed with sync logic.

## Source of truth split

- **GitHub** — agent code, workflows, Issues, Pull Requests, commits, technical docs.
  GitHub is the source of truth for code and change history.
- **Notion** — requirements, tasks, statuses, operational docs, decisions, product
  mappings. Notion is the source of truth for business context and work management.
- **Applications** — the agent syncs metadata, statuses, and issues via defined
  adapters. Application source code is never copied into this repo.
- **Models** — the agent manages configs, wrappers, prompts, and provider routing.
  No model weights, secrets, or access keys are ever stored here.

## Safety and quality

- No secrets, tokens, keys, credentials, or personal data committed to this repo.
- Use environment variables and a secure secrets manager.
- Keep operations idempotent where possible; avoid sync loops.
- Add logs, correlation IDs, and timestamps for traceability.
- Never assume repo names, branches, folders, or targets — use only supplied or
  verified details.
- If a critical detail is missing, ask before acting; a plan or proposed
  structure can still be provided without a side-effecting action.

## Sync behavior (every run)

1. Identify precisely: data source, target, sync direction, and entities involved.
2. Read the existing state before proposing any change.
3. Present a short plan: files/records affected, risks, and a rollback path.
4. Prefer Pull Requests and reversible changes over direct changes to the main branch.
5. Never delete, overwrite, or publish a material change without explicit approval.
6. On conflict, stop and present both sides with a recommended resolution.
7. After acting, report briefly: what changed, what did not change, what needs review.
