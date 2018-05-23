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

```bash
## install dependencies
sudo apt-get update
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm

## install pyenv, pyenv-virtualenv
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
```

Then, just copy below and paste it to your `~/.zshrc` **or**
`~/.bashrc`.

```bash
# you can change ~/.zshrc to ~/.bashrc
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

Then enter this command

```bash
# when you use zsh
source ~/.zsh

# when you use bash
source ~/.bashrc
```

After this, you can enter `command -v pyenv` to check whether pyenv successfully installed.

```bash
command -v pyenv
```

#### 2. Install neovim

```bash
# to use add-apt-repository
sudo apt-get install software-properties-common -y

# install neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim -y
```

Now, we use `pyenv` which hepls us install many python versions and make virtualenv **very easily**. This will be used at neovim setting(`~/config/nvim/init.vim`).

```bash
# install python2.7.11 (or if you want, install any version)
# if some error happens, you can easily change to another python version
# because we use `pyenv`!!

pyenv install 2.7.11

pyenv virtualenv 2.7.11 neovim2
pyenv activate neovim2
pip install neovim
# go out of virtualenv
pyenv deactivate

# install python3.5.4 (or if you want, install any version)
# if some error happens, you can easily change to another python version
# because we use `pyenv`!!

pyenv install 3.5.4

pyenv virtualenv 3.5.4 neovim3
pyenv activate neovim3
pip install neovim
# go out of virtualenv
pyenv deactivate
```

#### 3. Add init.vim

We will make `init.vim` at `~/.config/nvim/init.vim`. This file does same as `.vimrc` in original `Vim`.

```bash
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
```

Add python settings to `~/.config/nvim/init.vim`.

```bash
pyenv activate neovim2

# Copy this result
echo let g:python_host_prog = \'`pyenv which python`\' >> ~/.config/nvim/init.vim
pyenv deactivate

pyenv activate neovim3

# Copy this result
echo let g:python3_host_prog = \'`pyenv which python`\' >> ~/.config/nvim/init.vim
pyenv deactivate
```

To check everyting goes well, start `nvim` and command `:CheckHealth`. You can ignore `WARNING`.

#### 4. Set alias

If you command `vi {filename}` than you use system vi which symbolically links to system vim. You can easily use vi command as nvim via alias.

```bash
# you can change ~/.zshrc to ~/.bashrc
echo alias vi=\"`which nvim`\" >> ~/.zshrc
```

Actually we've **finished!!!** If you want to use my `init.vim`, I recommend below.

#### 5. Install vim-plug

To use vim plugin, install [`vim-plug`](https://github.com/junegunn/vim-plug).

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Then add below to your `~/.config/nvim/init.vim`

```bash
call plug#begin('~/.local/share/nvim/plugged')
call plug#end()
```

Finished!!. Now you can add any plugins or basic settings to your `~/.config/nvim/init.vim`. To add plugin,

- add `Plug {plugin name}` to your `~/.config/nvim/init.vim`
- :w
- :source %
- :PlugInstall

#### 6. Cautions

If you copy and paste my `init.vim`, there can be error because

- python and python3 path are different with me
- set options before plugin installed

### OS X

#### 1. Install [`homebrew`](https://brew.sh)

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

#### 2. Install pyenv, pyenv-virtualenv

```bash
brew update
brew install pyenv
brew install pyenv-virtualenv
```

Then, add this script to your `~/.zshrc` **or**
`~/.bashrc`.

```bash
export PATH="/home/bmy4415/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

Then enter this command

```bash
# when you use zsh
source ~/.zsh

# when you use bash
source ~/.bashrc
```

After this, you can enter `command -v pyenv` to check whether pyenv successfully installed.

```bash
command -v pyenv
```

#### 3. Install neovim

```bash
brew install neovim
```

Now, we use `pyenv` which hepls us install many python versions and make virtualenv **very easily**. This will be used at neovim setting(`~/config/nvim/init.vim`).

```bash
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

#### 4. Add init.vim

We will make `init.vim` at `~/.config/nvim/init.vim`. This file does same as `.vimrc` in original `Vim`.

```
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
```

Add python settings to `~/.config/nvim/init.vim`.

```bash
pyenv activate neovim2

# Copy this result
pyenv which python
pyenv deactivate

pyenv activate neovim3

# Copy this result
pyenv which python
pyenv deactivate
```

Then add below to `~/.config/nvim/init.vim`

```bash
let g:python_host_prog = '<Your result of pyenv which python on neovim2>'
let g:python3_host_prog = '<Your result of pyenv which python on neovim3>'
```

To check everyting goes well, start `nvim` and command `:CheckHealth`. You can ignore `WARNING`.

#### 5. Set alias

If you command `vi {filename}` than you use system vi which symbolic links to system vim. You can easily use vi command to use nvim via alias. Add below to your `~/.bashrc` or `~/.zshrc`.

```bash
# Copy this result
which nvim
alias vi="<your result>" # to use nvim
```

Actually we've node. If you want to use my `init.vim`, I recommend below.

#### 6. Install vim-plug

To use vim plugin, install [`vim-plug`](https://github.com/junegunn/vim-plug).

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Then add below to your `~/.config/nvim/init.vim`

```bash
call plug#begin('~/.local/share/nvim/plugged')
call plug#end()
```

Finished!!. Now you can add any plugins or basic settings to your `~/.config/nvim/init.vim`. To add plugin,

- add `Plug {plugin name}` to your `~/.config/nvim/init.vim`
- :w
- :source %
- :PlugInstall

### 7. Cautions

If you copy and paste my `init.vim`, there can be error because

- python and python3 path are different with me
- set options before plugin installed

## Javascript autocompletion

If you want to `javascript` completions, you can use [`carlitux/deoplete-ternjs`](https://github.com/carlitux/deoplete-ternjs) and it requiers `npm`. I highly recommend `nvm` to manager `node.js` versions and install `npm` automatically. 

```bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
```

Then copy below to your `~/.bashrc` or `~/.zshrc`. (It can be already added)

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

You can check whether nvm installed clearly.

```bash
# when you use zsh
source ~/.zsh
command -v nvm

# when you use bash
source ~/.bashrc
command -v nvm
```

Then to use `npm`, install node.

```bash
# You can choose any version.
# Set default node version. You can change it whenever very easily
# because we use nvm!!!
nvm install v8.11.1
nvm alias default v8.11.1
```

Then, install tern

```bash
npm install -g tern
```

I also added `.tern-project` example. You can add it to your `$HOME` path(`~/`) or project root.

## TODO

- jsdoc2md