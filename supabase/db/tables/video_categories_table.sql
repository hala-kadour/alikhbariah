CREATE TABLE video_categories (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  name text NOT NULL, --  مثلاً: نشرات الأخبار , تقارير إخبارية , مؤتمر صحفي , متداول , تغطيات 
  image_url text,
  type text CHECK (type IN ('program', 'news_video')) -- للتمييز بين البرنامج والفقرة الإخبارية
);
