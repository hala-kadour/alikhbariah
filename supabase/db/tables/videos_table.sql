CREATE TABLE videos (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  title text NOT NULL,
  youtube_video_id text NOT NULL, -- نكتفي بـ ID الفيديو فقط (مثلاً: dQw4w9WgXcQ)
  category_id uuid REFERENCES video_categories(id) ON DELETE CASCADE,
  category_name text,
  thumbnail_url text -- صورة مخصصة من اليوتيوب من الرابط : https://img.youtube.com/vi/YOUTUBE_VIDEO_ID/hqdefault.jpg
  created_at timestamp with time zone default now()
);

alter table public.videos enable row level security;

create policy "Public can read videos"
on public.videos
for select
using (true);

create policy "Admin can insert videos"
on public.videos
for insert
with check (public.is_admin());

create policy "Admin can update videos"
on public.videos
for update
using (public.is_admin());

create policy "Admin can delete videos"
on public.videos
for delete
using (public.is_admin());