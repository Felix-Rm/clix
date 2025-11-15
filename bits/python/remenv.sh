function remenv() {
    if ! command -v mamba &> /dev/null; then
        echo "Mamba is not installed. Please install it and try again."
        return 1
    fi

    # Deactivate any existing mamba environment
    mamba deactivate 2> /dev/null

    MAMBA_ENV_PATH=$(pwd)/.menv

    # Check if environment.yml exists, if so, create or update the mamba environment
    if [ -f environment.yml ]; then
        if [ ! -d "$MAMBA_ENV_PATH" ]; then
            echo "Creating mamba environment from environment.yml..."
            mamba env create -y --file environment.yml --prefix "$MAMBA_ENV_PATH"
        else
            echo "Updating mamba environment from environment.yml..."
            mamba env update -y --file environment.yml --prune --prefix "$MAMBA_ENV_PATH"
        fi
    else
        echo "Creating empty mamba environment..."
        mamba create -y --prefix "$MAMBA_ENV_PATH" python
    fi

    # Activate the mamba environment
    mamba activate "$MAMBA_ENV_PATH"
}