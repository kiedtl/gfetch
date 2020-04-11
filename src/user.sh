# user.sh - (gfe module) retrieve git username
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

get_user() {
    git config --get user.name
}
