function set_mold_as_default_linker() {
    if ! command -v mold &> /dev/null; then
        echo "Mold is not installed. Please install it and try again."
        return 1
    fi

    export LD=mold
    export CXXFLAGS="$CXXFLAGS -fuse-ld=mold"
    echo "Mold has been set as the default linker."
}
