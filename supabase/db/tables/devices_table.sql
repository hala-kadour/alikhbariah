create table if not exists devices (
  id uuid primary key default gen_random_uuid(),
  fcm_token text not null,
  platform text,
  created_at timestamp with time zone default now()
);


alter table public.devices enable row level security;

create policy "Anyone can insert device token"
on public.devices
for insert
with check (true);