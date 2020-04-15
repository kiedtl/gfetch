# user.sh - (gfe module) retrieve git username
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_authors() {
    total="$(git rev-list --count --all)"

    git --no-pager log --format="%aN" | \
        sort | \
        uniq -c | \
        sort -bnr | \
        while read -r commits author
        do
            percentage="$(((${commits}*100)/${total}))"
            echo "$percentage% $author $commits"
        done | \
        head -n "$GFE_AUTHORS_MAX"
}
