#!/bin/sh
#
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING file for copyright information.

. tests/lib.sh

# run shellcheck
header "testing for shellcheck"
test_command "command -v shellcheck 2>/dev/null >&2" \
    "Shellcheck installed"

header "linting source files"
for file in src/*
do
    test_command "shellcheck -e2148 $file" \
        "Passed shellcheck: '$file'"
done

header "linting tests files"
test_command "shellcheck tests/main.sh tests/lib.sh" \
    "Passed shellcheck: tests/main.sh tests/lib.sh"

end
