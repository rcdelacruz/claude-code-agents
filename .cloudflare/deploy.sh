#!/bin/bash

# Quick deployment script for Cloudflare Pages
# This script builds and deploys the documentation to Cloudflare Pages

set -e

echo "Building MkDocs documentation..."
mkdocs build

echo "Deploying to Cloudflare Pages..."
wrangler pages deploy site --project-name=mcp-sub-agents-docs

echo "Deployment complete!"
echo "Your site will be available at: https://mcp-sub-agents-docs.pages.dev"
