CREATE OR REPLACE FUNCTION handle_post_publishing()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.status = 'published' AND (OLD.status IS NULL OR OLD.status != 'published') THEN
        NEW.published_at = NOW();
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_handle_post_publishing
BEFORE INSERT OR UPDATE ON posts
FOR EACH ROW
EXECUTE FUNCTION handle_post_publishing();