CREATE OR REPLACE FUNCTION set_category_name()
RETURNS TRIGGER AS $$
BEGIN
    SELECT name INTO NEW.category_name
    FROM categories
    WHERE id = NEW.category_id;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_set_category_name
BEFORE INSERT OR UPDATE ON posts
FOR EACH ROW
EXECUTE FUNCTION set_category_name();