# Exercise 2 — Left-prefix rule (skipping the leading column)

**Predict / write before opening `solution/`.**

Assumes Exercise 1 index still exists:

```sql
CREATE INDEX range_sort_idx ON orders (user_id, created_at);
```

## Query (no `user_id` predicate)

```sql
SELECT id, user_id, created_at, amount_cents
FROM orders
WHERE created_at >= '2024-02-01'
  AND created_at <  '2024-03-01'
ORDER BY created_at;
```

## Tasks

1. **Predict:** Can `range_sort_idx` efficiently support this query? Why or why not? (left-prefix / leading-column rule)

2. **Run and check:**

```bash
psql "postgresql://lab:lab@localhost:5432/interview_lab" <<'SQL'
EXPLAIN (ANALYZE, BUFFERS)
SELECT id, user_id, created_at, amount_cents
FROM orders
WHERE created_at >= '2024-02-01'
  AND created_at <  '2024-03-01'
ORDER BY created_at;
SQL
```

3. **Design:** What index would you add for *this* access pattern? Write the `CREATE INDEX`.

## Reply with

- your prediction (and what `EXPLAIN` showed)
- your `CREATE INDEX` for the date-only query
