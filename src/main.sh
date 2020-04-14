main() {
    # find project's root directory and cd there.
    if [ -z "$GFE_DIR" ]
    then
        cd "$(git rev-parse --show-toplevel)"
    else
        cd "$GFE_DIR"
    fi

    # check if configuration file exists, otherwise
    # write default configuration.
    configdir="${XDG_CONFIG_HOME}/gfe"
    [ ! -d "$configdir" ] && mkdir -p "$configdir"
    config="$configdir/config.sh"
    [ ! -f "$config" ] && printf "$defconfig" > "$config"

    # execute configuration
    . "$config"
    gfe_info
}

main "$@"
