if ! command -v bear &> /dev/null; then
    echo "Bear is not installed. Please install it and try again."
    return 1
fi

_clix_root="$(cd -- "$(dirname -- "$0")/../.." && pwd)"

source "$_clix_root/bits/buildsystem/bb.sh"

bbcc() {
   

    _clix_bits_buildsystem_bb_detect_all
    if [ -n "${_clix_bits_buildsystem_bb_active_cmd}" ]; then
        (cd "${_clix_bits_buildsystem_bb_active_dir}" && eval "${_clix_bits_buildsystem_bb_active_cmd} clean")
        if [ $? -ne 0 ]; then
            echo "\e[31mFailed to clean build artifacts\e[0m"
            return 1
        fi

        (cd "${_clix_bits_buildsystem_bb_active_dir}" && eval "bear --output ../compile_commands.json -- ${_clix_bits_buildsystem_bb_active_cmd} $@")
        if [ $? -ne 0 ]; then
            echo "\e[31mFailed to generate compile commands\e[0m"
            return 1
        fi

        echo "\e[32mCompile commands generated successfully\e[0m"
    fi

    echo "\e[31mNo build system detected\e[0m"
    return 1
}