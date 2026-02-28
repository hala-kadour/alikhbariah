create table if not exists live_streams (
  id uuid primary key default gen_random_uuid(),
  title text,
  stream_url text not null,
  thumbnail text,
  is_active boolean default false,
  created_at timestamp with time zone default now()
);
