# srcsize.sh - (gfe module) retreive size of source code
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_srcsize() {
    size=0

    # get project root
    root="$(git rev-parse --show-toplevel)"

    cd "$root"
    for file in $(find *)
    do
        if ! git check-ignore "$file" >/dev/null
        then
            # don't count directories
            if [ -f "$file" ]
            then
                size=$((size+=$(du -sb "$root/$file" | awk '{ print $1 }')))
            fi
        fi
    done

    printf "$size" | human
}
