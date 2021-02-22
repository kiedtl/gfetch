# gitver.sh - (gfe module) get git version.
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_gitver() {
    ver=$(git --version | tr -s ' ' \\t | cut -f 3)
    printf "git v%s" "$ver"
}
