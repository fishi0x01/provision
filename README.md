# dotfiles
### Install

Prerequisites: 
* `curl`
* `tar` 

```
curl -sL https://github.com/fishi0x01/dotfiles/archive/master.tar.gz | tar -xz && mv ./dotfiles-master ./dotfiles && cd ./dotfiles && ./install.sh && cd .. && rm -r ./dotfiles && git clone https://github.com/fishi0x01/dotfiles.git
```

**NOTE**: Don't change the cloned path after installation as the dotfiles are linking to this location. If the path changes then `install.sh` must be run again in order for the links to be updated.

### Delete
```
./delete.sh
```

### Necessary Space
```
$ du -sch /nix/
2,3G    /nix/
2,3G    total
```
