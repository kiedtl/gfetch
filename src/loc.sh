# loc.sh - (gfe module) get lines of code.
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_loc() {
    # see languages.sh for my reason for not using
    # tokei.

    # since we use scc to count lines of code, we
    # first check if it's in $PATH
    if ! command -v scc 2>/dev/null >&2
    then
        printf '(note: scc not found)'
        return
    fi

    # note that comments are counted as well as
    # actual lines of code.
    scc -fcsv | \
        awk -F, '{ t+=($4+$5) } END { print total }'
}
