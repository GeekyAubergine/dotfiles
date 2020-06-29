# Git aliases

function g {
	if [[ $# -eq 0 ]]; then
		git status -sb
	else
		git $@
	fi
}

function gco() {
    if [ $# -eq 0 ]; then
        git checkout $(git branch | pick)
    else
        git checkout "$@"
    fi
}

function git_current_branch() {
	git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///'
}

alias gs="git status"
alias gb="git branch"
alias ga="git add"
alias gaa="git add -A ."
alias gcm="git commit -vm"
alias gcam="git add -A .; git commit -vam"
alias gap="git add -p"
alias gc="git commit -v"
alias gm="git merge --no-ff"
alias gd='git diff' # | subl -n
alias gl="git log --graph --pretty=format':%C(red)%h%Cgreen%d%Creset %s %C(blue) %an, %ar%Creset'"
alias grb='git rebase -p'
alias gpl="git pull --rebase"
alias gup='git fetch origin && grb origin/$(git_current_branch)' # gup instead of gpl
alias gps='git push origin HEAD:$(git_current_branch)'
