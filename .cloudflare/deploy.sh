#!/bin/bash

# Quick deployment script for Cloudflare Pages
# This script builds and deploys the documentation to Cloudflare Pages

set -e

echo "Building MkDocs documentation..."
mkdocs build

echo "Deploying to Cloudflare Pages..."
wrangler pages deploy site --project-name=claude-code-agents-docs

echo "Deployment complete!"
echo "Your site will be available at: https://claude-code-agents-docs.pages.dev"
