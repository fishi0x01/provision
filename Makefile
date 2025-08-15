.PHONY: help

help: ## Prints help for targets with comments
	@grep -E '^[a-zA-Z0-9._-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

nix-default-env: ## Setup default nix-env
	./nix/installer/install-env.sh

nix-home-env: ## Setup home nix-env
	./nix/installer/install-env.sh fishi0x01-home

nix-pen-env: ## Setup pentesting nix-env
	./nix/installer/install-env.sh fishi0x01-pen

nix-minimal-env: ## Setup minimal nix-env
	./nix/installer/install-env.sh fishi0x01-minimal

nix-gc: ## Free up some storage
	nix-store --gc
	nix-store --optimise

install-dotfiles: ## Setup dotfile links
	./scripts/install/install-dotfiles.sh

delete-dotfiles: ## Remove dotfile links
	./scripts/delete/delete-dotfiles.sh

ansible-fedora: ## Run ansible playbook to provision localhost
	$(MAKE) -C ansible fedora

backup-home: ## Run restic backup for home machines
	restic -r sftp:fishi@192.168.178.25:/share/data/Backups/restic/home --verbose=2 backup \
      ~/Workspaces \
      ~/Documents \
      ~/Pictures \
      ~/Downloads \
      ~/Music \
      ~/provision \
      ~/.password-store 

restore-home: ## Run restic restore in-place for home machines
	restic -r sftp:fishi@192.168.178.25:/share/data/Backups/restic/home --verbose=2 restore latest --target $(HOME) --overwrite always

vagrant-start-pentest: ## bootstrap the pentest box
	vagrant up pentest

vagrant-hibernate-pentest: ## hibernate the pentest box
	vagrant suspend pentest

vagrant-start-win10: ## start the win10 box
	vagrant up win10

vagrant-hibernate-win10: ## hibernate the win10 box
	vagrant suspend win10

ansible-test-ubuntu20.04: ## Test workspace provisioning on Ubuntu20.04
	vagrant up test-ubuntu20.04
	vagrant destroy -f test-ubuntu20.04

setup-secrets: ## Fetch keybase private repos - requires keybase installed and logged in
	mkdir -p ~/Workspaces/keybase/
	git clone keybase://private/fishi0x01/pass ~/Workspaces/keybase/pass || true
	git clone keybase://private/fishi0x01/pentest ~/Workspaces/keybase/pentest || true
	git clone keybase://private/fishi0x01/configs ~/Workspaces/keybase/configs || true
	git clone keybase://private/fishi0x01/cv ~/Workspaces/keybase/cv || true
	ln -sfn ${HOME}/Workspaces/keybase/pass ${HOME}/.password-store
	ln -sfn ${HOME}/Workspaces/keybase/configs/ssh ${HOME}/.ssh/config

test-fedora42: ## Test fedora42 setup in a docker container
	docker build -t test-fedora42:latest -f test/Dockerfile.fedora42 .

