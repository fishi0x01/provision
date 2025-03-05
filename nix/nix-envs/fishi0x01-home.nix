with import <nixpkgs> {};
let in
with pkgs; rec{
  fishi = buildEnv {
    name = "fishi";
    paths = [ 
      act
      ansible-lint
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
      go-jira
      gotop
      hey
      imagemagick
      # liferea
      manix
      mdl
      mkvtoolnix
      mplayer
      nix
      nix-serve 
      nms
      nox
      p7zip
      peco
      # powershell
      python3Packages.sqlmap
      rdesktop
      reptyr
      restic
      rustfmt
      sampler
      scrot
      scummvm
      simplescreenrecorder
      slack
      samba
      spotify
      inetutils 
      tflint
      thefuck
      vsh
      xclip
      yamllint
      yarn
    ]; 
  };
}
