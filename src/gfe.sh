#!/bin/sh
#
# gfe - git fetch script
# (c) Kied Llaentenn
# see the COPYING file for more information.

# TODO:
#   - language              main language of project
#   - contributors          authors (in the format: <percent> <author> <commit count>)
#   - last change           how long ago was the last commit?
#   - lines of code         number of the lines of code
#   - size kB (file count)  size of all files not ignored by git
#   - license               e.g. MIT
#   - language spread       like the language colors on GitHub

showinfo() {
    # usage: showinfo <function> <label>
    # e.g.: showinfo "get_contributors" "contributors"
    key="$2"
    val="$(printf "$($1)" | tr -d '\n')"
    printf "\033[31m%-8.8s\033[0m%s\n" "$key" "$val"
}

default_config() {
    printf '\n'
    showinfo get_project_name PROJECT
    showinfo get_user         USER
    showinfo get_commit_count COMMITS
    showinfo get_head         HEAD
    showinfo get_created      CREATED
    showinfo get_srcsize      SIZE
    printf '\n'
}

default_config
