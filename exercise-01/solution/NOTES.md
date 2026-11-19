# Exercise 1 — Solution notes

## Preferred index

```sql
CREATE INDEX range_sort_idx ON orders (user_id, created_at);
```

## Why column order matters

Rule of thumb for B-tree composites: **equality columns first, then range/sort columns**.

For `WHERE user_id = ? AND created_at >= ? AND created_at < ?`:

- `(user_id, created_at)` — seek to `user_id`, then scan only that user’s `created_at` range. One contiguous slice of the index.
- `(created_at, user_id)` — leading key is the range column, so Postgres cannot narrow to one user first. It may still use the index for the date window, then filter `user_id`, or skip it. Far less selective for this query shape.

Interview one-liner: *“Put equality predicates on the left of a composite B-tree; put the range (or ORDER BY) column after them.”*

## What you should see in EXPLAIN

With `(user_id, created_at)`, expect an **Index Scan** or **Bitmap Index Scan** on that index, with an **Index Cond** that includes both `user_id = …` and the `created_at` bounds.
