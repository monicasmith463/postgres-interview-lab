-- Exercise 4: FK vs what Postgres actually creates
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS shop_orders;
DROP TABLE IF EXISTS shop_users;

CREATE TABLE shop_users (
  id    integer PRIMARY KEY,
  email text    NOT NULL UNIQUE
);

CREATE TABLE shop_orders (
  id          bigserial PRIMARY KEY,
  user_id     integer      NOT NULL REFERENCES shop_users (id),
  created_at  timestamptz  NOT NULL DEFAULT now(),
  amount_cents integer     NOT NULL CHECK (amount_cents > 0)
);
