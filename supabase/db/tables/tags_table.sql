create table if not exists tags (
  id uuid primary key default gen_random_uuid(),
  name text not null,
);


alter table public.tags enable row level security;

create policy "Public can read tags"
on public.tags
for select
using (true);

create policy "Admin can insert tags"
on public.tags
for insert
with check (public.is_admin());

create policy "Admin can update tags"
on public.tags
for update
using (public.is_admin());

create policy "Admin can delete tags"
on public.tags
for delete
using (public.is_admin());
