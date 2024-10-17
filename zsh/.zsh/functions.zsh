#
# idea from @wincent (https://github.com/wincent/wincent/blob/f7c51dfd808ea78ec10d6501eaa28f0a5b4796e9/roles/dotfiles/files/.zsh/functions#L41)
#
function tmux() {
  # If provided with args, pass them through.
  if [[ -n "$@" ]]; then
    command tmux "$@"
    return
  fi

  # Check for .tmux file (poor man's Tmuxinator).
  if [ -x .tmux ]; then
    ./.tmux
    return
  fi

  # Attach to existing session, or create one, based on current directory.
  SESSION_NAME=$(basename "$(pwd)")
  command tmux new -A -s "$SESSION_NAME"
}

function timezsh() {
  shell=${1-$SHELL}

  for i in $(seq 1 10); do
    /usr/bin/time $shell -i -c exit;
  done
}

#
# idea from Thorsten Ball (https://github.com/mrnugget/dotfiles/blob/c4624ed521d539856bcf764f04a295bb19093566/zshrc#L163)
#
# [f]uzzy check[o]ut
fo() {
  git branch --no-color --sort=committerdate --format='%(refname:short)' | fzf --header 'git checkout' | xargs git checkout
}

#
# idea from Thorsten Ball (https://github.com/mrnugget/dotfiles/blob/c4624ed521d539856bcf764f04a295bb19093566/zshrc#L167)
#
# [p]ull request check[o]ut
po() {
  gh pr list --author "@me" | fzf --header "checkout PR" | awk '{print ${NF-5}}' | xargs git checkout
}
