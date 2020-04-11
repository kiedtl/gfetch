# commits.sh - (gfe module) retrieve number of commits
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_commit_count() {
    git rev-list --count --all
}
