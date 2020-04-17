# loc.sh - (gfe module) get lines of code.
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_loc() {
    get_sccdata

    echo "$scc_data" | \
        awk -F, '{ loc+=$5 } END { print loc }'
}
