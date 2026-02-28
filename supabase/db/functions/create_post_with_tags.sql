CREATE OR REPLACE FUNCTION create_post_with_tags(
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
) RETURNS UUID AS $$
DECLARE
    v_post_id UUID;
    v_tag_name TEXT;
    v_tag_id UUID;
BEGIN
    INSERT INTO posts (title, summary, location, content, image_url, category_id, category_name, is_breaking, is_featured, status)
    VALUES (p_title, p_summary, p_location, p_content, p_image_url, p_category_id, p_category_name, p_is_breaking, p_is_featured, p_status)
    RETURNING id INTO v_post_id;

    FOREACH v_tag_name IN ARRAY p_tag_names
    LOOP
        INSERT INTO tags (name)
        VALUES (v_tag_name)
        ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name 
        RETURNING id INTO v_tag_id;

        INSERT INTO post_tags (post_id, tag_id)
        VALUES (v_post_id, v_tag_id)
        ON CONFLICT DO NOTHING;
    END LOOP;

    RETURN v_post_id;
END;
$$ LANGUAGE plpgsql;