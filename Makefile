TAR_NAME := $(shell date +%Y-%m-%d)_fishi-env.tar.gz

release:
	tar -C .. --exclude-vcs --exclude SHA256SUMS --exclude $(TAR_NAME) -czvf $(TAR_NAME) local-env 
	sha256sum $(TAR_NAME) > SHA256SUMS

ansible-install:
	$(MAKE) -C ansible venv

ansible-rollout:
	$(MAKE) -C ansible rollout

setup-secrets:
	$(MAKE) -C scripts setup-secrets
