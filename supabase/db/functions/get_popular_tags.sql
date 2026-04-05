create or replace function get_popular_tags()
returns setof tags as $$
begin
  return query
  select t.*
  from tags t
  join post_tags pt on t.id = pt.tag_id
  group by t.id
  order by count(pt.post_id) desc
  limit 6;
end;
$$ language plpgsql;