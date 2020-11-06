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

install-dotfiles: ## Setup dotfile links
	./scripts/install/install-dotfiles.sh

delete-dotfiles: ## Remove dotfile links
	./scripts/delete/delete-dotfiles.sh

ansible-provision: ## Run ansible playbook to provision localhost
	$(MAKE) -C ansible provision

vagrant-pentest-box: ## bootstrap the pentest box
	vagrant up pentest

vagrant-win10-box: ## start the win10 box
	vagrant up win10

vagrant-hibernate-win10-box: ## hibernate the win10 box
	vagrant suspend win10

vagrant-test-ubuntu18.04: ## Run provisioning test on Ubuntu18.04
	vagrant up test-ubuntu18.04
	vagrant destroy -f test-ubuntu18.04

setup-secrets: ## Set secret files
	$(MAKE) -C scripts/secrets/ setup-secrets
