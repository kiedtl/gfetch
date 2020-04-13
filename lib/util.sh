# util.sh: random stuff
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

# return branch, returning "detached"
# if in detached head state
get_branch() {
    branch="$(git branch --show-current)"
    printf '%s' "${branch:-detached}"
}
