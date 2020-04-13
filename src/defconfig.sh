# defconfig.sh - (gfe module) default configuration
# (c) Kiëd Llaentenn
# see COPYING for more details

defconfig() {
    printf '\n'
    show_ascii
    showinfo get_project_name "PROJECT"
    showinfo get_user         "USER"
    showinfo get_head_long    "HEAD"
    showinfo get_created      "CREATED"
    showinfo get_latest       "LAST CHANGE"
    showinfo get_commit_count "COMMITS"
    showinfo get_srcsize      "SIZE"
    printf '\n'
}
