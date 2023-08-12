.PHONY: help fedora vm-fedora test-fedora 

help: ## Print this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

fedora: ## Provision localhost of fedora workstation
	nix-shell --run "ansible-playbook playbooks/fedora.yaml --extra-vars 'machine_user=${USER}' --ask-become-pass -e ansible_python_interpreter=/usr/bin/python;"

vm-fedora: ## Provision fedora inside a VM
	nix-shell --run "ansible-playbook playbooks/fedora.yaml --extra-vars 'machine_user=${USER}' --skip-tags 'not-in-vm' -e ansible_python_interpreter=/usr/bin/python;"

test-fedora: ## Test provisioning of fedora workstation - intended to run inside container with passwordless sudo
	nix-shell --run "ansible-playbook playbooks/fedora.yaml --extra-vars 'machine_user=${USER}' --skip-tags 'no-test-in-container'"
