# upstream.sh - (gfe module) get upstream url
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_upstream() {
    # get current remote for current branch
    remote=$(git branch -lvv | \
        awk '/*/ { print $4 }' | \
        sed 's/[]\[]//g;y|/| |;s/ .*$//g')

    # get url for remote
    git remote get-url "$remote" --push
}
