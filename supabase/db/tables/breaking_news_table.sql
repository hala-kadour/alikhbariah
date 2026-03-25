CREATE TABLE breaking_news (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  content text NOT NULL, -- نص الخبر الذي سيظهر في الشريط
  is_urgent boolean DEFAULT false, -- إذا كان الخبر عاجلاً جداً (لتغيير لونه مثلاً)
  is_active boolean DEFAULT true, -- للتحكم في ظهور الخبر
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now())
);