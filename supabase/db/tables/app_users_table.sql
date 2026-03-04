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

create policy "public app_users are viewable by every one"
on public.app_users for select
using(true);

create policy "user can update ther app_user"
on public.app_users for update
using(auth.uid() = id)

