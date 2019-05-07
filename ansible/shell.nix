with import <nixpkgs> {};

(python37.withPackages (ps: with ps; [
  ansible
  pyyaml
  asn1crypto
  bcrypt
  cffi
  cryptography
  jinja2
  markupsafe
  paramiko
  pyasn1
  pycparser
  pynacl
  six
])).env

