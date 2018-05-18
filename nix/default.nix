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
      nix-repl 
      nix-serve 
      telnet 
      htop 
      git
      tree 
      tmux
      wget
      my_vim.pkg
    ]; 
  };
}
