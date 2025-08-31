if ! command -v cmake &> /dev/null; then
    echo "CMake is not installed. Please install it and try again."
    return 1
fi

if ! command -v ninja &> /dev/null; then
    echo "Ninja is not installed. Please install it and try again."
    return 1
fi

export CMAKE_GENERATOR=Ninja