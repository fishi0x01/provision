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
      act
      ant
      awscli
      bat
      cadaver
      cmake
      cmus
      crunch
      dbeaver
      docker_compose
      dos2unix
      dotnet-sdk
      enum4linux
      fd
      gdb
      ghidra-bin
      git
      glibcLocales
      gnumake
      gotop
      graphviz
      hexyl
      hey
      htop 
      iftop
      irssi
      john
      jq
      liferea
      lynx
      maven
      mc
      metasploit
      mkvtoolnix
      most
      my_vim.pkg
      nix
      nix-serve 
      nload
      nmap
      nox
      openjdk
      openvpn
      p7zip
      potrace
      powershell
      proxychains
      pwgen
      python27Packages.virtualenv
      python3.7
      python38Packages.sqlmap
      rdesktop
      reptyr
      ripgrep
      rlwrap
      sampler
      scrot
      smbclient
      socat
      ssh-ident
      sshpass
      telnet 
      thc-hydra
      tmux
      tree 
      unrar
      valgrind
      wget
      yq
    ]; 
  };
}
