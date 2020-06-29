# Misc Aliases

alias reload='. ~/.zshrc'
eval "$(thefuck --alias)"

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias bk="cd -"
alias hm="cd ~"

# Vagrant
alias vu="vagrant up"
alias vd="vagrant halt"
alias vs="vagrant ssh"
alias vr="vagrant halt && vagrant up && vagrant ssh"

# Postgres
alias pg_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

# Hosts
alias hosts="sudo nano /etc/hosts"

# Utils
alias uuid="uuidgen | tr -d '\n' | tr '[:upper:]' '[:lower:]' | pbcopy && pbpaste && echo"

# jenv
#export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"
#alias jenv_set_java_home='export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"'

#laravel
function laralog() {
	base="storage/logs/laravel.log"
	if [ $# -eq 0 ]
	then
		tail -f $base
	else
		search="> $@"
		tail -f $base | grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} --line-buffered "$search"
	fi
}
