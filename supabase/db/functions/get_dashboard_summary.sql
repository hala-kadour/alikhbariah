CREATE OR REPLACE FUNCTION get_dashboard_summary()
RETURNS JSON AS $$
DECLARE
    result JSON;
BEGIN
    SELECT json_build_object(
        'total_posts', (SELECT COUNT(*) FROM posts),
        'total_views', (SELECT COALESCE(SUM(views_count), 0) FROM posts),
        'total_categories', (SELECT COUNT(*) FROM categories),
        'total_drafts', (SELECT COUNT(*) FROM posts WHERE status = 'draft'),
        
        'category_distribution', (
            SELECT json_agg(row_to_json(t)) FROM (
                SELECT category_name as name, COUNT(*) as value 
                FROM posts GROUP BY category_name
            ) t
        ),
        
        'weekly_views', (
            SELECT json_agg(row_to_json(w)) FROM (
                -- هنا التعديل: نولد أيام الأسبوع ونربطها مع البيانات
                SELECT 
                    to_char(days.day, 'Dy') as day,
                    COALESCE(SUM(p.views_count), 0) as views
                FROM (
                    SELECT generate_series(
                        date_trunc('day', now()) - interval '6 days', 
                        date_trunc('day', now()), 
                        interval '1 day'
                    )::date as day
                ) days
                LEFT JOIN posts p ON date_trunc('day', p.created_at) = days.day
                GROUP BY days.day
                ORDER BY days.day ASC
            ) w
        )
    ) INTO result;
    RETURN result;
END;
$$ LANGUAGE plpgsql;