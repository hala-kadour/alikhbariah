create or replace function get_related_posts(current_post_id uuid, limit_count int default 10)
returns setof posts
language plpgsql
as $$
declare
    current_post_category_id uuid;
    current_post_location text;
begin
    -- 1. جلب بيانات الخبر الحالي (القسم والموقع) لتحديد المعايير
    select category_id, location 
    into current_post_category_id, current_post_location
    from posts 
    where id = current_post_id;

    -- 2. تنفيذ الاستعلام الموحد
    return query
    with related_by_tags as (
        -- جلب الـ IDs للأخبار التي تشترك في نفس الهاشتاغات
        select pt2.post_id
        from post_tags pt1
        join post_tags pt2 on pt1.tag_id = pt2.tag_id
        where pt1.post_id = current_post_id 
          and pt2.post_id != current_post_id
    )
    select p.*
    from posts p
    where p.id != current_post_id -- استثناء الخبر الحالي
      and p.status = 'published' -- الأخبار المنشورة فقط
      and (
          p.category_id = current_post_category_id -- نفس القسم
          or p.location = current_post_location    -- نفس الموقع
          or p.id in (select post_id from related_by_tags) -- نفس الهاشتاغات
      )
    order by p.published_at desc -- الأحدث أولاً
    limit limit_count;
end;
$$;