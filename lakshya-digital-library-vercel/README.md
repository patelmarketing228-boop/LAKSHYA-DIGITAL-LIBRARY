# Lakshya Digital Library

A Next.js landing page with a Supabase-powered admin panel for editing library details, uploading gallery photos and publishing offer banners.

## 1. Run locally

```bash
npm install
cp .env.example .env.local
npm run dev
```

Open http://localhost:3000

## 2. Configure Supabase

1. Create a project at https://supabase.com.
2. Open **Project Settings → API** and copy the Project URL and `anon` / publishable key.
3. Add them to `.env.local`:

```env
NEXT_PUBLIC_SUPABASE_URL=https://YOUR_PROJECT.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=YOUR_SUPABASE_ANON_KEY
```

4. Open **SQL Editor** in Supabase and run all SQL in `supabase/schema.sql`.
5. In **Authentication → Users**, create your admin user with email and password. Disable public sign-ups if you only want yourself to access admin.

Admin page: `/admin`

## 3. Deploy to Vercel

1. Push this project to a GitHub repository.
2. In Vercel, choose **Add New → Project** and import that repository.
3. Add both environment variables under **Project Settings → Environment Variables**.
4. Deploy. Redeploy after changing environment variables.

## 4. Important setup

- Replace the placeholder address, phone, WhatsApp number, Instagram URL, Google review URL and Maps URL from `/admin`.
- WhatsApp must include country code, digits only, e.g. `919876543210`.
- Admin photo uploads use the public `library-media` Supabase Storage bucket. Never expose a Supabase service-role key in frontend code.
- Google review button opens your Google review link; visitors leave ratings on Google. This site does not fabricate or store Google ratings.
- The initial hero and gallery fallback images are remote Unsplash images. Replace them with your own library photos through the admin panel.
- This starter includes basic content management. For production, consider adding admin role restrictions (rather than allowing every authenticated Supabase user), image replacement cleanup, audit logs, rate limiting and a custom domain.

## Stack

- Next.js 14 / React 18
- Tailwind CSS
- Supabase Auth, Postgres and Storage
