# version.sh - (gfe module) get latest tag name
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_version() {
    # list tags, sorting by tag date
    # then remove empty lines and
    # show only last line
    git for-each-ref \
        --sort=taggerdate \
        --format='%(tag)' | \
        sed '/^$/d;N;D'
}
