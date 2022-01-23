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
      filezilla
      fd
      gdb
      gobuster
      ghidra-bin
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
      mkvtoolnix
      most
      my_vim.pkg
      nix
      nix-serve 
      nload
      nmap
      nms
      nox
      p7zip
      peco
      potrace
      powershell
      proxychains
      pwgen
      python38Packages.sqlmap
      rdesktop
      reptyr
      ripgrep
      rlwrap
      scrot
      smbclient
      ssh-ident
      sshpass
      sqsh
      tmux
      tree 
      unrar
      valgrind
      wget
      yq
    ]; 
  };
}
