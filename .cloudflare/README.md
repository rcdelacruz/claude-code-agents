# Cloudflare Deployment Scripts

Helper scripts for deploying to Cloudflare Pages.

## deploy.sh

Quick deployment script that builds and deploys in one command.

### Usage

```bash
# Make executable (first time only)
chmod +x .cloudflare/deploy.sh

# Run deployment
./.cloudflare/deploy.sh
```

### What it does

1. Builds MkDocs documentation (`mkdocs build`)
2. Deploys to Cloudflare Pages using Wrangler
3. Outputs deployment URL

### Requirements

- Wrangler CLI installed (`npm install -g wrangler`)
- Authenticated with Cloudflare (`wrangler login`)
- MkDocs installed (`pip install mkdocs mkdocs-material`)

## Alternative Methods

### Using npm scripts

```bash
# Install dependencies
npm install

# Deploy to production
npm run deploy:cloudflare

# Deploy as preview
npm run deploy:preview
```

### Using Wrangler directly

```bash
mkdocs build
wrangler pages deploy site --project-name=claude-code-agents-docs
```

### Using GitHub Actions

Push to main branch - automatic deployment via `.github/workflows/cloudflare-pages.yml`

## Troubleshooting

### "wrangler: command not found"

Install globally:
```bash
npm install -g wrangler
```

### Authentication issues

Login again:
```bash
wrangler login
```

### Build errors

Test locally:
```bash
mkdocs serve
```

## Documentation

- [Quick Start Guide](../QUICK-START-CLOUDFLARE.md)
- [Complete Deployment Guide](../CLOUDFLARE-DEPLOYMENT.md)
- [Main Documentation](../DOCUMENTATION.md)
