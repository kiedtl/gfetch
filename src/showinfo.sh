# showinfo - gfe module: print information
# (c) Kied Llaentenn
# see the COPYING file for more information.

showinfo() {
    # return if no information found
    # TODO: print error message instead of silently
    # failing
    val="$1"
    case "$val" in '') return ;;esac

    key=$2

    # move cursor right beyond ascii art
    #
    # disable warning about undefined ascii_width
    # shellcheck disable=2154
    printf "\033[%sC" "$ascii_width"

    # print key and separator
    printf "\033[1;3%sm%-${GFE_ALIGN}s\033[0m%s" \
        "$GFE_COL1" "$key" "$GFE_SEP"

    # print information, one line at a time
    echo "$val" |
    xargs -I line \
        printf \
          '\033[3%sm%s\033[0m\n\033[%sC' \
          "$GFE_COL2" \
          "line" \
          "$((ascii_width+GFE_ALIGN))"
        # WORKAROUND: move cursor forward again
        # just in case this info field has multiple lines.
        # this is so that multi-lined info fields are
        # aligned properly.
    done

    # WORKAROUND: move cursor back, so that next
    # info field isn't misaligned.
    printf '\033[%sD' "$((ascii_width+GFE_ALIGN))"
}

showheader() {
    e="$(printf '\033')"

    # shellcheck disable=1087
    showinfo " " \
        "$e[1;3${GFE_COL3}m$1$e[0m$3$e[1;3${GFE_COL3}m$2$e[0m"
}
