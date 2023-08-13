# provision

Prerequisites:

* `curl`
* `tar`

**Unsafe and fast install:**

```
curl https://raw.githubusercontent.com/fishi0x01/provision/master/fetch-and-install.sh | sh
```

Adjust .bashrc to properly source `.bash_*` files.

## Delete

```
./scripts/delete/delete-nix.sh
./scripts/delete/delete-dotfiles.sh
```

## Secrets

Setup pass and run

```
./scripts/secrets/setup-secrets.sh
```

## Ansible

Nix single-user install has limitations. Some stuff should happen through system packages.

```
make ansible-provision
```
