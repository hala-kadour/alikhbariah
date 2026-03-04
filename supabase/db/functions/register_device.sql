create or replace function public.register_device(
  token text,
  user_platform text
)
returns void
language plpgsql
security definer
as $$
begin
  insert into public.devices (fcm_token, platform)
  values (token, user_platform)
  on conflict (fcm_token)
  do nothing;
end;
$$;