# Aliases
source ~/dotfiles/aliases/misc.zsh
source ~/dotfiles/aliases/git.zsh

# Prompt

autoload -U colors && colors

ssh_info() {
  [[ "$SSH_CONNECTION" != '' ]] && echo '%(!.%{$fg[red]%}.%{$fg[yellow]%})%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}: ' || echo ''
}

# Load version control information
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git

precmd() { vcs_info }

git_info() {

  # Exit if not inside a Git repository
  ! git rev-parse --is-inside-work-tree > /dev/null 2>&1 && return

  # Git branch/tag, or name-rev if on detached head
  local GIT_LOCATION=${$(git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD)#(refs/heads/|tags/)}

  local AHEAD="%{$fg[red]%}+NUM%{$reset_color%}"
  local BEHIND="%{$fg[red]%}-NUM%{$reset_color%}"
  local MERGING="%{$fg[yellow]%}MERGING%{$reset_color%}"
  local UNTRACKED="%{$fg[red]%}U%{$reset_color%}"
  local MODIFIED="%{$fg[yellow]%}M%{$reset_color%}"
  local STAGED="%{$fg[green]%}S%{$reset_color%}"

#   local UNTRACKED="%{$fg[red]%}●%{$reset_color%}"
#   local MODIFIED="%{$fg[yellow]%}●%{$reset_color%}"
#   local STAGED="%{$fg[green]%}●%{$reset_color%}"

  local -a DIVERGENCES
  local -a FLAGS

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    DIVERGENCES+=( "${AHEAD//NUM/$NUM_AHEAD}" )
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    DIVERGENCES+=( "${BEHIND//NUM/$NUM_BEHIND}" )
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    FLAGS+=( "$MERGING" )
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    FLAGS+=( "$UNTRACKED" )
  fi

  if ! git diff --quiet 2> /dev/null; then
    FLAGS+=( "$MODIFIED" )
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    FLAGS+=( "$STAGED" )
  fi

  local -a GIT_INFO
  GIT_INFO+=( "%{$fg[green]%}$GIT_LOCATION" )
  [ -n "$GIT_STATUS" ] && GIT_INFO+=( "$GIT_STATUS" )
  [[ ${#DIVERGENCES[@]} -ne 0 ]] && GIT_INFO+=( "${(j::)DIVERGENCES}" )
  [[ ${#FLAGS[@]} -ne 0 ]] && GIT_INFO+=( "${(j::)FLAGS}" )
  echo "${(j::)GIT_INFO}%{$reset_color%}"
}

setopt PROMPT_SUBST
PROMPT='$(ssh_info)${PWD/#$HOME/~} $(git_info)> '

# Paths

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[ -f "/Users/zoe/.ghcup/env" ] && source "/Users/zoe/.ghcup/env" # ghcup-envexport PATH="$HOME/.rbenv/bin:$PATH"

export NVM_DIR=~/.nvm
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.jenv/bin:$PATH"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"

# Things

. $(brew --prefix nvm)/nvm.sh
eval $(thefuck --alias)
eval "$(jenv init -)"
eval "$(pyenv init -)"
eval "$(rbenv init - zsh)"

# pnpm
export PNPM_HOME="/Users/zoe/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end