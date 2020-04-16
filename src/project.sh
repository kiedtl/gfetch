# project.sh - (gfe module) retrieve project name
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

# TODO: scrape actual project name
# out of git origin or README
get_project_name() {
    basename "$(pwd)"
}
