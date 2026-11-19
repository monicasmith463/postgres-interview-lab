# Exercise 1 — Composite B-tree index + range query

**Do not open a solution folder yet.** Predict / write first.

## Setup

From the repo root (Postgres already running — see README):

```bash
psql "postgresql://lab:lab@localhost:5432/interview_lab" -f exercise-01/schema.sql
psql "postgresql://lab:lab@localhost:5432/interview_lab" -f exercise-01/seed.sql
```

Sanity check:

```bash
psql "postgresql://lab:lab@localhost:5432/interview_lab" -c "SELECT count(*) FROM orders;"
psql "postgresql://lab:lab@localhost:5432/interview_lab" -c "SELECT user_id, min(created_at), max(created_at) FROM orders GROUP BY user_id ORDER BY 1;"
```

## Scenario

Product wants: **all orders for one user in a date window**, newest first. Example shape:

```sql
SELECT id, created_at, amount_cents, status
FROM orders
WHERE user_id = 3
  AND created_at >= '2024-02-01'
  AND created_at <  '2024-03-01'
ORDER BY created_at DESC;
```

(You may tweak the dates; keep **equality on `user_id`** and a **range on `created_at`**.)

## Your tasks (answer before peeking)

1. **Write** a `CREATE INDEX` that you would add for this access pattern. Use a **composite B-tree** index.

2. **Predict:** For that query, does column order matter between these two?

   - `(user_id, created_at)`
   - `(created_at, user_id)`

   Which one (if either) is the better fit, and **why** in one or two sentences? Interview-style: think about how a B-tree walks equality vs range predicates.

3. **Optional stretch:** After you create your preferred index, run `EXPLAIN (ANALYZE, BUFFERS)` on the query. What scan/index type do you expect to see?

## How to reply

Paste back:

- your `CREATE INDEX` statement
- your prediction on `(user_id, created_at)` vs `(created_at, user_id)`
- (optional) your `EXPLAIN` plan snippet once you’ve tried it

Then we’ll reveal / compare.
