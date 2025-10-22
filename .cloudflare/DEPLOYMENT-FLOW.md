# Cloudflare Pages Deployment Flow

Visual guide to understanding the deployment process.

## Deployment Options Overview

```
┌─────────────────────────────────────────────────────────────┐
│                    DEPLOYMENT OPTIONS                        │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│  1. GitHub Actions (Automated)                               │
│     Push → GitHub → Build → Cloudflare → Live               │
│     Best for: Continuous deployment                          │
│                                                              │
│  2. Wrangler CLI (Manual)                                    │
│     Local → Build → Wrangler → Cloudflare → Live            │
│     Best for: Manual control                                 │
│                                                              │
│  3. Dashboard (Git Integration)                              │
│     Push → Cloudflare → Build → Live                        │
│     Best for: No GitHub Actions                              │
│                                                              │
└─────────────────────────────────────────────────────────────┘
```

## Method 1: GitHub Actions Workflow

```
┌──────────────┐
│  Developer   │
│  git push    │
└──────┬───────┘
       │
       ▼
┌──────────────────────────────────────────────────────────┐
│  GitHub Repository (main branch)                         │
└──────┬───────────────────────────────────────────────────┘
       │
       │ Triggers
       ▼
┌──────────────────────────────────────────────────────────┐
│  GitHub Actions Workflow                                 │
│  (.github/workflows/cloudflare-pages.yml)                │
├──────────────────────────────────────────────────────────┤
│  1. Checkout code                                        │
│  2. Setup Python 3.x                                     │
│  3. Install: mkdocs mkdocs-material                      │
│  4. Build: mkdocs build                                  │
│  5. Deploy: cloudflare/pages-action@v1                   │
└──────┬───────────────────────────────────────────────────┘
       │
       │ Uses secrets:
       │ - CLOUDFLARE_API_TOKEN
       │ - CLOUDFLARE_ACCOUNT_ID
       ▼
┌──────────────────────────────────────────────────────────┐
│  Cloudflare Pages                                        │
│  Project: claude-code-agents-docs                            │
├──────────────────────────────────────────────────────────┤
│  1. Receives build artifacts                             │
│  2. Deploys to CDN                                       │
│  3. Updates DNS                                          │
│  4. Provisions SSL                                       │
└──────┬───────────────────────────────────────────────────┘
       │
       ▼
┌──────────────────────────────────────────────────────────┐
│  Live Site                                               │
│  https://claude-code-agents-docs.pages.dev                   │
│  (300+ edge locations worldwide)                         │
└──────────────────────────────────────────────────────────┘
```

## Method 2: Wrangler CLI Workflow

```
┌──────────────┐
│  Developer   │
│  Local Dev   │
└──────┬───────┘
       │
       ▼
┌──────────────────────────────────────────────────────────┐
│  Local Build Process                                     │
├──────────────────────────────────────────────────────────┤
│  $ mkdocs build                                          │
│                                                          │
│  Creates: site/ directory                                │
│  Contains: index.html, assets/, etc.                     │
└──────┬───────────────────────────────────────────────────┘
       │
       ▼
┌──────────────────────────────────────────────────────────┐
│  Wrangler CLI Deployment                                 │
├──────────────────────────────────────────────────────────┤
│  $ wrangler pages deploy site \                          │
│    --project-name=claude-code-agents-docs                    │
│                                                          │
│  Actions:                                                │
│  1. Authenticates with Cloudflare                        │
│  2. Uploads files from site/                             │
│  3. Creates deployment                                   │
│  4. Returns deployment URL                               │
└──────┬───────────────────────────────────────────────────┘
       │
       ▼
┌──────────────────────────────────────────────────────────┐
│  Cloudflare Pages                                        │
│  Deployment ID: xxxxxxxx                                 │
│                                                          │
│  Live at: https://claude-code-agents-docs.pages.dev          │
└──────────────────────────────────────────────────────────┘
```

## Method 3: Dashboard Git Integration

```
┌──────────────┐
│  Developer   │
│  git push    │
└──────┬───────┘
       │
       ▼
┌──────────────────────────────────────────────────────────┐
│  GitHub Repository                                       │
│  Connected to Cloudflare Pages                           │
└──────┬───────────────────────────────────────────────────┘
       │
       │ Webhook triggers
       ▼
┌──────────────────────────────────────────────────────────┐
│  Cloudflare Build Environment                            │
├──────────────────────────────────────────────────────────┤
│  Build command:                                          │
│  pip install mkdocs mkdocs-material && mkdocs build     │
│                                                          │
│  Build output directory: site                            │
│                                                          │
│  Environment: Ubuntu with Python 3.x                     │
└──────┬───────────────────────────────────────────────────┘
       │
       ▼
┌──────────────────────────────────────────────────────────┐
│  Cloudflare CDN Deployment                               │
│  Automatic distribution to 300+ locations                │
└──────┬───────────────────────────────────────────────────┘
       │
       ▼
┌──────────────────────────────────────────────────────────┐
│  Live Site with Analytics                                │
│  https://claude-code-agents-docs.pages.dev                   │
└──────────────────────────────────────────────────────────┘
```

## File Structure and Deployment

