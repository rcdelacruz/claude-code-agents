# Cloudflare Pages Deployment Guide

This guide explains how to deploy the MCP Sub-Agents documentation to Cloudflare Pages.

## Why Cloudflare Pages?

- **Fast Global CDN:** Content delivered from 300+ edge locations worldwide
- **Free Tier:** Unlimited bandwidth and requests on the free plan
- **Automatic HTTPS:** SSL certificates provisioned automatically
- **Preview Deployments:** Every commit gets a unique preview URL
- **Custom Domains:** Easy custom domain setup with automatic SSL
- **No Build Time Limits:** Unlike some platforms with build time restrictions

## Prerequisites

1. **Cloudflare Account:** Sign up at [cloudflare.com](https://cloudflare.com)
2. **GitHub Repository:** Your MCP Sub-Agents repository
3. **API Token:** Cloudflare API token with Pages permissions

## Deployment Options

You have three options for deploying to Cloudflare Pages:

1. **GitHub Actions (Recommended):** Automatic deployment on every push
2. **Cloudflare Dashboard:** Connect your GitHub repository directly
3. **Wrangler CLI:** Manual deployment from your local machine

## Option 1: GitHub Actions (Automated)

### Step 1: Get Cloudflare API Token

1. Log in to [Cloudflare Dashboard](https://dash.cloudflare.com)
2. Go to **My Profile** > **API Tokens**
3. Click **Create Token**
4. Use the **Edit Cloudflare Workers** template or create a custom token with:
   - Permissions: `Account.Cloudflare Pages — Edit`
   - Account Resources: `Include — Your Account`
5. Click **Continue to summary** > **Create Token**
6. **Copy the token** (you won't see it again!)

### Step 2: Get Cloudflare Account ID

1. In Cloudflare Dashboard, go to **Pages**
2. Your Account ID is shown in the right sidebar
3. Or find it in the URL: `https://dash.cloudflare.com/{ACCOUNT_ID}/pages`
4. Copy your Account ID

### Step 3: Add GitHub Secrets

1. Go to your GitHub repository
2. Navigate to **Settings** > **Secrets and variables** > **Actions**
3. Click **New repository secret**
4. Add two secrets:

   **Secret 1:**
   - Name: `CLOUDFLARE_API_TOKEN`
   - Value: `[Paste your API token]`

   **Secret 2:**
   - Name: `CLOUDFLARE_ACCOUNT_ID`
   - Value: `[Paste your Account ID]`

### Step 4: Create Cloudflare Pages Project

You can create the project in two ways:

**Method A: Let GitHub Actions create it (Easiest)**

Just push to the main branch. The GitHub Actions workflow will automatically create the project on first deployment.

**Method B: Create manually in Cloudflare Dashboard**

1. Go to **Cloudflare Dashboard** > **Pages**
2. Click **Create a project** > **Direct Upload**
3. Enter project name: `mcp-sub-agents-docs`
4. You can upload a placeholder or skip - GitHub Actions will deploy

### Step 5: Deploy

The GitHub Actions workflow is already configured in `.github/workflows/cloudflare-pages.yml`.

To deploy:

```bash
git add .
git commit -m "Add Cloudflare Pages deployment"
git push origin main
```

The workflow will:
1. Install Python and MkDocs dependencies
2. Build the documentation site
3. Deploy to Cloudflare Pages

### Step 6: Access Your Site

After deployment completes:

1. Go to **Cloudflare Dashboard** > **Pages** > **mcp-sub-agents-docs**
2. You'll see your deployment URL: `https://mcp-sub-agents-docs.pages.dev`
3. Every push to main creates a new production deployment
4. Every commit to other branches creates preview deployments

## Option 2: Cloudflare Dashboard (Direct Git Integration)

This option connects your GitHub repository directly to Cloudflare without GitHub Actions.

### Setup Steps

1. Go to **Cloudflare Dashboard** > **Pages**
2. Click **Create a project** > **Connect to Git**
3. Authorize Cloudflare to access your GitHub account
4. Select repository: `rcdelacruz/mcp-sub-agents`
5. Configure build settings:
   - **Production branch:** `main`
   - **Build command:** `pip install mkdocs mkdocs-material && mkdocs build`
   - **Build output directory:** `site`
   - **Root directory:** `/` (leave empty)
6. Click **Save and Deploy**

Cloudflare will now automatically deploy on every push to main.

**Note:** This method runs builds on Cloudflare's infrastructure instead of GitHub Actions.

## Option 3: Wrangler CLI (Manual Deployment)

For manual deployments or local testing.

### Install Wrangler

```bash
npm install -g wrangler
```

### Authenticate

```bash
wrangler login
```

This opens your browser to authenticate with Cloudflare.

### Build and Deploy

```bash
# Build the documentation
pip install mkdocs mkdocs-material
mkdocs build

# Deploy to Cloudflare Pages
wrangler pages deploy site --project-name=mcp-sub-agents-docs
```

### First Deployment

On first deployment, Wrangler will:
1. Create the Pages project if it doesn't exist
2. Upload all files from the `site/` directory
3. Return your deployment URL

### Subsequent Deployments

```bash
mkdocs build
wrangler pages deploy site --project-name=mcp-sub-agents-docs
```

### Production vs Preview

```bash
# Deploy to production (main branch)
wrangler pages deploy site --project-name=mcp-sub-agents-docs --branch=main

# Deploy as preview
wrangler pages deploy site --project-name=mcp-sub-agents-docs --branch=preview
```

## Custom Domain Setup

### Add Custom Domain

1. Go to **Cloudflare Dashboard** > **Pages** > **mcp-sub-agents-docs**
2. Navigate to **Custom domains** tab
3. Click **Set up a custom domain**
4. Enter your domain (e.g., `docs.example.com`)
5. Follow instructions to add DNS records

### DNS Configuration

If your domain is on Cloudflare:
- DNS records are added automatically
- SSL certificate provisioned within minutes

If your domain is elsewhere:
- Add a CNAME record pointing to `mcp-sub-agents-docs.pages.dev`
- Wait for DNS propagation (can take up to 48 hours)

### SSL/TLS

- Cloudflare automatically provisions SSL certificates
- HTTPS is enforced by default
- Certificate auto-renews

## Environment Variables

If your documentation needs build-time environment variables:

### Via GitHub Actions

Add to `.github/workflows/cloudflare-pages.yml`:

```yaml
- name: Build MkDocs site
  run: mkdocs build
  env:
    SITE_URL: https://mcp-sub-agents-docs.pages.dev
    # Add other environment variables here
```

### Via Cloudflare Dashboard

1. Go to **Pages** > **mcp-sub-agents-docs** > **Settings** > **Environment variables**
2. Add variables for:
   - **Production deployments**
   - **Preview deployments**

### Via Wrangler

```bash
wrangler pages deploy site --project-name=mcp-sub-agents-docs \
  --env SITE_URL=https://mcp-sub-agents-docs.pages.dev
```

## Build Configuration

### Current Setup

- **Build Command:** `pip install mkdocs mkdocs-material && mkdocs build`
- **Output Directory:** `site/`
- **Python Version:** 3.x
- **Node.js:** Not required (pure Python/MkDocs)

### Requirements

The documentation uses:
- **MkDocs:** Static site generator
- **MkDocs Material:** Theme
- **Python Markdown Extensions:** For enhanced features

All dependencies are installed during build with:
```bash
pip install mkdocs mkdocs-material
```

### Advanced Configuration

If you need specific Python packages, create `requirements.txt`:

```txt
mkdocs==1.5.3
mkdocs-material==9.5.3
pymdown-extensions==10.5
```

Then update build command:
```bash
pip install -r requirements.txt && mkdocs build
```

## Monitoring Deployments

### GitHub Actions

1. Go to your repository's **Actions** tab
2. View workflow runs for each deployment
3. Check logs for build errors

### Cloudflare Dashboard

1. Go to **Pages** > **mcp-sub-agents-docs**
2. View **Deployments** tab for history
3. Each deployment shows:
   - Build logs
   - Deployment status
   - Preview URL
   - Commit information

### Deployment Notifications

Set up notifications in:
- **Cloudflare Dashboard** > **Notifications**
- Configure alerts for deployment success/failure
- Receive notifications via email or webhook

## Preview Deployments

Cloudflare Pages creates preview deployments for every commit.

### Preview URLs

- **Production:** `https://mcp-sub-agents-docs.pages.dev`
- **Branch previews:** `https://[BRANCH].mcp-sub-agents-docs.pages.dev`
- **Commit previews:** `https://[SHORT-SHA].mcp-sub-agents-docs.pages.dev`

### Preview in Pull Requests

If using GitHub integration:
- Cloudflare automatically comments on PRs with preview URL
- Test changes before merging to main
- Each commit to PR updates the preview

## Rollback

### Via Cloudflare Dashboard

1. Go to **Pages** > **mcp-sub-agents-docs** > **Deployments**
2. Find the deployment you want to rollback to
3. Click **...** menu > **Rollback to this deployment**
4. Confirm rollback

### Via Wrangler

Deploy a specific commit:
```bash
git checkout [COMMIT-SHA]
mkdocs build
wrangler pages deploy site --project-name=mcp-sub-agents-docs
```

## Troubleshooting

### Build Failures

**Issue:** Build fails with Python or MkDocs errors

**Solution:**
1. Check GitHub Actions logs or Cloudflare build logs
2. Verify `mkdocs.yml` configuration
3. Test build locally:
   ```bash
   pip install mkdocs mkdocs-material
   mkdocs build
   ```
4. Check for plugin compatibility issues

### Deployment Not Updating

**Issue:** Changes not reflected on live site

**Solution:**
1. Check if deployment succeeded in dashboard
2. Clear browser cache (Ctrl+Shift+R)
3. Check Cloudflare's cache purge settings
4. Verify correct branch is deploying

### API Token Errors

**Issue:** GitHub Actions fails with authentication error

**Solution:**
1. Verify API token has correct permissions
2. Check token hasn't expired
3. Regenerate token if needed
4. Update GitHub secret with new token

### Build Output Directory Not Found

**Issue:** Deployment fails with "directory not found"

**Solution:**
1. Verify `mkdocs build` creates `site/` directory
2. Check build command includes `mkdocs build`
3. Ensure build doesn't fail before deployment step

### DNS/Custom Domain Issues

**Issue:** Custom domain not working

**Solution:**
1. Verify DNS records are correct
2. Wait for DNS propagation (up to 48 hours)
3. Check SSL certificate status
4. Use [DNS checker](https://dnschecker.org) to verify propagation

## Performance Optimization

### Image Optimization

If your docs include images:

1. Use WebP format for smaller file sizes
2. Compress images before committing
3. Use Cloudflare's automatic image optimization

### Caching

Cloudflare Pages automatically:
- Caches static assets
- Uses CDN edge locations
- Implements smart caching headers

### Build Optimization

Speed up builds:

1. **Cache Python packages** (GitHub Actions):
   ```yaml
   - name: Setup Python
     uses: actions/setup-python@v5
     with:
       python-version: '3.x'
       cache: 'pip'
   ```

2. **Minimize dependencies:** Only install required packages

3. **Use build cache:** Cloudflare caches dependencies between builds

## Comparison: Cloudflare Pages vs GitHub Pages

| Feature | Cloudflare Pages | GitHub Pages |
|---------|------------------|--------------|
| **Speed** | 300+ edge locations | GitHub CDN |
| **Bandwidth** | Unlimited (free) | 100GB/month |
| **Build Time** | 20 minutes | 10 minutes |
| **Custom Domains** | Unlimited | 1 per repo |
| **SSL** | Automatic | Automatic |
| **Preview Deploys** | Every commit | No |
| **Build Triggers** | Push, API, manual | Push only |
| **Analytics** | Built-in | Via Google Analytics |
| **Functions** | Cloudflare Workers | No |

## Security

### Best Practices

1. **API Token Security:**
   - Never commit tokens to repository
   - Use GitHub Secrets for tokens
   - Rotate tokens periodically
   - Use minimal permissions

2. **Access Control:**
   - Review Pages access settings
   - Enable Cloudflare Access for private docs
   - Use branch protection rules

3. **HTTPS Only:**
   - Cloudflare enforces HTTPS by default
   - Configure HSTS headers if needed

### Headers Configuration

Add security headers via `_headers` file in `site/`:

```
/*
  X-Frame-Options: DENY
  X-Content-Type-Options: nosniff
  X-XSS-Protection: 1; mode=block
  Referrer-Policy: strict-origin-when-cross-origin
  Permissions-Policy: camera=(), microphone=(), geolocation=()
```

Then build with this file included.

## Additional Features

### Analytics

Enable Cloudflare Web Analytics:

1. Go to **Pages** > **mcp-sub-agents-docs** > **Analytics**
2. Enable **Web Analytics**
3. View traffic, performance, and visitor data

### Access Control

For private documentation:

1. Enable **Cloudflare Access**
2. Configure authentication methods (Google, GitHub, etc.)
3. Set access policies

### Functions (Advanced)

Add serverless functions to your docs:

1. Create `functions/` directory in repository
2. Add JavaScript/TypeScript functions
3. Deploy with Pages - functions run on Cloudflare Workers

## Support Resources

- **Cloudflare Pages Docs:** [developers.cloudflare.com/pages](https://developers.cloudflare.com/pages)
- **Wrangler Docs:** [developers.cloudflare.com/workers/wrangler](https://developers.cloudflare.com/workers/wrangler)
- **MkDocs Docs:** [mkdocs.org](https://www.mkdocs.org)
- **Community Discord:** [Cloudflare Developers Discord](https://discord.gg/cloudflaredev)

## Next Steps

After successful deployment:

1. Set up a custom domain (optional)
2. Configure analytics
3. Enable preview comments on PRs
4. Set up deployment notifications
5. Optimize build times
6. Add security headers

## Quick Reference

### Useful Commands

```bash
# Install dependencies
pip install mkdocs mkdocs-material

# Build locally
mkdocs build

# Serve locally
mkdocs serve

# Deploy with Wrangler
wrangler pages deploy site --project-name=mcp-sub-agents-docs

# Check deployment status
wrangler pages deployment list --project-name=mcp-sub-agents-docs
```

### Important URLs

- **Cloudflare Dashboard:** https://dash.cloudflare.com
- **Pages Dashboard:** https://dash.cloudflare.com/pages
- **Your Site:** https://mcp-sub-agents-docs.pages.dev
- **API Documentation:** https://developers.cloudflare.com/pages

### GitHub Actions Workflow

Location: `.github/workflows/cloudflare-pages.yml`

Triggers on:
- Push to main branch
- Manual workflow dispatch

Required secrets:
- `CLOUDFLARE_API_TOKEN`
- `CLOUDFLARE_ACCOUNT_ID`
