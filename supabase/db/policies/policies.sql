create policy "Public read categories"
on categories for select
using (is_active = true);

create policy "Public read published posts"
on posts for select
using (status = 'published');

create policy "Public read tags"
on tags for select
using (true);

create policy "Public read post_tags"
on post_tags for select
using (true);

create policy "Public read live stream"
on live_streams for select
using (is_active = true);

create policy "Insert devices"
on devices for insert
with check (true);

-------------------------------------------------------------------------------
create policy "public app_users are viewable by every one"
on public.app_users for select
using(true);

create policy "user can update ther app_user"
on public.app_users for update
using(auth.uid() = id)

