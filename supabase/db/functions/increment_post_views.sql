create or replace function increment_post_views(post_id uuid)
returns void as $$
begin
  update posts
  set views_count = views_count + 1
  where id = post_id;
end;
$$ language plpgsql security definer;