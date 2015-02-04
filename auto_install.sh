#!/bin/sh
VIMHOME=~/.vim

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ -e "$VIMHOME" ] && die "$VIMHOME already exists."
[ -e "~/.vim" ] && die "~/.vim already exists."
[ -e "~/.vimrc" ] && die "~/.vimrc already exists."

# Change the repo
REPO_NAME=taiansu/vim_tsu

REPO_PATH=$(printf "git://github.com/%s.git" $REPO_NAME)
git clone "$REPO_PATH" vim_repo

VIM_DIR=$(printf "%s/vim_repo/vim" $(pwd))
VIMRC=$(printf "%s/vim_repo/vimrc" $(pwd))

cd
ln -s "$VIM_DIR" "$VIMHOME"
ln -s "$VIMRC" .vimrc

cd "$VIMHOME"
vim -n -c "set nomore" +PlugUpgrade +PlugInstall +qall

echo "Your own vim is ready to use. Happy Hacking～"
