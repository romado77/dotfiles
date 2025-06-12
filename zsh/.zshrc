# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
#
setopt noautomenu
setopt nomenucomplete
autoload -U compinit && compinit
setopt extended_glob
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history
SAVEHIST=1000
HISTSIZE=1000

fpath+=(/Users/rdolgush/.docker/completions)

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR='nvim'

export ZSH="/Users/rdolgush/.oh-my-zsh"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export XDG_CONFIG_HOME=$HOME/.config
# export STARSHIP_LOG=error
export PYTHON_VENV_NAME=".venv"
export PYTHON_AUTO_VRUN=true

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
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
ansible
git
iterm2
docker
node
kubectl
kube-ps1
brew
macos
yarn
jsontools
zsh-completions
zsh-autosuggestions
virtualenv-autodetect
python
vi-mode
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi='nvim'
alias vim='nvim'
alias wireshark='open /Applications/Wireshark.app -n'
alias dps='docker container ps'
alias dcl='docker container ls'
alias dcla='docker container ls -a'
alias dcpr='docker container prune -f'
alias dil='docker image ls'
alias dirma='~/.dirm.sh'
alias dci='docker container inspect'
alias dcrm='docker container rm'
alias dclog='docker container logs'
alias dclogf='docker container logs -f'
alias dipr='docker image prune -f'
alias dipra='docker image prune -f -a'
alias dirm='docker image rm'
alias dcp='docker container ps'
alias dcs='docker container stop'
alias k='kubectl'
alias kpods='k get pods -o wide'
alias klogs='k logs -f'
alias kexec='f() { k exec -it $1 -- $2; unset -f f; };f'
alias kpodsg='k get pods -o wide | grep'
alias kconf='k get configmap'
alias ksec='k get secret'
#
alias e64='f() { echo $@ | base64; unset -f f; };f'
alias d64='f() { echo $@ | base64 -D; unset -f f; };f'
alias zz='find . -name "*.gz" | xargs -n 1 gzip -d'
alias tt='find . -name "*.tar" | xargs -n 1 tar xvf'
alias jcp='cp jtapi*.csv ~/Downloads/jtapi/.'
alias jtapi='python ~/Dev/temp/jtapi.py'
alias uz="~/.uz.sh"
alias u7z="~/.u7z.sh"
alias ur="~/.ur.sh"
alias c='f(){ cd ~/CASES/$1; };f'
alias d='cd ~/Downloads/'
alias dev='cd ~/Dev/'
alias ipcbu='python3 ~/Dev/ipcbu_upload/upload.py'
alias jless='python3 ~/Dev/tools/jless.py'
alias swds='lftp -p 990 -u rdolgush swds.cisco.com'
alias fuel='/usr/local/bin/python3 /Users/rdolgush/Dev/my/fuel.py'
alias cat='python3 ~/Dev/tools/tcat.py'
alias rgc='rg -INa'
alias call='find . -name "calll*" | xargs -n 1 rg -a'
alias jh='rg -INa "http.*\*\-.*(request|response) | sort"'
alias jx='rg "TriClient.*(Send|Recv)|CTriTPConnectionClient::OnConnectSuccess|CTriTPConnectionClient::disconnect" | sort'
alias jsso='rgc "SsoAuthRequest|BrowserListener-Logger"'
alias jssod='rgc "SsoAuthRequest|BrowserListener-Logger|Receive ServerTrust Challenge|UI.Lifecycle.Login.*webView.*didCommitNavigation|document len"'
alias jsip='rgc "sipio|CurrentAppStatus|updateTelephonyMenu|getNetworkType" | sort'
alias graph='git log --oneline --decorate --all --graph'
#
alias pipuninstallall="pip uninstall -y -r <(pip freeze)"
alias deploy="~/deploy.sh"
alias upload="/usr/local/bin/upload.sh"
# alias ce="cd ~/Dev/callengine"
alias cece="cd ~/Dev/callengine/callengine"
alias ls="lsd"
alias md2html='_md2html() { full_path=$(realpath "$1"); pandoc -f markdown "$full_path" -o "/tmp/$(basename "$full_path" .md).html" && open "/tmp/$(basename "$full_path" .md).html"; }; _md2html'

source /Users/rdolgush/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.cargo/env

export PATH="/usr/local/opt/libarchive/bin:/Users/rdolgush/go/bin:$PATH"
# export PYDEVD_LOAD_NATIVE_LIB=0
# export LIBARCHIVE=/opt/homebrew/Cellar/libarchive/3.6.2_1/lib/libarchive.13.dylib

PATH="/opt/homebrew/opt/inetutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/libarchive/bin:$PATH"

export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"
export PATH=$JAVA_HOME/bin:$PATH
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

# export STARSHIP_CONFIG=~/.config/starship/starship.toml
export BAT_THEME=tokyonight_night
export ITERM2_SQUELCH_MARK=1
# export BAT_THEME="Catppuccin-mocha"
#
source ~/.fzf/scripts.zsh
source ~/fzf-git.sh/fzf-git.sh

eval "$(fzf --zsh)"
eval "$(direnv hook zsh)"
# eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(uv generate-shell-completion zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
