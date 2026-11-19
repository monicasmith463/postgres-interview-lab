-- Postgres does NOT auto-index FK columns — add it yourself
CREATE INDEX shop_orders_user_id_idx ON shop_orders (user_id);
