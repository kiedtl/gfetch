main() {
    # find project's root directory and cd there.
    if [ -z "$GFE_DIR" ]
    then
        cd "$(git rev-parse --show-toplevel)"
    else
        cd "$GFE_DIR"
    fi

    defconfig
}

main "$@"
