if ! command -v git &> /dev/null; then
    echo "Git is not installed. Please install it and try again."
    return 1
fi

alias ga="git add"
alias gs="git status"
alias gc="git commit"
alias gca="git commit --amend"