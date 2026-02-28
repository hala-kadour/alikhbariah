CREATE OR REPLACE FUNCTION get_dashboard_summary()
RETURNS JSON AS $$
DECLARE
    result JSON;
BEGIN
    SELECT json_build_object(
        -- الأرقام الإجمالية
        'total_posts', (SELECT COUNT(*) FROM posts),
        'total_views', (SELECT COALESCE(SUM(views_count), 0) FROM posts),
        'total_categories', (SELECT COUNT(*) FROM categories),
        'total_drafts', (SELECT COUNT(*) FROM posts WHERE status = 'draft'),
        
        -- بيانات المخطط الدائري (الفئات)
        'category_distribution', (
            SELECT json_agg(row_to_json(t)) FROM (
                SELECT category_name as name, COUNT(*) as value 
                FROM posts GROUP BY category_name
            ) t
        ),
        
        -- بيانات المخطط الخطّي (آخر 7 أيام)
        'weekly_views', (
            SELECT json_agg(row_to_json(w)) FROM (
                SELECT 
                    to_char(date_trunc('day', created_at), 'Dy') as day, -- اسم اليوم (Sat, Sun...)
                    SUM(views_count) as views
                FROM posts
                WHERE created_at >= now() - interval '7 days'
                GROUP BY date_trunc('day', created_at)
                ORDER BY date_trunc('day', created_at)
            ) w
        )
    ) INTO result;
    RETURN result;
END;
$$ LANGUAGE plpgsql;