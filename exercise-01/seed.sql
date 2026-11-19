-- Deterministic seed: a few users, many orders across dates
TRUNCATE orders RESTART IDENTITY;

INSERT INTO orders (user_id, created_at, amount_cents, status)
SELECT
  (gs % 5) + 1 AS user_id,                          -- users 1..5
  timestamptz '2024-01-01 00:00:00+00'
    + ((gs * 3) || ' hours')::interval AS created_at,
  500 + (gs * 17) % 20000 AS amount_cents,
  CASE WHEN gs % 11 = 0 THEN 'refunded' ELSE 'paid' END AS status
FROM generate_series(1, 2000) AS gs;
