{pkgs, vim_configurable}:
let
  ### Vimux
  customPlugins.vimux = pkgs.vimUtils.buildVimPlugin {
    name = "vimux";
    src = pkgs.fetchFromGitHub {
      owner = "benmills";
      repo = "vimux";
      rev = "37f41195e6369ac602a08ec61364906600b771f1";
      sha256 = "0k7ymak2ag67lb4sf80y4k35zj38rj0jf61bf50i6h1bgw987pra";
    };
  };
  ### Vim-nix
  customPlugins.vim-nix = pkgs.vimUtils.buildVimPlugin {
    name = "vim-nix";
    src = pkgs.fetchFromGitHub {
      owner = "LnL7";
      repo = "vim-nix";
      rev = "ab3c4d52d08e9e8d2a0919e38f98ba25a2b8ad18";
      sha256 = "1waan5vgba8qx3107hdrnmbnq5kr1n49q43p7m2g7wmj81v050yb";
    };
  }; 
in
{
  pkg = vim_configurable.customize { 
    name = "vim"; 
    vimrcConfig.customRC = builtins.readFile ./.vimrc;
    vimrcConfig.vam.knownPlugins = pkgs.vimPlugins // customPlugins;
    vimrcConfig.vam.pluginDictionaries = [
      { names = [
        "nerdtree"
        "youcompleteme"
        "vimux"
        "vim-nix"
        "vim-json"
        "vim-go"
      ];}
    ];
  };
}
