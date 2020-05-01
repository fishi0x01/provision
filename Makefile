.PHONY: help

help: ## Prints help for targets with comments
	@grep -E '^[a-zA-Z0-9._-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

nix-env: ## Run nix-env setup
	./nix/installer/install-env.sh

ansible-provision: ## Run ansible playbook to provision localhost
	$(MAKE) -C ansible provision

setup-secrets: ## Set secret files
	$(MAKE) -C scripts setup-secrets
