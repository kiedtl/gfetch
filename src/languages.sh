# languages - (gfe module) grab list of languages.
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_languages() {
    # although tokei is faster, many distros don't
    # have binaries compiled with the JSON feature.
    # (to be specific, my distro, Void.)
    # so we're using scc instead.

    # since we use scc to count lines of code, we
    # first check if it's in $PATH
    if ! command -v scc 2>/dev/null >&2
    then
        printf '(note: scc not found)'
        return
    fi

    # sort -fcsv: get CSV data, listing LOC for each file
    # awk -F, ...: convert it to a list of LOC per language
    # sort -rn -t, ...: sort list by LOC in ascending order
    # awk -F, ...: remove LOC column
    # head -n$GFE_LANG_MAX: get only two first languages
    # tr '\n' ' ': finally, transform newlines to spaces
    scc -fcsv | \
        awk -F, -v CONVFMT=%.2g \
        '
        {
            c[$1]+=$5;
            total+=$5
        }

        END {
            for (i in c) {
                p=(c[i]*100)/total;
                print i "," c[i] ",(" p " %)"
            }
        }' | \
        sort -rn -t, -k2 | \
        awk -F, '{ print $1 " " $3 }' | \
        head -n"$GFE_LANG_MAX" | \
        tr '\n' ' '
}
