# Exercise 3 — Solution notes

## Preferred index

```sql
CREATE INDEX orders_user_status_created_idx
  ON orders (user_id, status, created_at);
```

(Use a **new** name — `range_sort_idx` was already `(user_id, created_at)` from Exercise 1.)

## Why this order

Two **equalities** (`user_id`, `status`), then the **range** (`created_at`).

Interview one-liner: *“All equality columns first (most selective first is a bonus), range/sort column last.”*

## Is `(user_id, created_at)` enough?

It can seek by `user_id` + `created_at`, but `status = 'paid'` is typically applied as a **Filter** afterward (rows read, then discarded). Putting `status` in the index lets it be part of the **Index Cond**.

Among equalities, `(user_id, status, …)` vs `(status, user_id, …)` are both valid; prefer the more selective leading column for your data.

## Note on small tables

With only ~2k rows, `EXPLAIN` may still pick another index (e.g. `created_at` alone). Design for the predicate shape; don’t overfit one tiny plan.
