with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "ansible-environment";
  buildInputs = [ 
    ansible_2_12
    python38Packages.pyyaml
    python38Packages.asn1crypto
    python38Packages.bcrypt
    python38Packages.cffi
    python38Packages.cryptography
    python38Packages.jinja2
    python38Packages.markupsafe
    python38Packages.paramiko
    python38Packages.pyasn1
    python38Packages.pycparser
    python38Packages.pynacl
    python38Packages.six 
  ];
}
