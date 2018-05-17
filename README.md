# env
My custom setting for vim to use (I think) **minial settings** especially for both `python2`, `python3` and `node.js`. And also this also explains **a good way to install python and node.js using pyenv, nvm**.

- `homebrew` for OS X
- `apt-get` for Linux
- another packges will be describe below [`Installation`](#-Installation)


## Installation
We will use
- [`homebrew`](https://brew.sh) for OSX, `apt-get` for Linux
- [`neovim`](https://github.com/neovim/neovim) which tries to refacor Vim. To use neovim, it is recommended(or maybe necessary) to install python3(I will install both `python2` and `python3`). Most of all, **Neovim auto completion plugin ([`deoplete`](https://github.com/Shougo/deoplete.nvim)) is much easier to install and set configuration than Vim plugin**
- [`pyenv`](https://github.com/pyenv/pyenv) which is python version manager(like `nvm` in `node.js`) manage python versions **very easily**.
- [`pyenv-virtualenv`](https://github.com/pyenv/pyenv-virtualenv) which can make virtual environments with `pyenv`.
- [`nvm`](https://github.com/creationix/nvm) which is node version manager to use npm. And I **highly recommend** using nvm to install `node` and `npm`.


### Linux
  #### 1. Install pyenv

```
## install dependencies
sudo apt-get update
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm

## install git
sudo apt-get install git

## install pyenv, pyenv-virtualenv
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
```

Then, add this script to your `~/.zshrc` **or**
`~/.bashrc`.

```
export PATH="/home/bmy4415/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

Then enter this command
```
# when you use zsh
source ~/.zsh

# when you use bash
source ~/.bashrc
```

After this, you can enter `which pyenv` to check whether pyenv successfully installed. Results are like below
```
which pyenv

pyenv () {
	local command
	command="${1:-}"
	if [ "$#" -gt 0 ]
	then
		shift
	fi
	case "$command" in
		(activate | deactivate | rehash | shell) eval "$(pyenv "sh-$command" "$@")" ;;
		(*) command pyenv "$command" "$@" ;;
	esac
}
```

### 2. Install neovim
```
# to use add-apt-repository
sudo apt-get install software-properties-common -y

# install neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim -y
```

Now, we use `pyenv` which hepls us install many python versions and make virtualenv **very easily**. This will be used at neovim setting(`~/config/nvim/init.vim`).
```
# install python2.7.11 (or if you want, install any version)
# if some error happens, you can easily change to another python version
# because we use `pyenv`!!

pyenv install 2.7.11

pyenv virtualenv 2.7.11 neovim2
pyenv activate neovim2
pip install neovim
pyenv deactivate # go out virtualenv

# install python3.5.4 (or if you want, install any version)
# if some error happens, you can easily change to another python version
# because we use `pyenv`!!

pyenv install 3.5.4

pyenv virtualenv 3.5.4 neovim3
pyenv activate neovim3
pip install neovim
pyenv deactivate
```


### 3. Add init.vim

We will make `init.vim` at `~/.config/nvim/init.vim`. This file does same as `.vimrc` in original `Vim`.

```
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
```

Add python settings to `~/.config/nvim/init.vim`.

```
pyenv activate neovim2
pyenv which python # Copy this result
pyenv deactivate

pyenv activate neovim3
pyenv which python # Copy this result
pyenv deactivate
```

Then add below to `~/.config/nvim/init.vim`

```
let g:python_host_prog = '<Your result of pyenv which python on neovim2>'
let g:python3_host_prog = '<Your result of pyenv which python on neovim3>'
```

To check everyting goes well, start `nvim` and command `:CheckHealth`. You can ignore `WARNING`.

### 4. Install vim-plug
To use vim plugin, install [`vim-plug`](https://github.com/junegunn/vim-plug).

```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Then add below to your `~/.config/nvim/init.vim`

```
call plug#begin('~/.local/share/nvim/plugged')
call plug#end()
```

Finished!!. Now you can add any plugins or basic settings to your `~/.config/nvim/init.vim`. To add plugin,
- add `Plug {plugin name}` to your `~/.config/nvim/init.vim`
- :w
- :source %
- :PluginInstall

Also you can use my `init.vim`.



## TODO
* add how to set nvim python2, python3 path
* tern config file
* jsdoc2md
