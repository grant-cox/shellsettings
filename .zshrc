# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=/usr/local/texlive/2019/bin/x86_64-darwin:$PATH

if [[ ! -d $HOME/.oh-my-zsh ]]; then
    echo "installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export ZSH_CUSTOM=$ZSH/custom

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
if [[ ! -d $ZSH_CUSTOM/themes/powerlevel10k ]]; then
    echo "installing powerlevel10k"
    echo "$ZSH_CUSTOM"
    git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
fi
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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


########## Plugins
# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
if [[ ! -d $ZSH_CUSTOM/plugins/zsh-autosuggestions ]]; then 
    echo "installing zsh-suggestions"
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"





# check os type
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine="Linux";;
    Darwin*)    machine="Mac";;
    CYGWIN*)    machine="Cygwin";;
    MINGW*)     machine="MinGw";;
    *)          machine="UNKNOWN:${unameOut}"
esac




# OSX settings
if [ "$machine" = "Mac" ]
then
    alias bpython2.7='PYTHONPATH=~/githubs/bpython python2.7 -m bpython.cli'
    alias screen='/usr/local/Cellar/screen/4.6.2/bin/screen-*'
    alias superbrew='brew update && brew upgrade && brew cask upgrade && brew cleanup'
    [ -f /usr/local/bin/nvim ] && alias vim="nvim"
    [ -f /usr/local/bin/ctags ] && alias ctags="/usr/local/bin/ctags"
    # latex
    export PATH=/usr/local/texlive/2019/bin/x86_64-darwin:/usr/local/texlive/2019/bin/x86_64-darwin:/usr/local/texlive/2019/bin/x86_64-darwin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/Library/Frameworks/Python.framework/Versions/2.7/bin
    export PATH=/Users/grantcox/Library/Python/2.7/bin:/usr/local/texlive/2019/bin/x86_64-darwin:/usr/local/texlive/2019/bin/x86_64-darwin:/usr/local/texlive/2019/bin/x86_64-darwin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/Library/Frameworks/Python.framework/Versions/2.7/bin
    export PATH="/usr/local/opt/openssl/bin:$PATH"
    export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib" # fix not finding libraries installed with homebrew
fi




# Powerline
if [[ -f /usr/local/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    source /usr/local/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi




# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
alias clc=clear
alias checkout='git checkout'
alias weather="curl v2.wttr.in/Memphis"




# fuzzy file finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# python startup files
[ -f $HOME/.pythonrc.py ] && export PYTHONSTARTUP=$HOME/.pythonrc.py

# put private stuff in here
[ -f $HOME/.zshrc_extra ] && source $HOME/.zshrc_extra
