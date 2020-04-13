# ascii.sh - (gfe module) handle ASCII art
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.


show_ascii() {

    # set color variables
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

    # set the width of the ASCII art for the
    # showinfo function.
    while read -r line
    do
        # TODO: use ternary
        [ "${#line}" -gt "${ascii_width:-0}" ] &&
            ascii_width="${#line}"
    done <<-EOF
$(printf %s "$default_ascii" | sed "s/$esc\[.m//g")
EOF

    # draw ASCII art and move cursor up again.
    printf "$default_ascii\033[%sA\033[%sD" \
        "$(printf "$default_ascii" | wc -l)" "$ascii_width"
}
