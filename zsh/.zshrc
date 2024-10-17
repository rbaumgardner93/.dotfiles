eval "$(fnm env --use-on-cd)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

export PATH="$HOME/.config/bin:$HOME/.config/neovim/bin:$HOME/go/bin:$HOME/bin:$PATH"

# Path to your zsh file
export ZSH="$HOME/.zshrc"

#########
# PLUGINS
#########

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "romkatv/powerlevel10k"
plug "zsh-users/zsh-syntax-highlighting"
plug "agkozak/zsh-z"

#########
# ALIASES
#########

if type lsd &> /dev/null; then
    alias ls="lsd"
fi

if type bat &> /dev/null; then
    alias cat="bat"
fi

alias yw="yarn workspace"
alias cat="bat"
alias t="tmux"
alias ts="tmux-sessionizer"
alias e="exit"
alias mv="mv -iv"
alias tmuxrc="vim ~/.tmux.conf"
alias vimrc="vim ~/.config/nvim/init.vim"
alias zshrc="vim ~/.zshrc"
alias szshrc="exec zsh"

#########
# NEOVIM
#########

if type nvim &> /dev/null; then
    alias vim="nvim"
    export EDITOR="nvim"
    export GIT_EDITOR="nvim"
else
    export EDITOR="vim"
    export GIT_EDITOR="vim"
fi

#########
# PYTHON
#########

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#########
## PRIVATE ##
#########
#
if [ -f $HOME/.zsh_private ]; then
    source ~/.zsh_private
else
    print "404: ~/.zsh_private not found."
fi

#########
# Functions
#########
#
source "$HOME/.zsh/functions.zsh"

#########
# COMPLETION
#########

# Load and initialise completion system
autoload -Uz compinit
# speed up completion init, see: https://gist.github.com/ctechols/ca1035271ad134841284
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
    compinit;
else
    compinit -C;
fi;

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# added by Webi for pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

