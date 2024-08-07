export ZSH="$HOME/.oh-my-zsh"

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Running on MacOS
  source ~/.macos
else
  # Add non-macos stuff here.
fi

# Powerlevel 10k custom theme
ZSH_THEME="powerlevel10k/powerlevel10k"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable installed plugins
plugins=(
    git
    dirhistory
    zsh-autosuggestions
    z
    copybuffer
    copyfile
    history
    zsh-ask
    zsh-syntax-highlighting
)

# Some collection dotfiles
source ~/.functions
source ~/.aliases
source ~/.env
source ~/.custom

source $ZSH/oh-my-zsh.sh

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/juliusbihler/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/juliusbihler/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/juliusbihler/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/juliusbihler/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

nvm install --lts
nvm use --lts