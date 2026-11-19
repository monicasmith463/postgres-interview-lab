-- Equalities first, then range. New name — do not reuse range_sort_idx.
CREATE INDEX orders_user_status_created_idx
  ON orders (user_id, status, created_at);
