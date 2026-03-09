create table notifications (
  id uuid primary key default gen_random_uuid(),
  title text,
  body text,
  image_url text,
  post_id uuid,
  created_at timestamptz default now()
);