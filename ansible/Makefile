venv:
	./nix-venv-install.sh

rollout:
	( \
		. ansible-venv/bin/activate; \
		ansible-playbook fishi.yaml --ask-sudo-pass -e ansible_python_interpreter=/usr/bin/python; \
	)
