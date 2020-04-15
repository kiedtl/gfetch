# showinfo - gfe module: print information
# (c) Kied Llaentenn
# see the COPYING file for more information.

showinfo() {
    val="$1"
    [ -z "$val" ] && val="???"

    key=$2

    # remove trailing whitespace from string
    # with `set --`.
    # shellcheck disable=2046,2086
    #{
    #    set -f
    #    set +f -- $val
    #    val=$*
    #}

    # move cursor right beyond ascii art
    printf "\033[%sC" "$((ascii_width+1))"

    # print key, separator, and info field
    #printf "\033[3%sm%-${GFE_ALIGN:-13}s\033[0m%s\033[3%sm%s\033[0m\n" \
        #"${GFE_COL1:-"1"}" "$key" \
        #"$GFE_SEP" \
        #"${GFE_COL2:-7}" "$val"

    # print key and separator
    printf "\033[3%sm%-${GFE_ALIGN}s\033[0m%s" \
        "$GFE_COL1" "$key" "$GFE_SEP"

    # print information, one line at a time
    echo "$val" | while read -r line
    do
        printf '\033[3%sm%s\033[0m' "$GFE_COL2" "$line"

        # WORKAROUND: move cursor forward again
        # just in case this info field has multiple lines.
        # this is so that multi-lined info fields are
        # aligned properly.
        printf '\n\033[%sC' "$((ascii_width+GFE_ALIGN+1))"
    done

    # WORKAROUND: move cursor back, so that next
    # info field isn't misaligned.
    printf '\033[%sD' "$((ascii_width+GFE_ALIGN+1))"
}
