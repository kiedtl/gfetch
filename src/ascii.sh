# ascii.sh - (gfe module) handle ASCII art
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.


show_ascii() {

    # set color variables
    #
    # disable warning about unused variables
    # and warning about using ${} when expanding
    # arrays.
    #
    # shellcheck disable=1087,2034
    {
        esc="$(printf '\033')"
        c1="$esc[31m"
        c2="$esc[32m"
        c3="$esc[33m"
        c4="$esc[34m"
        c5="$esc[35m"
        c6="$esc[36m"
        c7="$esc[37m"
        c8="$esc[38m"
        revert="$esc[7m"
        reset="$esc[0m"
    }

    # set the default ASCII art.
    # FIXME: better default Git art.
    default_ascii=$(cat <<-EOF
${c1}${revert}               ${reset}
${c1}${revert}      \        ${reset}
${c1}${revert}       o       ${reset}
${c1}${revert}      / \      ${reset}
${c1}${revert}     /   \     ${reset}
${c1}${revert}    o     o    ${reset}
${c1}${revert}               ${reset}
EOF
)

    # check if user-defined variable is a file
    # if it is not, treat it like raw ascii art
    ascii="$default_ascii"
    case "$GFE_LOGO" in ?*)
        ascii="$GFE_LOGO"
        if [ -f "$GFE_LOGO" ]
        then
            case $(file "$GFE_LOGO") in
                *PNG*|*JPEG*)
                    if ! command -v chafa 2>/dev/null >&2
                    then
                        echo "error: chafa not found."
                        return
                    fi

                    ascii="$(chafa -s 25 "$GFE_LOGO")"
                    ascii_width=25
                    ;;
                *)
                    ascii="$(cat "$GFE_LOGO")"
                    ;;
            esac
        fi
    ;;esac

# set the width of the ASCII art for the
# showinfo function if it wasn't already set
# before
case "$ascii_width" in '')
    while read -r line
    do
        case "$(( "${#line}" > "${ascii_width:-0}" ))" in 1)
            ascii_width="${#line}"
        ;;esac
    done <<-EOF
$(printf '%s' "$ascii" | sed "s/$(printf '\033')\[.m//g")
EOF
;;esac

    # draw ASCII art and move cursor up again.
    printf "$ascii\033[%sA\033[%sD" \
        "$(printf '%s' "$ascii" | wc -l)" "$ascii_width"

    # add some padding to ascii_width
    : $((ascii_width=+3))
}
