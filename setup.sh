#!bin/sh
bundle="$HOME/.vim/bundle" # common bundle path, ~/.vim/bundle
vimrc="$HOME/.vimrc" # common vimrc path, ~/.vimrc

echo $bundle

if [ -d "$bundle" ]
then
	# bundle is already installed so do nothing
else
	# bundle is not installed, so install bundle
	echo "$bundle not exists"
	
fi

if [ -f "$vimrc" ]
then
	echo "vimrc exists"
else
	echo "vimrc not exists"
fi
