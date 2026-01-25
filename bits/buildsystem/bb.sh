_clix_bits_buildsystem_bb_active_dir=""
_clix_bits_buildsystem_bb_active_cmd=""

_clix_bits_buildsystem_bb_detect() {
    local path_prefix="$1"

    if command -v make &> /dev/null; then
        if [ -f "${path_prefix}Makefile" ]; then
            _clix_bits_buildsystem_bb_active_cmd="make -j $(nproc)"
            _clix_bits_buildsystem_bb_active_dir="${path_prefix}"
            return 0
        fi
    else
        echo "\e[33mMake is not installed.\e[0m"
    fi

    if command -v ninja &> /dev/null; then
        if [ -f "${path_prefix}build.ninja" ]; then
            _clix_bits_buildsystem_bb_active_cmd="ninja"
            _clix_bits_buildsystem_bb_active_dir="${path_prefix}"
            return 0
        fi
    else
        echo "\e[33mNinja is not installed.\e[0m"
    fi

    if command -v cargo &> /dev/null; then
        if [ -f "${path_prefix}Cargo.toml" ]; then
            _clix_bits_buildsystem_bb_active_cmd="cargo build"
            _clix_bits_buildsystem_bb_active_dir="${path_prefix}"
            return 0
        fi
    else
        echo "\e[33mCargo is not installed.\e[0m"
    fi

    return 1
}

_clix_bits_buildsystem_bb_detect_all() {
    _clix_bits_buildsystem_bb_detect "" && return 0
    _clix_bits_buildsystem_bb_detect "build/" && return 0
    return 1
}

bb() {
    _clix_bits_buildsystem_bb_detect_all

    if [ $? -eq 0 ]; then
        (cd "${_clix_bits_buildsystem_bb_active_dir}" && eval "${_clix_bits_buildsystem_bb_active_cmd} $@")

        if [ $? -eq 0 ]; then
            echo "\e[32mBuild succeeded\e[0m"
            return 0
        else
            echo "\e[31mBuild failed\e[0m"
            return 1
        fi
    fi

    echo "\e[31mNo build system detected\e[0m"
    return 1
}