```
Project Repository
├── docs/              ─────────┐
│   ├── index.md                │
│   ├── getting-started/        │ MkDocs Source
│   ├── architecture/           │
│   └── ...                     │
├── mkdocs.yml         ─────────┘
│                               │
│                               ▼
│                        ┌──────────────┐
│                        │ mkdocs build │
│                        └──────┬───────┘
│                               │
│                               ▼
└── site/              ─────────┐
    ├── index.html             │
    ├── assets/                │ Build Output
    ├── search/                │ (Deployed)
    └── ...                    │
                        ───────┘
                               │
                               ▼
                    ┌──────────────────┐
                    │ Cloudflare Pages │
                    │   CDN Network    │
                    └──────────────────┘
```

## Preview Deployments

```
┌──────────────────────────────────────────────────────────┐
│  Feature Branch / Pull Request                           │
└──────┬───────────────────────────────────────────────────┘
       │
       ▼
┌──────────────────────────────────────────────────────────┐
│  Automatic Preview Build                                 │
└──────┬───────────────────────────────────────────────────┘
       │
       ├─────────────────────────────────────────┐
       │                                         │
       ▼                                         ▼
┌─────────────────────┐           ┌─────────────────────────┐
│  Production Deploy  │           │  Preview Deploy         │
│  (main branch)      │           │  (feature branch)       │
├─────────────────────┤           ├─────────────────────────┤
│  URL: *.pages.dev   │           │  URL: [branch].*.dev    │
└─────────────────────┘           │  or: [sha].*.dev        │
                                  └─────────────────────────┘
```

## Rollback Process

```
┌──────────────────────────────────────────────────────────┐
│  Cloudflare Pages Dashboard                              │
│  Deployments Tab                                         │
├──────────────────────────────────────────────────────────┤
│  ✓ Deployment #123 (current) - 2 minutes ago            │
│  ✓ Deployment #122 - 1 hour ago                         │
│  ✓ Deployment #121 - 5 hours ago  ← Rollback to this    │
└──────┬───────────────────────────────────────────────────┘
       │
       │ Click: "..." → "Rollback to this deployment"
       ▼
┌──────────────────────────────────────────────────────────┐
│  Instant Rollback                                        │
│  (No rebuild required)                                   │
└──────┬───────────────────────────────────────────────────┘
       │
       ▼
┌──────────────────────────────────────────────────────────┐
│  Site reverted to Deployment #121                        │
│  Live in seconds                                         │
└──────────────────────────────────────────────────────────┘
```

## Custom Domain Flow

```
┌──────────────────────────────────────────────────────────┐
│  Your Custom Domain                                      │
│  docs.example.com                                        │
└──────┬───────────────────────────────────────────────────┘
       │
       │ DNS Configuration
       │ CNAME → claude-code-agents-docs.pages.dev
       ▼
┌──────────────────────────────────────────────────────────┐
│  Cloudflare Pages                                        │
│  Custom Domain Setup                                     │
├──────────────────────────────────────────────────────────┤
│  1. Verify domain ownership                              │
│  2. Provision SSL certificate                            │
│  3. Update routing                                       │
└──────┬───────────────────────────────────────────────────┘
       │
       ▼
┌──────────────────────────────────────────────────────────┐
│  https://docs.example.com                                │
│  (Automatic HTTPS with SSL)                              │
└──────────────────────────────────────────────────────────┘
```

## Quick Reference

### For GitHub Actions Setup:

1. Get API Token from Cloudflare
2. Add GitHub Secrets (CLOUDFLARE_API_TOKEN, CLOUDFLARE_ACCOUNT_ID)
3. Push to main branch
4. GitHub Actions runs automatically

### For Wrangler CLI Setup:

1. Install: `npm install -g wrangler`
2. Login: `wrangler login`
3. Build: `mkdocs build`
4. Deploy: `wrangler pages deploy site --project-name=claude-code-agents-docs`

### For Dashboard Setup:

1. Go to Cloudflare Dashboard → Pages
2. Connect GitHub repository
3. Configure build settings
4. Automatic deployment on push

## Monitoring

```
┌──────────────────────────────────────────────────────────┐
│  Deployment Monitoring                                   │
├──────────────────────────────────────────────────────────┤
│                                                          │
│  GitHub Actions      Cloudflare Dashboard               │
│  ├─ Build logs       ├─ Deployment status               │
│  ├─ Test results     ├─ Build logs                      │
│  └─ Deployment URL   ├─ Analytics                       │
│                      ├─ Performance metrics              │
│                      └─ Custom domain status             │
│                                                          │
└──────────────────────────────────────────────────────────┘
```

## Next Steps

After deployment:

1. Verify site is live at production URL
2. Set up custom domain (optional)
3. Configure analytics
4. Set up deployment notifications
5. Test preview deployments with a PR

## Documentation

- **Full Guide:** [CLOUDFLARE-DEPLOYMENT.md](../CLOUDFLARE-DEPLOYMENT.md)
- **Quick Start:** [QUICK-START-CLOUDFLARE.md](../QUICK-START-CLOUDFLARE.md)
- **Setup Summary:** [CLOUDFLARE-SETUP-SUMMARY.md](../CLOUDFLARE-SETUP-SUMMARY.md)
