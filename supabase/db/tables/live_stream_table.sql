create table if not exists live_streams (
  id uuid primary key default gen_random_uuid(),
  title text,
  stream_url text not null,
  thumbnail text,
  is_active boolean default false,
  created_at timestamp with time zone default now()
);

alter table public.live_streams enable row level security;

create policy "Public can read live_streams"
on public.live_streams
for select
using (true);

create policy "Admin can insert live_streams"
on public.live_streams
for insert
with check (public.is_admin());

create policy "Admin can update live_streams"
on public.live_streams
for update
using (public.is_admin());

create policy "Admin can delete live_streams"
on public.live_streams
for delete
using (public.is_admin());
