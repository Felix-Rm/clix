if ! command -v cmake &> /dev/null; then
    echo "CMake is not installed. Please install it and try again."
    return 1
fi

cmake() {
    if [[ "$@" == *"--build"* || "$@" == *"--install"* ]]; then
        echo "Skipping .cmake_reconfigure generation for build/install command."
        command cmake "$@"
        return $?
    fi

    echo "Running CMake with arguments: $@"

    # Save the original command to .cmake_reconfigure
    echo "cmake $@" > .cmake_reconfigure
    chmod +x .cmake_reconfigure

    # Run the actual cmake command
    command cmake "$@"
    return $?
}