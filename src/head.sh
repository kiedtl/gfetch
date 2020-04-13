# head.sh - (gfe module) retrieve latest commit sha
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_head() {
    # while it might be easier to simply
    # get list of commits with git-log, then
    # retrieve the first one, but I prefer to use
    # this way as it is slightly faster than
    # git-log (according to hyperfine).
    #
    # we simply git .git/HEAD, which points us
    # to the current branch head, then read the
    # commit sha and truncate it to seven
    # characters.
    head -c7 ".git/$(awk '/ref:/ { print $2 }' .git/HEAD)"
}

# show branch in addition to HEAD
get_head_long() {
    # retrieve branch, printing "detached"
    # if in detached HEAD state
    branch="$(git branch --show-current)"
    branch="${branch:-detached}"

    printf "$(get_head) ($branch)"
}
