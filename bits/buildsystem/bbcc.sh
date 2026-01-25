

_clix_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]:-${(%):-%x}}")/../.." && pwd)"

source "$_clix_root/bits/buildsystem/bb.sh"

bbcc() {
    if ! command -v bear &> /dev/null; then
        echo "Bear is not installed. Please install it and try again."
        return 1
    fi

    _clix_bits_buildsystem_bb_detect_all

    if [ $? -eq 0 ]; then
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
        return 0
    fi

    echo "\e[31mNo build system detected\e[0m"
    return 1
}