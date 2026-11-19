-- Exercise 1: orders table for composite index drills
DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
  id          bigserial PRIMARY KEY,
  user_id     integer      NOT NULL,
  created_at  timestamptz  NOT NULL,
  amount_cents integer     NOT NULL CHECK (amount_cents > 0),
  status      text         NOT NULL DEFAULT 'paid'
);
