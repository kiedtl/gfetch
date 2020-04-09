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

include(commits.sh)
include(created.sh)
include(head.sh)
include(project.sh)
include(user.sh)

showinfo() {
    # usage: showinfo <function> <label>
    # e.g.: showinfo "get_contributors" "contributors"
    key="$2"
    val="$(printf "$($1)" | tr -d '\n')"
    printf "\033[1m%-8.8s\033[0m%16.32s\n" "$key" "$val"
}

printf '\n'
showinfo get_project_name project
showinfo get_user         user
showinfo get_commit_count commits
showinfo get_head         head
showinfo get_created      created
printf '\n'
