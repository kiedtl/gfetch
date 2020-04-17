# util.sh: random stuff
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_sccdata() {
    # get outta here if this function
    # was already called
    [ -z "$scc_data" ] || return

    # although tokei is faster, many distros don't
    # have binaries compiled with the JSON feature.
    # (to be specific, my distro, Void.)
    # so we're using scc instead.

    # since we use scc to count lines of code, we
    # first check if it's in $PATH
    if ! command -v scc 2>/dev/null >&2
    then
        scc_data="unknown (scc not found)"
        return
    fi

    scc_data="$(scc -fcsv)"
}
