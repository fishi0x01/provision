# local-env
### Install

Prerequisites: 
* `curl`
* `tar` 

```
curl https://raw.githubusercontent.com/fishi0x01/local-env/master/fetch-and-install.sh | sh
```

By default the profile `fishi` gets installed, which contains all packages. 
Change the desired profile via env var `NIX_PROFILE`, like:
```
NIX_PROFILE=fishi-mvp curl https://raw.githubusercontent.com/fishi0x01/local-env/master/fetch-and-install.sh | sh
```

**NOTE**: Don't change the cloned path after installation as the dotfiles are linking to this location. If the path changes then `install.sh` must be run again in order for the links to be updated.

### Delete
```
./delete.sh
```

### Release

Use `make` in order to create a tar ball with checksums (can be uploaded to github then):

```
make release
```
