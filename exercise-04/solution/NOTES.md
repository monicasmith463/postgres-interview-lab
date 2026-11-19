# Exercise 4 — Solution notes

## Statement outcomes

| # | SQL | Result | Why |
|---|-----|--------|-----|
| A | `INSERT … (99, 1000)` | **Fail** | FK — user 99 missing |
| B | `INSERT … (1, 0)` | **Fail** | CHECK — `amount_cents > 0` |
| C | `INSERT … (2, 500)` | **Succeed** | Valid FK + CHECK |
| D | `DELETE shop_users WHERE id = 1` | **Fail** | FK — children still reference user 1 (default restrict / no action) |

FK ≠ CHECK: FK is about **relationships**; CHECK is about **row-local rules**.

## Auto-index myth (Postgres)

**No** — declaring `REFERENCES` does **not** create an index on the referencing column (`shop_orders.user_id`). You only get indexes that you (or `PRIMARY KEY` / `UNIQUE`) create.

Interview habit:

```sql
CREATE INDEX shop_orders_user_id_idx ON shop_orders (user_id);
```

Why it matters: joins, `ON DELETE` checks, and “orders for user X” lookups otherwise seq-scan the child table.
