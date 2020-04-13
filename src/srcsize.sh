# srcsize.sh - (gfe module) retreive size of source code
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_srcsize() {
    size=0

    # find each file tracked by git,
    # retrieving the size with du -sb.
    for file in $(git ls-files)
    do
        size=$((size+=$(du -sb "$file" | awk '{ print $1 }')))
    done

    # convert to human-readable format.
    printf "$size" | human
}
