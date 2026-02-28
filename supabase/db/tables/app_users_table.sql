create table public.app_users (
  id uuid references auth.users(id) on delete cascade not null primary key,
  email text,
  name text,
  is_active boolean default true,
  is_admin boolean default false,
  avatar_url text null,
  created_at timestamp default now()
)

alter table public.app_users enable row level security;