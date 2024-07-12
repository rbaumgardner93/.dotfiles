eval "$(fnm env --use-on-cd)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

export PYENV_ROOT="$HOME/.pyenv"

export PATH="$PYENV_ROOT/bin:$HOME/.config/bin:$HOME/.config/neovim/bin:$HOME/go/bin:$HOME/dotfiles/bin:$PATH"

# Path to your zsh file
export ZSH="$HOME/.zshrc"

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "romkatv/powerlevel10k"
plug "zsh-users/zsh-syntax-highlighting"
plug "agkozak/zsh-z"

# aliases
alias yw="yarn workspace"
alias cat="bat"
alias vim="nvim"
alias t="tmux"
alias ts="tmux-sessionizer"
alias e="exit"
alias mv="mv -iv"
alias tmuxrc="vim ~/.tmux.conf"
alias vimrc="vim ~/.config/nvim/init.vim"
alias zshrc="vim ~/.zshrc"
alias szshrc="exec zsh"
alias packer="cd $HOME/.local/share/nvim/site/pack/packer"
alias inkdrop="cd $HOME/Library/Application\ Support/inkdrop"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if [ -f $HOME/.zsh_private ]; then
    source ~/.zsh_private
else
    print "404: ~/.zsh_private not found."
fi

source "$HOME/.zsh/functions.zsh"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# added by Webi for pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

