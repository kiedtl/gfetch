# defconfig.sh - (gfe resource) default configuration
# (c) Kiëd Llaentenn
# see COPYING for more details

defconfig="
# gfetch configuration
#
# ensure that you use the
# form GFE_VALUE=\${GFE_VALUE:-othervalue}
# to ensure that it can be overridden on
# the command line!!
#
# GFE_LOGO: path to file with ASCII art.
# if it\'s value is not a valid file, then
# it is treated as ASCII art itself.
GFE_LOGO=\"\${GFE_LOGO:-}\"

# GFE_ALIGN: number of spaces for padding between
# name and info columnds
GFE_ALIGN=\"\${GFE_ALIGN:-13}\"

# GFE_COL1: color for the first column (the
# name column). possible values: 1-7
GFE_COL1=\"\${GFE_COL1:-1}\"

# GFE_COL2: color for the second column (the
# info column). possible values: 1-7
GFE_COL2=\"\${GFE_COL2:-7}\"

# GFE_SEP: character or text to separate each name
# and info line.
# e.g. using the value ':' would become 'name: info'
# in output.
GFE_SEP=\"\${GFE_SEP:-}\"

# GFE_DIR: directory/repository for gfetch to cd
# into.
GFE_DIR=\"\${GFE_DIR:-}\"

# main configuration. gfetch will simply execute
# the gfe_info function on startup.
#
# each showinfo() call displays an info field.
# showinfo usage: showinfo <info> <name>
#
# if you wish, you can even display your own text
# with the showinfo function.
# e.g. showinfo \"\$(git --version)\" \"GIT\"
#
# to display ASCII art, use the show_ascii
# function without any parameters.
#
# NOTE: if the show_ascii function is used, it MUST
# be the first item.
gfe_info() {
    printf '\n'
    show_ascii
    showinfo \"\$(get_project_name)\" 'PROJECT'
    showinfo \"\$(get_user)\"         'USER'
    showinfo \"\$(get_head_long)\"    'HEAD'
    showinfo \"\$(get_created)\"      'CREATED'
    showinfo \"\$(get_latest)\"       'LAST CHANGE'
    showinfo \"\$(get_commit_count)\" 'COMMITS'
    showinfo \"\$(get_srcsize)\"      'SIZE'
    printf '\n'
}
"
