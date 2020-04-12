# showinfo - gfe module: print information
# (c) Kied Llaentenn
# see the COPYING file for more information.

showinfo() {
    val="$($1)"
    [ -z "$val" ] && val="???"

    key=$2

    # remove trailing whitespace from string
    # with `set --`.
    # shellcheck disable=2046,2086
    {
        set -f
        set +f -- $val
        val=$*
    }

    # move cursor right beyond ascii art
    printf "\033[%sC" "$((ascii_width))"

    # print key, separator, and info field
    printf "\033[3%sm%-${GFE_ALIGN:-12}s\033[0m%s\033[3%sm%s\033[0m\n" \
        "${GFE_COL1:-"1"}" "$key" \
        "$GFE_SEP" \
        "${GFE_COL2:-7}" "$val"

    # keep track of number of rows of info
    info_height=$((${info_height:-0}+1))
}
