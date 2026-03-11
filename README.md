# WordPress + MySQL on Render

## Deploy (recommended)
1. Fork this repo (or use it directly).
2. In Render, click **New → Blueprint** and point to this repo’s `render.yaml` (Git URL).
3. Click **Deploy**. Render will provision both services:
   - `mysql` (private)
   - `wordpress` (web, public URL)
4. After the deploy finishes, open the WordPress service URL and complete the install wizard.

## Manual (UI) deploy (if not using Blueprint)
- Create **Private Service** from `/mysql` (Docker).
- Create **Web Service** from `/wordpress` (Docker).
- Set WP env vars:
