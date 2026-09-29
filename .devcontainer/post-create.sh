#!/usr/bin/env bash
set -euo pipefail

git config --global core.pager cat

echo "Git configuration"
read -p "Git username: " GIT_USERNAME
read -p "Git email: " GIT_EMAIL

git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"

echo "git:        $(git --version)"
echo "dotnet:     $(dotnet --version)"
echo "psql:       $(psql --version)"

if command -v pg_isready >/dev/null 2>&1; then
  for _ in $(seq 1 30); do
    if pg_isready -h localhost -p 5432 -U postgres -d von_neuman >/dev/null 2>&1; then
      echo "postgres:   ready at localhost:5432 (db=von_neuman user=postgres)"
      exit 0
    fi
    sleep 1
  done
  echo "postgres:   not ready yet; the db service may still be starting" >&2
fi
