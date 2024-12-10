# Persistent history
HISTFILE=$XDG_CONFIG_HOME/zsh/zsh_history # Store history to persist across sessions.
HISTSIZE=10000 # Max amount of commands to save in file.
SAVEHIST=1000 # Save history to 1000 commands.
setopt EXTENDED_HISTORY # Write the history file in the ":start:elapsed;command" format.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt INC_APPEND_HISTORY # Write to the history file immediately, not when the shell exits.
setopt HIST_FIND_NO_DUPS # Do not display a line previously found.
setopt HIST_REDUCE_BLANKS # Remove superfluous blanks before recording entry.
