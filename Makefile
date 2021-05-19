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

ansible-provision: ## Run ansible playbook to provision localhost
	$(MAKE) -C ansible workstation

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

setup-secrets: ## Set secret files
	$(MAKE) -C scripts/secrets/ setup-secrets
