with import <nixpkgs> {};
let
  /*** vim ***/
  my_vim = import ./vim/default.nix { 
    pkgs = pkgs; 
    vim_configurable = vim_configurable;
  };
in
with pkgs; rec{
  fishi = buildEnv {
    name = "fishi";
    paths = [ 
      nix-serve 
      nox
      telnet 
      python3.6
      python36Packages.pip
      python36Packages.virtualenv
      htop 
      git
      gnumake
      cmake
      tree 
      tmux
      wget
      awscli
      openjdk
      irssi
      iftop
      vscode
      idea.idea-community
      idea.idea-ultimate
      idea.goland
      idea.pycharm-professional
      nload
      go
      docker_compose
      slack
      keepassx2
      libreoffice
      gimp
      pwgen
      dbeaver
      maven
      wireshark
      spotify
      skypeforlinux
      openvpn
      dotnet-sdk
      anki
      texlive.combined.scheme-full
      dia
      valgrind
      gdb
      #calibre
      my_vim.pkg
    ]; 
  };
}
