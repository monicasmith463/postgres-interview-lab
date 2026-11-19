# Postgres Interview Lab

Small, interview-oriented PostgreSQL drills. One exercise at a time — predict or write SQL before looking at solutions.

## Prerequisites

- Docker + Docker Compose, **or** any local PostgreSQL 14+

## Start Postgres (Docker)

```bash
docker compose up -d
```

Connection defaults (see `docker-compose.yml`):

```text
host: localhost
port: 5432
user: lab
password: lab
database: interview_lab
```

Connect with `psql`:

```bash
psql "postgresql://lab:lab@localhost:5432/interview_lab"
```

Stop:

```bash
docker compose down
```

## Exercises

| Folder | Topic |
|--------|--------|
| `exercise-01/` | Composite B-tree indexes & range queries |

Open the exercise folder, read `PROMPT.md`, load the SQL, then answer **before** opening anything under `solution/` (added after you attempt it).
