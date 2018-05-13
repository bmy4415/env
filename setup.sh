#!bin/sh
vundle="$HOME/.vim/bundle/Vundle.vim" # common vundle path, ~/.vim/bundle/Vundle.vim
molokai="$HOME/.vim/colors/molokai.vim" # molokai path, ~/.vim/colors/molokai.vim
vimrc="$HOME/.vimrc" # common vimrc path, ~/.vimrc
colors="$HOME/.vim/colors" # vim color themes directory


# check whether vundle installed
if [ ! -d "$vundle" ]
then
	# bundle is not installed, so install bundle
	echo "$vundle not exists, install vundle"
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi


# check whether molokai theme installed
if [ ! -f "$molokai" ]
then
	# molokai theme no installed, so install molokai theme
	echo "$molokai not exists, install molokai theme"
	git clone https://github.com/tomasr/molokai.git ~/molokai

	# if colors directory not exists, make it
	if [ ! -d "$colors" ]
	then
		vm ~/molokai/colors ~/.vim/
	else
		mv ~/molokai/colors/molokai.vim ~/.vim/colors/molokai.vim
	fi

	rm -rf ~/molokai
fi


# check whether vimrc installed
if [ -f "$vimrc" ]
then
	echo "vimrc already exists. If you want to use my .vimrc, remove your ~/.vimrc"
else
	echo "vimrc not exists, use my .vimrc"
	cp $PWD/.vimrc ~/.vimrc
	vim +PluginInstall +qall # install plugin
	# vim +PluginClean # remove unused plugin
	
fi
