#!/bin/bash
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
