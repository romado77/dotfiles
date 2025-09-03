setopt noautomenu
setopt nomenucomplete
setopt extended_glob
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history

SAVEHIST=1000
HISTSIZE=1000


bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR='nvim'

export ZSH="/Users/rdolgush/.oh-my-zsh"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export XDG_CONFIG_HOME=$HOME/.config
export ZDOTDIR=$HOME/dotfiles/zsh/
export BAT_CONFIG_PATH="$XDG_CONFIG_HOME/bat/bat.conf"


# export PYTHON_VENV_NAME=".venv"
# export PYTHON_AUTO_VRUN=true

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
docker
node
kubectl
kube-ps1
brew
macos
jsontools
# direnv
virtualenv-autodetect
# python
vi-mode
)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

fpath+=(/Users/rdolgush/.docker/completions)
fpath+=($(brew --prefix)/share/zsh-completions)
fpath+=(/opt/homebrew/share/zsh/site-functions)

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -Uz compinit && compinit

export PATH="/usr/local/opt/libarchive/bin:/Users/rdolgush/go/bin:$PATH"
# export PYDEVD_LOAD_NATIVE_LIB=0
# export LIBARCHIVE=/opt/homebrew/Cellar/libarchive/3.6.2_1/lib/libarchive.13.dylib

PATH="/opt/homebrew/opt/inetutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/libarchive/bin:$PATH"

export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"
export PATH=$JAVA_HOME/bin:$PATH
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

export ITERM2_SQUELCH_MARK=1
#
source $ZSH/oh-my-zsh.sh

eval "$(fzf --zsh)"
eval "$(direnv hook zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# To customize prompt, run `p10k configure` or edit ~/dotfiles/zsh//.p10k.zsh.
[[ ! -f ~/dotfiles/zsh//.p10k.zsh ]] || source ~/dotfiles/zsh//.p10k.zsh

source $HOME/scripts/scripts.zsh
source $HOME/scripts/fzf-git.sh/fzf-git.sh
source $HOME/.zsh_aliases
source $HOME/.uv
