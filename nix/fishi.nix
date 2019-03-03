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
      nix
      nix-serve 
      nox
      pass
      telnet 
      nmap
      python3.7
      pandoc
      htop 
      git
      gnumake
      cmake
      tree 
      tmux
      wget
      awscli
      irssi
      lynx
      scrot
      #chromium
      ssh-ident
      iftop
      vscode
      idea.idea-community
      #idea.idea-ultimate
      #idea.goland
      #idea.pycharm-professional
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
      spotify
      openjdk
      skypeforlinux
      dotnet-sdk
      #anki
      texlive.combined.scheme-full
      irssi
      dia
      valgrind
      gdb
      ant
      xclip
      powershell
      scummvm
      p7zip
      cmus
      ruby
      thunderbird
      simplescreenrecorder
      libsForQt511.vlc
      #wine
      #winetricks
      ffmpeg
      imagemagick
      mkvtoolnix
      unrar
      #calibre
      my_vim.pkg
    ]; 
  };
}
