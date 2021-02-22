# head.sh - (gfe module) retrieve latest commit sha
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_head() {
    git log -1 --format="%h"
}

# show branch in addition to HEAD
get_head_long() {
    # retrieve branch, printing "detached"
    # if in detached HEAD state
    branch="$(git branch --show-current)"
    : "${branch:=detached}"

    printf '%s (%s)' "$(get_head)" "$branch"
}
