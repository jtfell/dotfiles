# Path to your oh-my-zsh installation.
export ZSH=/home/jtfell/.oh-my-zsh

DEFAULT_USER="jtfell"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lambda"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-nvm zsh-syntax-highlighting ssh-agent)

# User configuration
source $ZSH/oh-my-zsh.sh

# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH
export PATH=~/.local/bin:$PATH

# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

bindkey "^[[1;5C" forward-word  
bindkey "^[[1;5D" backward-word

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias npm-linked="ls -F node_modules | sed -n 's/@$//p' | xargs npm ls -g --depth 0"
alias ag="rg"
alias kill-port="lsof -i tcp:1337 | tail -1 | cut -d' ' -f5 | xargs kill -9"
alias ga="git add -A"
alias gc="git commit"
alias gl="git log --graph --decorate --pretty=oneline --abbrev-commit --all"

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

prompt_context () { }

# branches that were touched lately 
nb() {
  git for-each-ref --sort=-committerdate refs/heads/ -- format='%(committerdate:short) %(authorname) %(refname:short)' | head -n 10
}

# open pr page on github for current branch
pr () {
  local repo=`git remote -v | grep -m 1 "(push)" | sed -e "s/.*github.com[:/]\(.*\)\.git.*/\1/"`
  local branch=`git name-rev --name-only HEAD`
  echo "... creating pull request for branch \"$branch\" in \"$repo\""
  chromium "https://github.com/$repo/pull/new/$branch?expand=1"
}

#
# NODE
#

# This loads NVM
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
