# Set ZSH to the oh-my-zsh directory
export ZSH="$HOME/.oh-my-zsh"

# Source macOS specific configuration
[[ "$OSTYPE" == "darwin"* ]] && source ~/.macos

# Powerlevel10k custom theme configuration
ZSH_THEME="powerlevel10k/powerlevel10k"
P10K_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
[[ -r "$P10K_CACHE" ]] && source "$P10K_CACHE"
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

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

# Source collection of dotfiles
for file in ~/.{functions,aliases,env,custom}; do
  [[ -f $file ]] && source $file
done

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Conda initialization
__conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    CONDA_SH="$HOME/miniconda3/etc/profile.d/conda.sh"
    [[ -f "$CONDA_SH" ]] && source "$CONDA_SH" || export PATH="$HOME/miniconda3/bin:$PATH"
fi
unset __conda_setup

# Install and use Node.js LTS version
nvm install --lts > /dev/null 2>&1
nvm use --lts > /dev/null 2>&1
