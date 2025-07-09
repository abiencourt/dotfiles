# global
alias grep="grep --color"

# https://wiki.archlinux.org/title/Kitty#Terminal_issues_with_SSH
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# Define a function that prompts for input
ssh_prompt() {
    if [ "$TERM" = "xterm-kitty" ]; then
        echo -n "Do you want to use kitten ssh (y/n)? "
        read choice
        case "$choice" in
        y | Y) kitty +kitten ssh "$@" ;;
        *) command ssh "$@" ;;
        esac
    else
        command ssh "$@"
    fi
}

# Alias the ssh command to use the prompt function
alias ssh="ssh_prompt"

# Disable zsh autocorrect for aider
alias aider='nocorrect aider'
