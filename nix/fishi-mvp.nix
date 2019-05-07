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
      nix
      nix-serve
      nox
      telnet 
      htop 
      bat
      fd
      gotop
      hexyl
      git
      gnumake
      tree 
      tmux
      wget
      iftop
      nload
      pwgen
      openvpn
      my_vim.pkg
    ]; 
  };
}
