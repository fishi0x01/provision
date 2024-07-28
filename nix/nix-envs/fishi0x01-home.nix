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
      act
      ant
      ansible-lint
      bat
      black
      chafa
      clang-tools
      cmatrix
      cmus
      # colordiff
      crunch
      dbeaver-bin
      dia
      diesel-cli
      dmg2img
      dos2unix
      dosbox
      dotnet-sdk
      fd
      #ffmpeg
      figlet
      ghidra-bin
      gitAndTools.gh
      gitAndTools.delta
      glibcLocales
      grpcurl
      googler
      go-jira
      gotop
      graphviz
      #hadolint
      hexyl
      hey
      #jetbrains.idea-community
      imagemagick
      inkscape
      irssi
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
      tig
      todo-txt-cli
      todoist
      unrar
      vagrant
      valgrind
      vsh
      xclip
      yamllint
      yarn
      yq
    ]; 
  };
}
