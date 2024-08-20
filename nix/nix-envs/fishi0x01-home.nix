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
      ansible-lint
      bat
      clang-tools
      cmatrix
      crunch
      dbeaver-bin
      diesel-cli
      dos2unix
      dotnet-sdk
      fd
      figlet
      ghidra-bin
      gitAndTools.gh
      gitAndTools.delta
      glibcLocales
      googler
      go-jira
      gotop
      graphviz
      #hadolint
      hey
      imagemagick
      inkscape
      irssi
      kazam
      # liferea
      lynx
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
      p7zip
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
      tflint
      thefuck
      unrar
      valgrind
      vsh
      xclip
      yamllint
      yarn
      yq
    ]; 
  };
}
