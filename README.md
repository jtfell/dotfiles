# dotfiles

Configuration files

## Minimum setup

#### Brew

Run the official Brew install script.

```
/usr/bin/ruby -e "$(curl -fsSL
  https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

#### Utils

https://github.com/junegunn/heytmux

```
brew install wget zsh zsh-completions vim tmux fzf ripgrep zsh-syntax-highlighting
$(brew --prefix)/opt/fzf/install
sh -c "$(curl -fsSL
  https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

#### ZSH

https://github.com/lukechilds/zsh-nvm

```
```

#### SSH (agent + keys)

```

```

#### Get these dotfiles

```
git clone git@github.com:jtfell/dotfiles.git ~
rm ~/README.md
rm -rf ~/ansible
```

#### Vim

https://statico.github.io/vim3.html

https://github.com/airblade/vim-gitgutter
https://github.com/w0rp/ale
https://github.com/itchyny/lightline.vim
https://github.com/scrooloose/nerdtree
https://github.com/tomtom/tcomment_vim
https://github.com/vim-syntastic/syntastic
nerdtree
es.next.syntax.vim
vim-sensible

#### Python/PIP

Taken from https://medium.com/@briantorresgil/definitive-guide-to-python-on-mac-osx-65acd8d969d0

```
brew install python python3
pip install virtualenv virtualenvwrapper pip
pip3 install -U pip3
```


#### Node/NPM/NVM

```

```

Also get global packages (eslint, webpack etc)

#### Rust

https://github.com/rust-lang/rust.vim

```

```

#### Postgres


```

```

#### Redis


```

```



### AWS/Gcloud Setup

