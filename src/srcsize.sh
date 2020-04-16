# srcsize.sh - (gfe module) retreive size of source code
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_srcsize() {
    size=0
    files=0

    # find each file tracked by git,
    # retrieving the size with du -sb.
    for file in $(git ls-files)
    do
        # just in case the user removed a file
        # but didn't commit the removal yet,
        # in that case git still lists the deleted
        # file. ¯\_(ツ)_/¯
        [ -f "$file" ] || continue

        size=$((size+=$(du -sb "$file" | awk '{ print $1 }')))
        files="$((files+1))"
    done

    # convert to human-readable format.
    hsize=$(printf "$size" | human)
    printf "$hsize ($files files)"
}
