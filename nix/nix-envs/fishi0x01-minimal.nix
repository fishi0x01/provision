with import <nixpkgs> {};
let in
with pkgs; rec{
  fishi-mvp = buildEnv {
    name = "fishi-mvp";
    paths = [
      ack
      bat    
      fd     
      gitAndTools.delta
      gnumake
      gotop
      hexyl
      htop 
      iftop
      jq
      mc
      nix
      nix-serve
      nload
      pwgen
      ripgrep
      inetutils
      tmux
      tree 
      wget
      yq
    ]; 
  };
}
