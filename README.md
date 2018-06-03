# local-env
### Install

Prerequisites: 
* `curl`
* `tar` 

```
curl -sL https://github.com/fishi0x01/local-env/archive/master.tar.gz | tar -xz && mv ./local-env-master ./local-env && cd ./local-env && ./install.sh && cd .. && rm -r ./local-env && git clone https://github.com/fishi0x01/local-env.git
```

**NOTE**: Don't change the cloned path after installation as the dotfiles are linking to this location. If the path changes then `install.sh` must be run again in order for the links to be updated.

### Delete
```
./delete.sh
```

### Necessary Space
```
$ du -sch /nix/
4,7G    /nix/
4,7G    total
```
