CREATE TABLE breaking_news (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  content text NOT NULL, -- نص الخبر الذي سيظهر في الشريط
  is_urgent boolean DEFAULT false, -- إذا كان الخبر عاجلاً جداً (لتغيير لونه مثلاً)
  is_active boolean DEFAULT true, -- للتحكم في ظهور الخبر
  created_at timestamp with time zone default now()
);

alter table public.breaking_news enable row level security;

create policy "Public can read breaking_news"
on public.breaking_news
for select
using (true);

create policy "Admin can insert breaking_news"
on public.breaking_news
for insert
with check (public.is_admin());

create policy "Admin can update breaking_news"
on public.breaking_news
for update
using (public.is_admin());

create policy "Admin can delete breaking_news"
on public.breaking_news
for delete
using (public.is_admin());