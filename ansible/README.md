# Ansible Provisioning

## Requirements

- nix-shell

## Environments

### Local Workstation

```sh
make workstation
```

### OpenHAB2 Pi

Place inventory file `openhab-pi.ini` at `inventories/openhab-pi.ini`.

```sh
make openhab-pi
```

```sh
make openhab-pi-backup
```
