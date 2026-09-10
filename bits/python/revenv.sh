_clix_bits_python_revenv_revenv() {
    local python_version="${1#python}"
    shift

    if ! command -v uv &> /dev/null; then
        echo "uv is not installed. Please install it and try again."
        return 1
    fi

    if ! uv python find "$python_version" &> /dev/null; then
        echo "Installing Python $python_version with uv..."
        uv python install "$python_version" || return 1
    fi

    # Deactivate any existing virtual environment
    deactivate 2> /dev/null

    # Check if .venv exists, if not, create it
    if [ ! -d .venv ]; then
        echo "Creating virtual environment in .venv..."
        uv venv --python "$python_version" .venv || return 1
    fi

    # Activate the virtual environment
    if [ -f .venv/bin/activate ]; then
        source .venv/bin/activate
    else
        echo "Failed to activate virtual environment!"
        return 1
    fi

    # Install dependencies if requirements.txt exists
    if [ -f requirements.txt ]; then
        echo "Installing dependencies from requirements.txt..."

        if [[ " $@ " == *" -u "* ]]; then
            uv pip install --force-reinstall --upgrade -r requirements.txt
        else
            uv pip install -r requirements.txt
        fi
    fi

    echo "Virtual environment is now active."
}

revenv() {
    _clix_bits_python_revenv_revenv python3 $@
}

revenv3.10() {
    _clix_bits_python_revenv_revenv python3.10 $@
}

revenv3.11() {
    _clix_bits_python_revenv_revenv python3.11 $@
}

revenv3.12() {
    _clix_bits_python_revenv_revenv python3.12 $@
}

revenv3.13() {
    _clix_bits_python_revenv_revenv python3.13 $@
}

revenv3.14() {
    _clix_bits_python_revenv_revenv python3.14 $@
}
