with import <nixpkgs> {};
let
  /*** vim ***/
  my_vim = import ./vim/default.nix { 
    pkgs = pkgs; 
    vim_configurable = vim_configurable;
  };
in
with pkgs; rec{
  fishi-mvp = buildEnv {
    name = "fishi-mvp";
    paths = [
      ack
      bat    
      fd     
      git 
      gitAndTools.delta
      gnumake
      gotop
      hexyl
      htop 
      iftop
      jq
      mc
      my_vim.pkg
      nix
      nix-serve
      nload
      pwgen
      ripgrep
      telnet 
      tmux
      tree 
      wget
      yq
    ]; 
  };
}
