# srcsize.sh - (gfe module) retreive size of source code
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_srcsize() {
    size=0

    # cd to the project root, to find all
    # project files
    cd "$(findroot)"

    for file in $(find *)
    do
        if ! git check-ignore "$file" >/dev/null
        then
            echo "$file" >&2
            size=$((size+=$(du -sb "$file" | awk '{ print $1 }')))
        fi
    done

    printf "$size" | human
}
