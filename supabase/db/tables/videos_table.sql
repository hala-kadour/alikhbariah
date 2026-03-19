CREATE TABLE videos (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  title text NOT NULL,
  youtube_video_id text NOT NULL, -- نكتفي بـ ID الفيديو فقط (مثلاً: dQw4w9WgXcQ)
  category_id uuid REFERENCES video_categories(id) ON DELETE CASCADE,
  category_name text,
  thumbnail_url text -- صورة مخصصة من اليوتيوب من الرابط : https://img.youtube.com/vi/YOUTUBE_VIDEO_ID/hqdefault.jpg
  created_at timestamp with time zone default now()
);