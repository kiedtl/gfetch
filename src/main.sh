main() {
    # ensure that git, sed, and awk are installed
    if ! command -v git 2>/dev/null >&2
    then
        echo 'error: git not found.'
        return;
    fi

    if ! command -v sed 2>/dev/null >&2
    then
        echo 'error: sed not found.'
        return;
    fi

    if ! command -v awk 2>/dev/null >&2
    then
        echo 'error: awk not found.'
        return;
    fi

    # find project's root directory and cd there.
    case "$GFE_DIR" in '')
        cd "$(git rev-parse --show-toplevel)" || exit 1
    ;;*)
        cd "$GFE_DIR" || exit 1
    ;;esac

    # check if configuration file exists, otherwise
    # write default configuration.
    configdir="${XDG_CONFIG_HOME}/gfe"
    [ ! -d "$configdir" ] && mkdir -p "$configdir"
    config="$configdir/config.sh"

    # disable warnings about undefined variable
    # shellcheck disable=2154
    [ ! -f "$config" ] && echo "$defconfig" > "$config"

    # execute configuration
    # shellcheck disable=1090
    . "$config"
    gfe_info
}

main "$@"
