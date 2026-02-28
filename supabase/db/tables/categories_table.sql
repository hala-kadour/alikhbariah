create extension if not exists "pgcrypto";

create table if not exists categories (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  image_url text,
  is_active boolean default true,
  created_at timestamp with time zone default now()
);
