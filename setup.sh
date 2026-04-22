#!/bin/bash
# BlkOps GitHub Setup Script
# Usage: bash setup.sh YOUR_GITHUB_PERSONAL_ACCESS_TOKEN
#
# Get a token at: https://github.com/settings/tokens
# Required scopes: repo (full control of private repositories)

set -e

TOKEN=$1
GITHUB_USERNAME="BLKSAge"
REPO_NAME="blkops"
DESCRIPTION="AI-powered job search operations framework. Adapted from andrew-shwetzer/career-ops-plugin."

if [ -z "$TOKEN" ]; then
  echo "Usage: bash setup.sh YOUR_GITHUB_TOKEN"
  echo "Get a token at: https://github.com/settings/tokens (needs 'repo' scope)"
  exit 1
fi

echo "Creating GitHub repository: $GITHUB_USERNAME/$REPO_NAME..."

# Create the repo via GitHub API
RESPONSE=$(curl -s -w "\n%{http_code}" -X POST \
  -H "Authorization: token $TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/user/repos \
  -d "{
    \"name\": \"$REPO_NAME\",
    \"description\": \"$DESCRIPTION\",
    \"private\": false,
    \"has_issues\": true,
    \"has_projects\": false,
    \"has_wiki\": false,
    \"auto_init\": false
  }")

HTTP_CODE=$(echo "$RESPONSE" | tail -1)
BODY=$(echo "$RESPONSE" | head -1)

if [ "$HTTP_CODE" = "201" ]; then
  echo "Repository created successfully."
elif [ "$HTTP_CODE" = "422" ]; then
  echo "Repository already exists. Proceeding with push..."
else
  echo "Error creating repository (HTTP $HTTP_CODE):"
  echo "$BODY"
  exit 1
fi

# Initialize git and push
echo "Initializing git and pushing files..."

git init
git add .
git commit -m "Initial commit: BlkOps v1.0

AI-powered job search operations framework.
Adapted from andrew-shwetzer/career-ops-plugin.
See ATTRIBUTION.md for full credits."

git branch -M main
git remote add origin https://$TOKEN@github.com/$GITHUB_USERNAME/$REPO_NAME.git
git push -u origin main

echo ""
echo "Done! BlkOps is live at:"
echo "https://github.com/$GITHUB_USERNAME/$REPO_NAME"
