i# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

export PYENV_ROOT="$HOME/.pyenv"

export PATH="$PYENV_ROOT/bin:$HOME/.config/bin:$HOME/.config/neovim/bin:$HOME/go/bin:$HOME/dotfiles/bin:$PATH"

# Path to your zsh file
export ZSH="$HOME/.zshrc"

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "spaceship-prompt/spaceship-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "agkozak/zsh-z"

fpath=(~/.zsh.d/ $fpath)

# aliases
alias yw="yarn workspace"
alias t="tmux"
alias ts="tmux-sessionizer"
alias e="exit"
alias mv="mv -iv"
alias tmuxrc="nvim ~/.tmux.conf"
alias vimrc="nvim ~/.config/nvim/init.vim"
alias zshrc="nvim ~/.zshrc"
alias szshrc="exec zsh"

eval "$(fnm env --use-on-cd)"
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
