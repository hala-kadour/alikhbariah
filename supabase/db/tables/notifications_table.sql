create table notifications (
  id uuid primary key default gen_random_uuid(),
  title text,
  body text,
  image_url text,
  post_id uuid,
  created_at timestamptz default now()
);

alter table public.notifications enable row level security;

create policy "Public can read notifications"
on public.notifications
for select
using (true);

create policy "Admin can insert notifications"
on public.notifications
for insert
with check (public.is_admin());

create policy "Admin can update notifications"
on public.notifications
for update
using (public.is_admin());

create policy "Admin can delete notifications"
on public.notifications
for delete
using (public.is_admin());