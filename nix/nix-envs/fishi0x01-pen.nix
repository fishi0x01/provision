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
      ack
      act
      ant
      awscli
      bat
      burpsuite
      cadaver
      cmake
      cmatrix
      cmus
      colordiff
      crunch
      dbeaver
      dos2unix
      dotnet-sdk
      enum4linux
      fd
      gdb
      ghidra-bin
      git
      gitAndTools.delta
      glibcLocales
      gnumake
      googler
      gotop
      hexyl
      hey
      htop 
      iftop
      irssi
      john
      jq
      liferea
      mc
      metasploit
      mkvtoolnix
      most
      my_vim.pkg
      nix
      nix-serve 
      nload
      nmap
      nms
      nox
      openvpn
      p7zip
      peco
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
      scrot
      smbclient
      socat
      ssh-ident
      sshpass
      sqsh
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
