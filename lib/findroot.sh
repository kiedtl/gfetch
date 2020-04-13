# findroot.sh - find project root
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

findroot() {
    git rev-parse --show-toplevel
}
