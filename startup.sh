#!/bin/bash

set -e

function add_ssh_key() {
	PUB_SSH=~/.ssh/id_ed25519.pub
	if [ -f $PUB_SSH ]; then
		printf "Skipping SSH key generation key already exists...\n"
	else
		read -p "Please enter email used for github: " GITHUB_EMAIL
		ssh-keygen -t ed25519 -C "$GITHUB_EMAIL"
	fi

	printf "Add ssh to github before continuing, see: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account /n"

	read -p "Continue? " -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
	    printf "Continuing the install script...\n"
	fi
}

function install_brew() {
	if type brew &> /dev/null; then
		printf "Skipping brew install brew already installed...\n"
	else
		printf "Installing brew...\n"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

		printf "Adding brew to PATH...\n"
		echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
		eval "$(/opt/homebrew/bin/brew shellenv)"
	fi
}

function install_git() {
	if type git &> /dev/null; then
		printf "Skipping git install git already installed...\n"
	else
		printf "Installing git...\n"
		brew install git
	fi

	LOCAL_GIT_CONFIG=~/.gitconfig.local
	if [ -f $LOCAL_GIT_CONFIG ]; then
		printf "Local git config already added...\n"
	else
		read -p "Please enter your user name on github: " GITHUB_USER
		printf "Adding user name and email to local gitconfig...\n"
		echo -e "[user] \n\tname = $GIHTUB_USER\n\temail = $GITHUB_EMAIL" >> $LOCAL_GIT_CONFIG
	fi
}

function install_dotfiles() {
	if test -d ~/.dotfiles &> /dev/null; then
		printf "Skipping dotfiles clone directory already exists...\n"
	else
		printf "Installing dotfiles...\n"
		git clone --recurse-submodules -j8 "git@github.com:rbaumgardner93/.dotfiles.git"
	fi
}

function install_brew_packages() {
	printf "Installing packages from brew...\n"
	brew bundle --file=~/.dotfiles/brew/work/Brewfile
}

function stow_dotfile_directories() {
	printf "Stowing dotfile directories...\n"
	stow -d ~/.dotfiles bin git kitty nvim tmux wezterm zsh
}

function source_zsh() {
	printf "Adding .zsh_private file...\n"
	touch ~/.zsh_private

	printf "Source zshrc...\n"
	source ~/.zshrc
}

add_ssh_key
install_brew
install_dotfiles
install_brew_packages
stow_dotfile_directories
source_zsh
