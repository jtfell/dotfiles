# dotfiles

Configuration files

## Minimum setup

#### Brew

Run the official Brew install script.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Utils

```
brew install wget zsh zsh-completions vim tmux fzf ripgrep zsh-syntax-highlighting
$(brew --prefix)/opt/fzf/install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

#### Get these dotfiles

```
git clone git@github.com:jtfell/dotfiles.git ~
rm ~/README.md
```
