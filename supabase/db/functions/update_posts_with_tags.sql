CREATE OR REPLACE FUNCTION update_post_with_tags(
    p_post_id UUID,
    p_title TEXT,
    p_summary TEXT,
    p_location TEXT,
    p_content TEXT,
    p_image_url TEXT,
    p_category_id UUID,
    p_category_name TEXT,
    p_is_breaking BOOLEAN,
    p_is_featured BOOLEAN,
    p_status TEXT,
    p_tag_names TEXT[]
) RETURNS VOID AS $$
DECLARE
    v_tag_name TEXT;
    v_tag_id UUID;
BEGIN
    UPDATE posts SET
        title = p_title,
        summary = p_summary,
        location = p_location,
        content = p_content,
        image_url = p_image_url,
        category_id = p_category_id,
        category_name = p_category_name,
        is_breaking = p_is_breaking,
        is_featured = p_is_featured,
        status = p_status
    WHERE id = p_post_id;

    DELETE FROM post_tags WHERE post_id = p_post_id;

    FOREACH v_tag_name IN ARRAY p_tag_names
    LOOP
        INSERT INTO tags (name) VALUES (v_tag_name)
        ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name
        RETURNING id INTO v_tag_id;

        INSERT INTO post_tags (post_id, tag_id)
        VALUES (p_post_id, v_tag_id)
        ON CONFLICT DO NOTHING;
    END LOOP;
END;
$$ LANGUAGE plpgsql;