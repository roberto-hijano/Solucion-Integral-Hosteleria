# AGENTS.md

Hotel stack (English layout). Verified 2026-09-22 on Linux Mint: `docker compose` up works, `web:200`, `db` healthy.

- Run: `cp infra/docker/.env.example infra/docker/.env` (set `POSTGRES_PASSWORD`), then `docker compose --file infra/docker/compose.yml up -d` / `down`. Web on `${WEB_PORT:-8080}`.
- Never commit `infra/docker/.env` (gitignored). No build/test/lint yet.
- Layout: `services/{web,booking-engine,front-desk,intranet}`, `infra/{docker,proxmox,network,backup,monitoring}`, `docs/`, `scripts/`.
