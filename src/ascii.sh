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
        esc="$(printf "\033")"
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
    if [ -n "$GFE_LOGO" ]
    then
        if [ -f "$GFE_LOGO" ]
        then
            ascii="$(cat "$GFE_LOGO")"
        else
            ascii="$GFE_LOGO"
        fi
    else
        ascii="$default_ascii"
    fi

    # set the width of the ASCII art for the
    # showinfo function.
    while read -r line
    do
        # TODO: use ternary
        [ "${#line}" -gt "${ascii_width:-0}" ] &&
            ascii_width="${#line}"
    done <<-EOF
$(printf '%s' "$ascii" | sed "s/$esc\[.m//g")
EOF

    # draw ASCII art and move cursor up again.
    printf "$ascii\033[%sA\033[%sD" \
        "$(printf '%s' "$ascii" | wc -l)" "$ascii_width"
}
