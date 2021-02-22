# created.sh - (gfe module) retrieve date of "first" commit
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_created() {
    git log \
        --reverse \
        --format="%ar" | \
    head -n 1
}
