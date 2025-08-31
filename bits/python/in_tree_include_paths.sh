if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Please install it and try again."
    return 1
fi

export PYTHONPATH=..:src:$PYTHONPATH