if ! command -v clang &> /dev/null; then
    echo "Clang is not installed. Please install it and try again."
    return 1
fi

export CC=clang
export CXX=clang++
export CXXFLAGS="$CXXFLAGS -stdlib=libc++"