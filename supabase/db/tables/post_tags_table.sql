create table if not exists post_tags (
  post_id uuid references posts(id) on delete cascade,
  tag_id uuid references tags(id) on delete cascade,
  primary key (post_id, tag_id)
);


alter table public.post_tags enable row level security;

create policy "Public can read post_tags"
on public.post_tags
for select
using (true);

create policy "Admin can insert post_tags"
on public.post_tags
for insert
with check (public.is_admin());

create policy "Admin can update post_tags"
on public.post_tags
for update
using (public.is_admin());

create policy "Admin can delete post_tags"
on public.post_tags
for delete
using (public.is_admin());