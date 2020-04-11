# head.sh - (gfe module) retrieve latest commit sha
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_head() {
    git log \
        -1 \
        --format="%h"
}
