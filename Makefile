.PHONY: help

help: ## Prints help for targets with comments
	@grep -E '^[a-zA-Z0-9._-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

nix-default-env: ## Setup default nix-env
	./nix/installer/install-env.sh

nix-complete-env: ## Setup complete nix-env
	./nix/installer/install-env.sh fishi0x01-complete

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

vagrant-pentest-box: ## ssh into the pentest box
	vagrant up pentest

vagrant-test-ubuntu18.04: ## Run provisioning test on Ubuntu18.04
	vagrant up test-ubuntu18.04
	vagrant destroy -f test-ubuntu18.04

setup-secrets: ## Set secret files
	$(MAKE) -C scripts/secrets/ setup-secrets
