TRUNCATE shop_orders, shop_users RESTART IDENTITY;

INSERT INTO shop_users (id, email) VALUES
  (1, 'ada@example.com'),
  (2, 'linus@example.com');

INSERT INTO shop_orders (user_id, created_at, amount_cents) VALUES
  (1, '2024-02-01 10:00:00+00', 2500),
  (1, '2024-02-03 11:00:00+00', 1800),
  (2, '2024-02-02 09:00:00+00', 9900);
