# Rahat's dotfiles

This repository stores my dotfiles for OS X using the bare git repo idea outlined by Nicola Paolucci](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

# Installing on a new system

```sh
# Clone dotfiles repo
git clone --bare git@github.com:rahatarmanahmed/dotfiles.git $HOME/.dotfiles

# Create temporary git alias (this is in the .aliases in the dotfiles repo)
function dot {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

# Attempt to checkout dotfiles
dot checkout

# If checkout failed, some existing conflicting files need to be moved
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    mkdir -p .config-backup
    dot checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
dot checkout

# Set config to not show untracked files
dot config status.showUntrackedFiles no
