with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "ansible-environment";
  buildInputs = [ 
    ansible
    python39Packages.pyyaml
    python39Packages.asn1crypto
    python39Packages.bcrypt
    python39Packages.cffi
    python39Packages.cryptography
    python39Packages.jinja2
    python39Packages.markupsafe
    python39Packages.paramiko
    python39Packages.pyasn1
    python39Packages.pycparser
    python39Packages.pynacl
    python39Packages.six 
  ];
}
