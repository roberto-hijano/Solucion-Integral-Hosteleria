# Booking Engine

Minimal hotel reservation model. Apply with `psql` against the `db` service.

```bash
docker compose --file infra/docker/compose.yml up -d
docker compose --file infra/docker/compose.yml exec db psql -U hotel -d hotel -f /docker-entrypoint-initdb.d/schema.sql
# or: cat services/booking-engine/schema.sql | docker compose --file infra/docker/compose.yml exec -T db psql -U hotel -d hotel
```
