.PHONY: help openhab-pi openhab-pi-backup

help: ## Print this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

workstation: ## Provision localhost
	nix-shell --run "ansible-playbook playbooks/workstations/fishi0x01.yaml --extra-vars 'machine_user=${USER}' --ask-become-pass -e ansible_python_interpreter=/usr/bin/python;"

test-workstation: ## Test provisioning localhost
	nix-shell --run "ansible-playbook playbooks/workstations/fishi0x01.yaml --extra-vars 'machine_user=${USER}' -e ansible_python_interpreter=/usr/bin/python;"

openhab-pi: ## Provision OpenHAB2 Pi
	nix-shell --run "ansible-playbook playbooks/openhab-pi/openhab-pi.yaml -i inventories/openhab-pi.ini"

openhab-pi-backup: ## Create a backup file of OpenHAB2 Pi
	nix-shell --run "ansible-playbook playbooks/openhab-pi/openhab-pi-backup.yaml -i inventories/openhab-pi.ini"
