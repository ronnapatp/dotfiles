.PHONY: help

help: ## Print command list
	@perl -nle'print $& if m{^[a-zA-Z0-9_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# _prepare:
# 	@git submodule update --init --recursive

# bootstrap: _prepare dotfiles _bootstrap macos ## Bootstrap new machine

bootstrap:
	chezmoi init

dotfiles: ## Update dotfiles
	chezmoi apply -i files

apply: ## Run chezmoi apply
	@chezmoi apply

macos: ## Run macos script
	chezmoi cat ~/.chezmoi_scripts/98-macos-preferences.sh | bash
	chezmoi cat ~/.chezmoi_scripts/99-macos-name.zsh | zsh

# code: ## Clone Repositories with ghq
# 	@./install -c config/code.conf.yml --plugin-dir dotbot-ghq

# brew: ## Install brew & cask packages
# 	@./install -c config/packages.conf.yml

# brew-light: ## Install light version of brewfile (Minimal)
# 	@./install -c config/packages-light.yml

# brew-x86: ## Install x86-compatible Homebrew packages (Expected to Apple Silicon Macs)
# 	@./install -c config/packages-x86.yml

# tools: ## Install non-brew tools eg. tmux package manager
# 	@./install -c config/tmux.conf.yml

# asdf: ## Install asdf-vm
# 	@./install -c config/asdf-install.conf.yml
# 	@./install -c config/asdf.conf.yml --plugin-dir dotbot-asdf

# sync: ## Sync local configuration from Google Drive, Dropbox, etc.
# 	@./install -c config/sync.conf.yml

# update: ## Update everything
# 	@make _prepare
# 	@./install -c config/update.conf.yml

# vim: ## Setup vim
# 	@./install -c config/vim.conf.yml

# fish_shell: ## Setup Fish shell
# 	@./install -c config/fish.conf.yml

# all: _prepare dotfiles _bootstrap code brew tools asdf sync ## Run all tasks at once
