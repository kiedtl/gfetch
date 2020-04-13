# srcsize.sh - (gfe module) retreive size of source code
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_srcsize() {
    size=0

    # cd to the project root, to find all
    # project files
    cd "$(findroot)"

    for file in $(git ls-files)
    do
        size=$((size+=$(du -sb "$file" | awk '{ print $1 }')))
    done

    printf "$size" | human
}
