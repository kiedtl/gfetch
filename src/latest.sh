# latest.sh - (gfe module) get date of last commit
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_latest() {
    git log --format="%ar" | head -n1
}
