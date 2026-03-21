.PHONY: help

help: ## Prints help for targets with comments
	@grep -E '^[a-zA-Z0-9._-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install-dotfiles: ## Setup dotfile links
	./scripts/install/install-dotfiles.sh

delete-dotfiles: ## Remove dotfile links
	./scripts/delete/delete-dotfiles.sh

ansible-fedora: ## Run ansible playbook to provision localhost
	$(MAKE) -C ansible fedora

backup-home: ## Run restic backup for home machines
	restic -r $(shell pass fishi0x01/Backups/restic/home/repo-url) --verbose=2 backup \
      ~/Workspaces \
      ~/Documents \
      ~/Pictures \
      ~/Downloads \
      ~/Music \
      ~/provision \
      ~/.password-store 

restore-home: ## Run restic restore in-place for home machines. Do not overwrite if newer exists already.
	# https://restic.readthedocs.io/en/latest/050_restore.html#restoring-in-place
	restic -r $(shell pass fishi0x01/Backups/restic/home/repo-url) --verbose=2 restore latest --target / --overwrite if-newer

setup-secrets: ## Fetch keybase private repos - requires keybase installed and logged in
	mkdir -p ~/Workspaces/keybase/
	git clone keybase://private/fishi0x01/pass ~/Workspaces/keybase/pass || true
	git clone keybase://private/fishi0x01/pentest ~/Workspaces/keybase/pentest || true
	git clone keybase://private/fishi0x01/configs ~/Workspaces/keybase/configs || true
	git clone keybase://private/fishi0x01/cv ~/Workspaces/keybase/cv || true
	git clone keybase://private/fishi0x01/obsidian ~/Workspaces/keybase/obsidian || true
	ln -sfn ${HOME}/Workspaces/keybase/pass ${HOME}/.password-store
	ln -sfn ${HOME}/Workspaces/keybase/configs/ssh ${HOME}/.ssh/config

test-fedora43: ## Test fedora43 setup in a docker container
	docker build -t test-fedora43:latest -f test/Dockerfile.fedora43 .

