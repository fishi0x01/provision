#!/bin/bash

## sudo should see our aliases
alias sudo='sudo '

## convenience
alias md='mkdir -p'
alias asciicast2gif='docker run --rm -v $PWD:/data -e NODE_OPTS="--max-old-space-size=1024" asciinema/asciicast2gif'

zzBackup() {
  if [ $# -lt 2 ]; then
    echo "First argument: Backup .zip path, Second argument: comma separated paths for backup"
  else
    zip -ur ${1} $(echo "$2" | sed -e 's/,/\ /g') -x '*/.nix-profile/*'
  fi
}

alias 'fishi-backup'='zzBackup'

# TODO: clean this mess up - looks awefull o.O

# Recursively apply replace pattern on all files in directory given directory
# and its subdirectories
zzReplaceInDirRecursive() {
  find $1 -type f -print0 | xargs -0 sed -i "s/${2//\//\\/}/${3//\//\\/}/g"
}

# Replace in file
zzReplaceInFile() {
  sed -i "s/${2//\//\\/}/${3//\//\\/}/g" $1
}

alias replaceRecursiveIn=zzReplaceInDirRecursive
alias replaceIn=zzReplaceInFile


#######################################

zzGenerateSshKey() {
  ssh-keygen -t rsa -b 4096 -C "$1" -f "./$1"
}
alias genSshKey=zzGenerateSshKey

#######################################

#zzGitRestore() {
#  file=$1 git checkout $(git rev-list -n 1 HEAD -- "$file")^ -- "$file"
#}
#
#alias gitRestore=zzGitRestore



############

zzServeDir() {
  python -m SimpleHTTPServer
}
alias serveDir=zzServeDir

zzNixSudo() {
  sudo env "PATH=$PATH" $@
}
alias nisu=zzNixSudo


zzDockerSystemPrune() {
  docker system prune -f
}
alias dcp=zzDockerSystemPrune

zzUntarGzToDir() {
  mkdir -p $2
  tar -xzf $1 -C $2
}
alias untarGzToDir=zzUntarGzToDir

zzDownloadFileTo() {
  curl -L $1 --output $2
}
alias downloadFileTo=zzDownloadFileTo

zzConfgiureGitRepo() {
  if [ $# -lt 2 ]; then
    echo "First argument: Email, Second argument: gpg key ID"
  fi
  git config user.name "Karl Fischer"
  git config user.email "${1}"
  git config user.signingkey "${2}"
  git config commit.gpgsign true
}
alias gitConfig=zzConfgiureGitRepo

zzKeybaseLocalGgpImport() {
  if [ $# -lt 1 ]; then
    echo "Need KeyID"
  fi

  keybase pgp export -q ${1} -s | gpg --import
}
alias keybaseLocalGpgImport=zzKeybaseLocalGgpImport

zzCopyFileToClipboard() {
  cat ${1} | xclip -i -selection clipboard
}
alias cpFileContent=zzCopyFileToClipboard

zzJiraEnv() {
  export JIRA_API_TOKEN=$(pass show fishi0x01/data4life/Jira/api-token 2>/dev/null)
}
alias jiraEnv=zzJiraEnv

zzPassPush() {
  pass git push -u --all
}
alias passPush=zzPassPush

zzLocalSampler() {
  sampler --config ~/.fishi-sampler-local.yaml
}
alias sampler-local=zzLocalSampler

zzSwitchYubikey() {
  KEYID=E96231C3
  GPG=gpg
  GPGCONF=gpgconf
  GNUPGHOME=${GNUPGHOME-`$GPGCONF --list-dirs homedir`}
  KEYGRIP_AWK_EXTRACT='BEGIN { is_ssb_sc=0 ; } is_ssb_sc==1 && $1~/Keygrip/ && $2~/=/ { print $3; is_ssb_sc=0; } { if ( $1=="ssb>" ) { is_ssb_sc=1; } else { is_ssb_sc=0; } }'
  KEYGRIPS="`${GPG} --with-keygrip --list-secret-keys "${KEYID}" | awk "${KEYGRIP_AWK_EXTRACT}"`"
  
  for keygrip in ${KEYGRIPS}
  do {
  	keygrip_file="${GNUPGHOME}/private-keys-v1.d/${keygrip}.key"
  	rm "${keygrip_file}"
  }
  done
  
  ${GPG} --card-status
}
alias switchYubikey=zzSwitchYubikey

zzGpgRemoveLocks() {
    # https://luke.carrier.im/notes/p8x4128bt98vk5zcnqkwaa1/
    find ~/.gnupg -name '*.lock' -delete
}
alias gpgRemoveLocks=zzGpgRemoveLocks

########
# Docker
########
alias postfiledumphere='docker run --rm -it -p80:3000 -v "${PWD}:/data" rflathers/postfiledump'
