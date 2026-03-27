create or replace function notify_breaking_news()
returns trigger
language plpgsql
security definer
as $$
begin
  if NEW.is_breaking = true then
    perform
      net.http_post(
        url := 'https://rjeououblxzifduhxkvo.supabase.co/functions/v1/send-notification',
        headers := jsonb_build_object(
          'Content-Type', 'application/json',
          'Authorization', 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJqZW91b3VibHh6aWZkdWh4a3ZvIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3MDk4MjUwNCwiZXhwIjoyMDg2NTU4NTA0fQ.QB5enn6mK9I3kMii5lyzBJULII1o0UYaTBCAbpTfVWc'
        ),
        body := jsonb_build_object(
          'postId', NEW.id
        )
      );
  end if;

  return NEW;
end;
$$;

create trigger on_breaking_news_insert
after insert on public.posts
for each row
execute function notify_breaking_news();