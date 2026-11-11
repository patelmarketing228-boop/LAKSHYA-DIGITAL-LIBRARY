-- Run this entire script in Supabase SQL Editor.
create table if not exists public.site_settings (
 id integer primary key default 1 check (id = 1),
 library_name text not null default 'LAKSHYA DIGITAL LIBRARY',
 tagline text default 'Your Dreams, Our Study Space — Focus Today, Succeed Tomorrow.',
 about text default '',
 phone text default '',
 whatsapp text default '',
 instagram text default '',
 google_review text default '',
 address text default '',
 hours text default '',
 maps_url text default ''
);
insert into public.site_settings (id) values (1) on conflict (id) do nothing;

create table if not exists public.gallery (
 id uuid primary key default gen_random_uuid(),
 title text not null,
 image_url text not null,
 created_at timestamptz default now()
);
create table if not exists public.offers (
 id uuid primary key default gen_random_uuid(),
 title text not null,
 description text default '',
 image_url text,
 active boolean default true,
 created_at timestamptz default now()
);

alter table public.site_settings enable row level security;
alter table public.gallery enable row level security;
alter table public.offers enable row level security;

-- Public can read website content.
create policy "Public read settings" on public.site_settings for select using (true);
create policy "Public read gallery" on public.gallery for select using (true);
create policy "Public read active offers" on public.offers for select using (active = true);

-- Only signed-in admins can change content.
create policy "Admins manage settings" on public.site_settings for all to authenticated using (true) with check (true);
create policy "Admins manage gallery" on public.gallery for all to authenticated using (true) with check (true);
create policy "Admins manage offers" on public.offers for all to authenticated using (true) with check (true);

-- Create a public storage bucket for website images.
insert into storage.buckets (id,name,public,file_size_limit,allowed_mime_types)
values ('library-media','library-media',true,5242880,array['image/jpeg','image/png','image/webp'])
on conflict (id) do nothing;
create policy "Public view library media" on storage.objects for select using (bucket_id = 'library-media');
create policy "Authenticated upload library media" on storage.objects for insert to authenticated with check (bucket_id = 'library-media');
create policy "Authenticated delete library media" on storage.objects for delete to authenticated using (bucket_id = 'library-media');
