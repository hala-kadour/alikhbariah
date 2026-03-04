create extension if not exists "pgcrypto";

create table if not exists categories (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  image_url text,
  is_active boolean default true,
  created_at timestamp with time zone default now()
);


alter table public.categories enable row level security;

create policy "Public can read categories"
on public.categories
for select
using (true);

create policy "Admin can insert categories"
on public.categories
for insert
with check (public.is_admin());

create policy "Admin can update categories"
on public.categories
for update
using (public.is_admin());

create policy "Admin can delete categories"
on public.categories
for delete
using (public.is_admin());