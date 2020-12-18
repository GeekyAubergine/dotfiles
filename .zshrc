# Config

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

eval "$(rbenv init -)"

# Android Stuff
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"
