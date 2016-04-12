#!/bin/bash

os="$(uname)"

if [[ "$os" == "Darwin" ]]; then

    # make sure brew is available
    makepath=$(which brew)
    if [[ -z $makepath ]]; then
        echo "Please install Homebrew first..."
        open "http://brew.sh/"
        exit
    fi

    brew install macvim

    # better php ctags:
    curl https://raw.githubusercontent.com/shawncplus/phpcomplete.vim/master/misc/ctags-better-php.rb > /usr/local/Library/Formula/ctags-better-php.rb
    brew install ctags-better-php
elif [[ "$os" == "Linux" ]]; then
    echo "Install vim from your os repositories"
    echo ""
fi


# symlink .vimfiles folder
if [ ! -e "$HOME/.vim" ]; then
	ln -s "$PWD" "$HOME/.vim"
else
	if [ ! -L "$HOME/.vim" ]; then
		echo "WARNING: $HOME/.vim exists but is not a symlink."
	fi
fi

# create .vimfiles/plugs folder
if [ ! -d "$HOME/.vimfiles/plugs" ]; then
	echo "INFO: $HOME/.vimfiles/plugs doesn't exist. Creating it..."
	mkdir "$HOME/.vimfiles/plugs"
fi

# install vim-plug
curl -fLo "$HOME/.vimfiles/autoload/plug.vim" \
    --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# symlink .vimrc
if [ ! -e "$HOME/.vimrc" ]; then
	ln -s "$PWD/.vimrc" "$HOME/.vimrc"
else
	if [ ! -L "$HOME/.vimrc" ]; then
		echo "WARNING: $HOME/.vimrc exists but is not a symlink."
	fi
fi

# symlink .gvimrc
if [ ! -e "$HOME/.gvimrc" ]; then
	ln -s "$PWD/.gvimrc" "$HOME/.gvimrc"
else
	if [ ! -L "$HOME/.gvimrc" ]; then
		echo "WARNING: $HOME/.gvimrc exists but is not a symlink."
	fi
fi

# symlink .ctags
if [ ! -e "$HOME/.ctags" ]; then
	ln -s "$PWD/.ctags" "$HOME/.ctags"
else
	if [ ! -L "$HOME/.ctags" ]; then
		echo "WARNING: $HOME/.ctags exists but is not a symlink."
	fi
fi

# symlink .vimsauce
if [ ! -e "$HOME/.vimsauce" ]; then
	ln -s "$PWD/.vimsauce" "$HOME/.vimsauce"
else
	if [ ! -L "$HOME/.vimsauce" ]; then
		echo "WARNING: $HOME/.vimsauce exists but is not a symlink."
	fi
fi
