#!/usr/bin/env bash

# function to check if a command exists
command_exists() {
	command -v "$1" &>/dev/null
}

# 2. install git and curl (if not installed)
if ! command_exists git; then
	echo "git not found. installing git..."
	sudo apt install -y git
fi

if ! command_exists curl; then
	echo "curl not found. installing curl..."
	sudo apt install -y curl
fi

if ! command_exists zsh; then
	echo "zsh not found. installing zsh..."
	sudo apt install -y zsh
fi

# Install fzf if not installed
if ! command_exists fzf; then
	echo "Fzf not found. Installing fzf..."
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
fi

# Install fzf if not installed
if ! command_exists starship; then
	echo "Fzf not found. Installing fzf..."
	curl -sS https://starship.rs/install.sh | sh
fi

if ! command_exists zoxide; then
	echo "zoxide not found. installing zoxide..."
	curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

if [ -d "~/.tmux/plugins/tpm" ]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/time
fi

# Install fzf if not installed
if ! command_exists tmux; then
	echo "Tmux not found. Installing tmux..."
	sudo apt install -y tmux
fi

sh ./nvim/install_nvim.sh

stow .

tmux new-session -d -s rtb123
tmux send-keys "tmux source ~/.config/tmux/tmux.conf" C-m
tmux kill-session -t rtb123

zsh -c "source ~/.config/zshrc/.zshrc"
