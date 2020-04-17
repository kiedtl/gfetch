# loc.sh - (gfe module) get lines of code.
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_loc() {
    get_sccdata

    # the sed command is used to add thousands-
    # separators to the number.
    # unix.stackexchange.com/questions/113795/add-thousands-separator-in-a-number
    #
    # disable warning about undefined
    # '$scc_data', since it's already defined
    # in lib/util.sh
    # shellcheck disable=2154
    loc="$(echo "$scc_data" | \
        awk -F, '{ loc+=$5 } END { print loc }' | \
        sed ':a;s/\B[0-9]\{3\}\>/,&/;ta')"
    printf '%s lines' "$loc"
}
