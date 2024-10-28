#!/bin/bash

set -e

function install_brew() {
	if type brew &> /dev/null; then
		printf "Skipping brew install brew already installed...\n"
	else
		printf "Installing brew...\n"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi

	if type git &> /dev/null; then
		printf "Skipping git install git already installed...\n"
	else
		printf "Installing git...\n"
		brew install git
	fi
}

function install_dotfiles() {
	if test -d ~/.dotfiles &> /dev/null; then
		printf "Skipping dotfiles clone directory already exists...\n"
	else
		printf "Intstalling dotfiles...\n"
		git clone --recurse-submodules -j8 "git@github.com:rbaumgardner93/.dotfiles.git"
	fi
}

function install_brew_packages() {
	printf "Intstalling packages from brew...\n"
	brew bundle --file=~/.dotfiles/brew/work/Brewfile
}

function stow_dotfile_directories() {
	printf "Stowing dotfile directories...\n"
	stow -d ~/.dotfiles bin git kitty nvim tmux wezterm zsh
}

function source_zsh() {
	printf "Source zshrc...\n"
	source ~/.zshrc
}

install_brew
install_dotfiles
install_brew_packages
stow_dotfile_directories
source_zsh
