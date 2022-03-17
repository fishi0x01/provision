with import <nixpkgs> {};
let
  /*** vim ***/
  my_vim = import ./vim/default.nix { 
    pkgs = pkgs; 
    ### python3 support
    vim_configurable = vim_configurable.override { python = pkgs.python3; };
  };
in
with pkgs; rec{
  fishi = buildEnv {
    name = "fishi";
    paths = [ 
      ack
      act
      ant
      asciinema
      ansible-lint
      awscli
      aws-sam-cli
      bat
      black
      chafa
      clang-tools
      cmake
      cmatrix
      cmus
      colordiff
      crunch
      dbeaver
      dia
      diesel-cli
      diskonaut
      dmg2img
      docker-compose
      dos2unix
      dosbox
      dotnet-sdk
      fd
      ffmpeg
      figlet
      gdb
      ghidra-bin
      gimp
      gitAndTools.gh
      git-crypt
      git-lfs1
      git-secrets
      gitAndTools.delta
      glibcLocales
      gnumake
      googler
      go-jira
      gotop
      graphviz
      hadolint
      hexyl
      hey
      htop 
      jetbrains.idea-community
      iftop
      imagemagick
      inkscape
      irssi
      jq
      kazam
      keepassx2
      # kicad
      # liferea
      lolcat
      lynx
      maven
      manix
      mc
      mdl
      mkvtoolnix
      most
      mplayer
      my_vim.pkg
      nix
      nix-serve 
      nload
      nms
      nodePackages.jshint
      nodePackages.jsonlint
      nox
      # openjdk
      jdk8
      p7zip
      packer
      pandoc
      pass
      peco
      potrace
      # powershell
      pwgen
      python38Packages.flake8
      python38Packages.flake8-import-order
      python38Packages.pyflakes
      python38Packages.pylint
      python38Packages.sqlmap
      rdesktop
      reptyr
      restic
      ripgrep
      rustfmt
      sampler
      scrot
      scummvm
      simplescreenrecorder
      skypeforlinux
      slack
      samba
      socat
      spotify
      spotify-tui
      sshpass
      starship
      inetutils 
      texlive.combined.scheme-full
      tflint
      thefuck
      tmux
      todo-txt-cli
      todoist
      tree 
      unrar
      vagrant
      valgrind
      vault
      vsh
      wget
      xclip
      yamllint
      yarn
      yq
    ]; 
  };
}
