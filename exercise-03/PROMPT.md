# Exercise 3 — Two equalities + one range

**Write / predict before opening `solution/`.**

You still have (from earlier drills):

```sql
-- (user_id, created_at)
-- (created_at)
```

## New access pattern

Support:

```sql
SELECT id, created_at, amount_cents, status
FROM orders
WHERE user_id = 3
  AND status = 'paid'
  AND created_at >= '2024-02-01'
  AND created_at <  '2024-03-01'
ORDER BY created_at DESC;
```

## Tasks

1. **Predict:** Is `range_sort_idx (user_id, created_at)` enough for this query? What about filtering `status` — index condition vs filter after the scan?

2. **Write a new `CREATE INDEX`** on the filtered column(s) that best matches this pattern (equality columns, then the range). Paste the full statement.

3. **Optional:** After you create it, run:

```bash
psql "postgresql://lab:lab@localhost:5432/interview_lab" <<'SQL'
EXPLAIN (ANALYZE, BUFFERS)
SELECT id, created_at, amount_cents, status
FROM orders
WHERE user_id = 3
  AND status = 'paid'
  AND created_at >= '2024-02-01'
  AND created_at <  '2024-03-01'
ORDER BY created_at DESC;
SQL
```

## Reply with

- prediction on whether `(user_id, created_at)` alone is enough
- your new `CREATE INDEX …`
