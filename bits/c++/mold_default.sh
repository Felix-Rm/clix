if ! command -v mold &> /dev/null; then
    echo "Mold is not installed. Please install it and try again."
    return 1
fi

export CXXFLAGS="$CXXFLAGS -fuse-ld=mold"
