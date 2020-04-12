# showinfo - gfe module: print information
# (c) Kied Llaentenn
# see the COPYING file for more information.

showinfo() {
    # usage: showinfo <function> <label>
    # e.g.: showinfo "get_contributors" "contributors"
    key="$2"
    val="$(printf "$($1)" | tr -d '\n')"
    printf "\033[31m%-8.8s\033[0m%s\n" "$key" "$val"
}
