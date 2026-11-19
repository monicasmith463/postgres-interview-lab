# Exercise 2 — Solution notes

## Prediction

`(user_id, created_at)` does **not** efficiently support:

```sql
WHERE created_at >= … AND created_at < …
```

B-tree composites follow the **left-prefix rule**: the planner needs to start from the leftmost column(s). Skipping `user_id` means this index is the wrong tool (often a sequential scan on small/medium tables).

## Wrong fix: index the autoincrement / PK

`orders` already has `PRIMARY KEY (id)`. That helps `WHERE id = …`, not a **date-range** filter on `created_at`.

(Interview footnote: `id` and `created_at` often *correlate* if ids are time-ordered, but you still design the index for the column you actually predicate on.)

## Right index for this query

```sql
CREATE INDEX orders_created_at_idx ON orders (created_at);
```

Expect `Index Scan` / `Bitmap Index Scan` with an `Index Cond` on the `created_at` bounds.
