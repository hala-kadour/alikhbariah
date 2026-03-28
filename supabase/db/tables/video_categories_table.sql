CREATE TABLE video_categories (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  name text NOT NULL, --  مثلاً: نشرات الأخبار , تقارير إخبارية , مؤتمر صحفي , متداول , تغطيات 
  image_url text,
  type text CHECK (type IN ('program', 'news_video')) -- للتمييز بين البرنامج والفقرة الإخبارية
);

alter table public.video_categories enable row level security;

create policy "Public can read video_categories"
on public.video_categories
for select
using (true);

create policy "Admin can insert video_categories"
on public.video_categories
for insert
with check (public.is_admin());

create policy "Admin can update video_categories"
on public.video_categories
for update
using (public.is_admin());

create policy "Admin can delete video_categories"
on public.video_categories
for delete
using (public.is_admin());
