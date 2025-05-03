.PHONY: help fedora vm-fedora test-fedora 

VENV := venv/bin/activate

help: ## Print this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

venv:
	python3 -m venv venv
	. $(VENV) && pip install --upgrade pip
	. $(VENV) && pip install -r requirements.txt

fedora: venv ## Provision localhost of fedora workstation
	. $(VENV) && ansible-playbook playbooks/fedora.yaml --extra-vars 'machine_user=${USER}' --ask-become-pass

vm-fedora: venv ## Provision fedora inside a VM
	. $(VENV) && ansible-playbook playbooks/fedora.yaml --extra-vars 'machine_user=${USER}' --skip-tags 'not-in-vm'

test-fedora: venv ## Test provisioning of fedora workstation - intended to run inside container with passwordless sudo
	. $(VENV) && ansible-playbook playbooks/fedora.yaml --extra-vars 'machine_user=${USER}' --skip-tags 'no-test-in-container'

backup: venv ## Create zip archive of important workstation dirs
	. $(VENV) && ansible-playbook playbooks/backup.yaml --extra-vars 'machine_user=${USER}' --ask-become-pass

