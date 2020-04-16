# user.sh - (gfe module) retrieve git username
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_authors() {
    # get total amount of commits
    total="$(git rev-list --count --all)"

    # get list of all commits, listing authors only.
    # group like authors together, then use uniq -c
    # to get the number of commits per author.
    # Once that is done, we can sort again by
    # commit count and simply conver the commit count
    # to a percentage.
    git --no-pager log --format="%aN" | \
        sort | \
        uniq -c | \
        sort -bnr | \
        while read -r commits author
        do
            percentage="$(((commits*100)/total))"
            echo "$percentage% $author $commits"
        done | \
        head -n "$GFE_AUTHORS_MAX"
}
