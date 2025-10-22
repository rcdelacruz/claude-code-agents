# Quick Start: Deploy to Cloudflare Pages

Get your documentation live on Cloudflare Pages in 5 minutes.

## Prerequisites

- Cloudflare account (free tier works)
- GitHub repository access
- Git installed locally

## Method 1: GitHub Actions (Fully Automated)

### Step 1: Get Cloudflare Credentials

1. Log in to [Cloudflare Dashboard](https://dash.cloudflare.com)
2. Go to **My Profile** > **API Tokens** > **Create Token**
3. Use "Edit Cloudflare Workers" template
4. Copy the API token
5. Go to **Pages** and copy your Account ID from the sidebar

### Step 2: Add GitHub Secrets

1. Go to your GitHub repo > **Settings** > **Secrets and variables** > **Actions**
2. Add two secrets:
   - `CLOUDFLARE_API_TOKEN`: Your API token
   - `CLOUDFLARE_ACCOUNT_ID`: Your Account ID

### Step 3: Deploy

```bash
git add .
git commit -m "Add Cloudflare Pages deployment"
git push origin main
```

Done! Your site will be live at `https://claude-code-agents-docs.pages.dev`

## Method 2: Wrangler CLI (Manual)

### Step 1: Install Wrangler

```bash
npm install -g wrangler
```

### Step 2: Login

```bash
wrangler login
```

This opens your browser to authenticate.

### Step 3: Deploy

```bash
# Build documentation
pip install mkdocs mkdocs-material
mkdocs build

# Deploy to Cloudflare Pages
wrangler pages deploy site --project-name=claude-code-agents-docs
```

Your site is now live!

## Method 3: Cloudflare Dashboard (No CLI)

### Step 1: Connect Git

1. Go to [Cloudflare Dashboard](https://dash.cloudflare.com) > **Pages**
2. Click **Create a project** > **Connect to Git**
3. Authorize GitHub and select your repository

### Step 2: Configure Build

- **Build command:** `pip install mkdocs mkdocs-material && mkdocs build`
- **Build output directory:** `site`
- **Production branch:** `main`

### Step 3: Deploy

Click **Save and Deploy**

Cloudflare will build and deploy your site automatically!

## Quick Commands

```bash
# Using npm scripts (after npm install)
npm run deploy:cloudflare        # Deploy to production
npm run deploy:preview           # Deploy as preview

# Using helper script
chmod +x .cloudflare/deploy.sh
./.cloudflare/deploy.sh

# Using Wrangler directly
wrangler pages deploy site --project-name=claude-code-agents-docs
```

## Troubleshooting

### "Command not found: wrangler"

Install globally:
```bash
npm install -g wrangler
```

Or use npx:
```bash
npx wrangler pages deploy site --project-name=claude-code-agents-docs
```

### "Authentication required"

```bash
wrangler login
```

### Build errors

Test locally first:
```bash
mkdocs serve
```

## Next Steps

- [Complete Deployment Guide](CLOUDFLARE-DEPLOYMENT.md)
- [Add Custom Domain](CLOUDFLARE-DEPLOYMENT.md#custom-domain-setup)
- [Configure Analytics](CLOUDFLARE-DEPLOYMENT.md#analytics)
- [Set up Preview Deployments](CLOUDFLARE-DEPLOYMENT.md#preview-deployments)

## Your Live URLs

After deployment:
- **Production:** `https://claude-code-agents-docs.pages.dev`
- **Dashboard:** `https://dash.cloudflare.com/pages/claude-code-agents-docs`

## Support

Need help? See [CLOUDFLARE-DEPLOYMENT.md](CLOUDFLARE-DEPLOYMENT.md) for detailed documentation.
