-- For created_at-only range queries (left-prefix does not use trailing cols of other indexes)
CREATE INDEX orders_created_at_idx ON orders (created_at);
