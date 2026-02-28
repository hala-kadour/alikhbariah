create index if not exists idx_posts_category
on posts(category_id);

create index if not exists idx_posts_status
on posts(status);

create index if not exists idx_posts_published
on posts(published_at desc);

create index if not exists idx_posts_breaking
on posts(is_breaking);

create index if not exists idx_posts_featured
on posts(is_featured);
