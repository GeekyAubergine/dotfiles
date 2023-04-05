# Config

autoload -U colors && colors

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='${PWD/#$HOME/~} %{$fg[green]%}${vcs_info_msg_0_}%{$reset_color%} >'

eval $(thefuck --alias)

export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh

# Aliases
source ~/dotfiles/aliases/misc.zsh
source ~/dotfiles/aliases/git.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

eval "$(pyenv init -)"

# Android Stuff
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"

[ -f "/Users/zoe/.ghcup/env" ] && source "/Users/zoe/.ghcup/env" # ghcup-envexport PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
