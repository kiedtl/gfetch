# srcsize.sh - (gfe module) retreive size of source code
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_srcsize() {
    # get a list of files that are tracked by git.
    files="$(git ls-files)"
    count="$(echo "$files" | wc -l)"

    # disable warning about globbing, since it's
    # intended.
    # shellcheck disable=2086
    size="$(du -sb $files 2>/dev/null | \
        awk '{ sz+=$1 } END { print sz }')"

    # convert to human-readable format.
    hsize=$(echo "$size" | human)

    printf '%s (%s files)' "$hsize" "$count"
}
