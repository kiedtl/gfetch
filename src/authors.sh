# user.sh - (gfe module) retrieve git username
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_authors() {
    # get total amount of commits
    total="$(git rev-list --count --all)"

    # get list of all commits, listing authors only.
    git --no-pager log --format="%aN" | \
        sort | \                    # group like authors together.
        uniq -c | \                 # print number of occurences of each author.
        sort -bnr | \               # sort by commit count.
        while read -r commits author
        do
            percentage="$(((${commits}*100)/${total}))"
            echo "$percentage% $author $commits"
        done | \
        head -n "$GFE_AUTHORS_MAX"
}
