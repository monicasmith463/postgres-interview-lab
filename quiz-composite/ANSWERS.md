# Composite indexes — quiz answer key

**Q1.** `(user_id, created_at)` — equality before range.

**Q2.** No (left-prefix). Write a new `CREATE INDEX` on `created_at`.

**Q3.** e.g. `CREATE INDEX … ON orders (user_id, status, created_at);`
