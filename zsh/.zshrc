eval "$(fnm env --use-on-cd)"

export PATH="$HOME/.config/bin:$HOME/.config/neovim/bin:$HOME/go/bin:$HOME/bin:$HOME/.local/bin:$PATH"

#########
# ALIASES
#########

if type eza &> /dev/null; then
    alias ls="eza --icons"
    alias ll="eza --icons --long --git"
    alias la="eza --icons --long --git --all"
fi

if type bat &> /dev/null; then
    alias cat="bat"
fi

alias t="tmux"
alias ts="tmux-sessionizer"
alias e="exit"
alias mv="mv -iv"
alias tmuxrc="vim ~/.tmux.conf"
alias vimrc="vim ~/.config/nvim/init.lua"
alias zshrc="vim ~/.zshrc"
alias szshrc="exec zsh"

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
## PRIVATE
#########

if [ -f "$HOME/.zsh_private" ]; then
    source "$HOME/.zsh_private"
else
    print "404: ~/.zsh_private not found."
fi

#########
# Plugins
#########

source "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"

#########
# Functions
#########

source "$HOME/.zsh/functions.zsh"

#########
# HISTORY
#########

HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_VERIFY SHARE_HISTORY

eval "$(zoxide init zsh)"

# Needs to initialize after everything else is set up
eval "$(starship init zsh)"
