create table if not exists posts (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  summary text,
  location text,
  content text not null,
  image_url text,
  category_id uuid references categories(id) on delete set null,
  category_name text  not null,
  is_breaking boolean default false,
  is_featured boolean default false,
  views_count integer default 0,
  status text check (status in ('draft','published')) default 'draft',
  published_at timestamp with time zone,
  created_at timestamp with time zone default now()
);


alter table public.posts enable row level security;

create policy "Public can read posts"
on public.posts
for select
using (true);

create policy "Admin can insert posts"
on public.posts
for insert
with check (public.is_admin());

create policy "Admin can update posts"
on public.posts
for update
using (public.is_admin());

create policy "Admin can delete posts"
on public.posts
for delete
using (public.is_admin());