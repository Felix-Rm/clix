if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Please install it and try again."
    return 1
fi

_clix_bits_python_run_in_user_venv(){
    local USER_VENV_DIR="$HOME/.venv"

    if [ ! -d "$USER_VENV_DIR" ]; then
        echo "Creating user virtual environment in $USER_VENV_DIR..."
        python3 -m venv "$USER_VENV_DIR"
    fi

    source "$USER_VENV_DIR/bin/activate"
}

upy(){
    (
        _clix_bits_python_run_in_user_venv
        python3 $@
    )
}

upip() {
    (
        _clix_bits_python_run_in_user_venv
        pip $@
    )
} 