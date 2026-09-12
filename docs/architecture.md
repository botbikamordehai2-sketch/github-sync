# Architecture

See the root README.md for the full architecture principles, source-of-truth
split (GitHub vs Notion vs apps vs models), and safety/quality rules.

## Open items (as of 2026-09-12)
- GitHub connector for this agent/session is installed with "All repositories"
  access at the GitHub App level, but the session/environment itself returned
  "GitHub access to this repository is not enabled for this session" for both
  `fx_strength` and this repo, and rejected repo creation via the API with
  "sessions are bound to their configured repositories." This means repo
  binding is configured somewhere in the Claude/Cowork product UI (per
  environment/task), separate from the GitHub App installation screen —
  still to be located and resolved.
