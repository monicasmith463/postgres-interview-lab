-- Preferred composite for: equality on user_id + range on created_at
CREATE INDEX range_sort_idx ON orders (user_id, created_at);

-- Contrast only (do not keep both unless comparing plans):
-- CREATE INDEX orders_created_user_idx ON orders (created_at, user_id);
