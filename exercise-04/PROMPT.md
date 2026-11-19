# Exercise 4 — Foreign keys: what they enforce (and what they don’t)

**Predict before opening `solution/`.**

## Setup

```bash
psql "postgresql://lab:lab@localhost:5432/interview_lab" -f exercise-04/schema.sql
psql "postgresql://lab:lab@localhost:5432/interview_lab" -f exercise-04/seed.sql
```

`shop_orders.user_id` has `REFERENCES shop_users (id)`. There is also `CHECK (amount_cents > 0)`.

## Tasks — answer in chat first

1. **Predict** which of these succeed vs fail (and why — FK vs CHECK vs neither):

```sql
INSERT INTO shop_orders (user_id, amount_cents) VALUES (99, 1000);
INSERT INTO shop_orders (user_id, amount_cents) VALUES (1, 0);
INSERT INTO shop_orders (user_id, amount_cents) VALUES (2, 500);
DELETE FROM shop_users WHERE id = 1;
```

2. **Predict:** After creating the FK above, did Postgres automatically create an **index** on `shop_orders.user_id`? Yes/no, and one sentence why that matters in interviews.

3. Then **inspect** (don’t change answers after — just check):

```bash
psql "postgresql://lab:lab@localhost:5432/interview_lab" <<'SQL'
-- try the four statements one at a time; note errors
INSERT INTO shop_orders (user_id, amount_cents) VALUES (99, 1000);
INSERT INTO shop_orders (user_id, amount_cents) VALUES (1, 0);
INSERT INTO shop_orders (user_id, amount_cents) VALUES (2, 500);
DELETE FROM shop_users WHERE id = 1;

-- list indexes on shop_orders
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'shop_orders'
ORDER BY 1;
SQL
```

## Reply with

- succeed/fail for each of the four statements (+ brief why)
- yes/no on auto-index for the FK column
