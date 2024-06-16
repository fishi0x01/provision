with import <nixpkgs> {};
let
  /*** vim ***/
  my_vim = import ./vim/default.nix { 
    pkgs = pkgs; 
    ### python3 support
    # vim_configurable = vim_configurable.override { python = pkgs.python3; };
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
      asciinema
      ansible-lint
      # awscli
      # aws-sam-cli
      bat
      black
      chafa
      clang-tools
      cmake
      cmatrix
      cmus
      colordiff
      crunch
      dbeaver-bin
      dia
      diesel-cli
      diskonaut
      dmg2img
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
      git-lfs
      git-secrets
      gitAndTools.delta
      glibcLocales
      grpcurl
      gnumake
      googler
      go-jira
      gotop
      graphviz
      #hadolint
      hexyl
      hey
      htop 
      #jetbrains.idea-community
      iftop
      imagemagick
      inkscape
      irssi
      jq
      kazam
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
      peco
      potrace
      # powershell
      pwgen
      python3Packages.flake8
      # python3Packages.flake8-import-order
      python3Packages.pyflakes
      # python3Packages.pylint
      python3Packages.sqlmap
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
      sshpass
      starship
      inetutils 
      texlive.combined.scheme-full
      tflint
      thefuck
      tmux
      tig
      todo-txt-cli
      todoist
      tree 
      unrar
      vagrant
      valgrind
      #vault
      vsh
      wget
      xclip
      yamllint
      yarn
      yq
    ]; 
  };
}
