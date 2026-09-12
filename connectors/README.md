# connectors/

Connections to GitHub, Notion, Slack, Make, Trinity OS, and any other
external system the sync agent talks to. Each connector should be isolated,
config-driven, and free of embedded secrets (use env vars / a secrets manager).
