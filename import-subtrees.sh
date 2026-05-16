#!/usr/bin/env bash
set -euo pipefail

# Import configured repositories as git subtrees while preserving full history.
# Usage:
#   ./import-subtrees.sh [--dry-run] [--yes]

# Keep this empty for paths like: Zeeshan506/repo-name
# Do NOT use "." or "./" here, because git subtree can fail with:
#   error: invalid path './owner/repo/.gitignore'
DEST_ROOT=""
KEEP_REMOTES=0

REPO_URLS=(
  "git@github.com:Zeeshan506/ArchTechnology-Internship-Task-3.git"
)

DRY_RUN=0
ASSUME_YES=0

for arg in "$@"; do
  case "$arg" in
  --dry-run) DRY_RUN=1 ;;
  --yes) ASSUME_YES=1 ;;
  -h | --help)
    cat <<'USAGE'
Import configured repositories as git subtrees while preserving full history.

Options:
  --dry-run   Print commands without executing
  --yes       Skip confirmation prompt
  -h, --help  Show this help
USAGE
    exit 0
    ;;
  *)
    echo "Unknown option: $arg" >&2
    exit 1
    ;;
  esac
done

die() {
  echo "ERROR: $*" >&2
  exit 1
}

run_cmd() {
  if [ "$DRY_RUN" -eq 1 ]; then
    printf '[dry-run]'
    printf ' %q' "$@"
    printf '\n'
  else
    "$@"
  fi
}

require_tooling() {
  command -v git >/dev/null 2>&1 || die "git is required"
  git subtree --help >/dev/null 2>&1 || die "git subtree is required"
}

ensure_repo_state() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || die "Run inside a git repository"

  local repo_root
  repo_root="$(git rev-parse --show-toplevel)"
  cd "$repo_root"

  git rev-parse --verify HEAD >/dev/null 2>&1 || die "Create an initial commit before importing subtrees"

  if [ "$DRY_RUN" -eq 0 ] && [ -n "$(git status --porcelain)" ]; then
    die "Working tree is not clean. Commit or stash changes before import"
  fi
}

sanitize_remote_name() {
  local input="$1"
  echo "$input" | tr '[:upper:]' '[:lower:]' | tr -c 'a-z0-9._-' '-'
}

remote_exists() {
  local name="$1"
  git remote get-url "$name" >/dev/null 2>&1
}

ensure_remote_name() {
  local preferred="$1"
  local url="$2"

  if remote_exists "$preferred"; then
    local existing_url
    existing_url="$(git remote get-url "$preferred")"
    if [ "$existing_url" = "$url" ]; then
      echo "$preferred"
      return 0
    fi
  fi

  local i=1
  local candidate="$preferred"
  while remote_exists "$candidate"; do
    candidate="${preferred}-${i}"
    i=$((i + 1))
  done
  echo "$candidate"
}

remote_has_branch() {
  local url="$1"
  local branch="$2"
  git ls-remote --exit-code --heads "$url" "refs/heads/$branch" >/dev/null 2>&1
}

detect_default_branch() {
  local url="$1"

  local head_ref
  head_ref="$(git ls-remote --symref "$url" HEAD 2>/dev/null | awk '/^ref:/ {print $2}' | sed 's#refs/heads/##' | head -n1)"
  if [ -n "$head_ref" ]; then
    echo "$head_ref"
    return 0
  fi

  if remote_has_branch "$url" "main"; then
    echo "main"
    return 0
  fi

  if remote_has_branch "$url" "master"; then
    echo "master"
    return 0
  fi

  local first_branch
  first_branch="$(git ls-remote --heads "$url" 2>/dev/null | awk '{print $2}' | sed 's#refs/heads/##' | head -n1)"
  if [ -n "$first_branch" ]; then
    echo "$first_branch"
    return 0
  fi

  die "Unable to detect default branch for $url"
}

parse_owner_repo() {
  local url="$1"
  local path

  case "$url" in
  git@github.com:*.git)
    path="${url#git@github.com:}"
    path="${path%.git}"
    ;;
  https://github.com/*.git)
    path="${url#https://github.com/}"
    path="${path%.git}"
    ;;
  *)
    die "Unsupported GitHub URL format: $url"
    ;;
  esac

  echo "$path"
}

make_prefix() {
  local owner_repo="$1"

  if [ -n "$DEST_ROOT" ]; then
    echo "${DEST_ROOT%/}/$owner_repo"
  else
    echo "$owner_repo"
  fi
}

confirm_plan() {
  if [ "$ASSUME_YES" -eq 1 ] || [ "$DRY_RUN" -eq 1 ]; then
    return 0
  fi

  echo "This will import ${#REPO_URLS[@]} repositories as git subtrees with full history:"
  for url in "${REPO_URLS[@]}"; do
    local owner_repo
    owner_repo="$(parse_owner_repo "$url")"
    echo "  - $url -> $(make_prefix "$owner_repo")"
  done
  echo
  read -r -p "Continue? [y/N] " reply
  case "$reply" in
  y | Y | yes | YES) ;;
  *) die "Aborted" ;;
  esac
}

main() {
  require_tooling
  ensure_repo_state
  confirm_plan

  for url in "${REPO_URLS[@]}"; do
    local owner_repo
    owner_repo="$(parse_owner_repo "$url")"

    local prefix
    prefix="$(make_prefix "$owner_repo")"

    if [ -e "$prefix" ]; then
      die "Destination already exists: $prefix"
    fi

    local branch
    branch="$(detect_default_branch "$url")"

    local remote_base
    remote_base="subtree-$(sanitize_remote_name "$owner_repo")"

    local remote_name
    remote_name="$(ensure_remote_name "$remote_base" "$url")"

    echo "Importing $owner_repo (branch: $branch) -> $prefix"

    if ! remote_exists "$remote_name"; then
      run_cmd git remote add "$remote_name" "$url"
    fi

    run_cmd git fetch "$remote_name" "$branch"
    run_cmd git subtree add --prefix="$prefix" "$remote_name" "$branch"

    if [ "$KEEP_REMOTES" -eq 0 ]; then
      run_cmd git remote remove "$remote_name"
    fi
  done

  echo "Done. Subtrees imported with full history."
}

main
