if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Please install it and try again."
    return 1
fi

_clix_bits_python_revenv_revenv() {
    if ! command -v $1 &> /dev/null; then
        echo "$1 is not installed. Please install it and try again."
        return 1
    fi

    # Deactivate any existing virtual environment
    deactivate 2> /dev/null

    # Check if .venv exists, if not, create it
    if [ ! -d .venv ]; then
        echo "Creating virtual environment in .venv..."
        $1 -m venv .venv
    fi

    # Activate the virtual environment
    if [ -f .venv/bin/activate ]; then
        source .venv/bin/activate
    else
        echo "Failed to activate virtual environment!"
        return 1
    fi

    pip install --upgrade pip

    # Install dependencies if requirements.txt exists
    if [ -f requirements.txt ]; then
        echo "Installing dependencies from requirements.txt..."

        if [[ " $@ " == *" -u "* ]]; then
            pip install --force-reinstall --upgrade -r requirements.txt
        else
            pip install -r requirements.txt
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
