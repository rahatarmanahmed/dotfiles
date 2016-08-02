# My own stuff

## Set PATH
export PATH="$PATH:/usr/local/git/bin:$HOME/bin:$HOME/opt/bin"

## Set EDITOR
export EDITOR=vi

## Load aliases
source $HOME/.aliases

## Load nvm
export NVM_DIR="/Users/rahmed3/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Work stuff
if [ -d $HOME/Development/apache-maven-3.3.9/bin ]; then
	export PATH=$HOME/Development/apache-maven-3.3.9/bin:$PATH
fi

export JAVA_HOME=$(/usr/libexec/java_home)
