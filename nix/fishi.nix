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
      most
      python3.7
      liferea
      pandoc
      htop 
      git
      bat
      graphviz
      fd
      yq
      mc
      hexyl
      gotop
      ripgrep
      sampler
      gnumake
      cmake
      tree 
      tmux
      wget
      go-jira
      restic
      awscli
      irssi
      jq
      lynx
      scrot
      ssh-ident
      iftop
      vscode
      idea.idea-community
      nload
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
      dos2unix
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
      ffmpeg
      imagemagick
      mkvtoolnix
      unrar
      my_vim.pkg
    ]; 
  };
}
