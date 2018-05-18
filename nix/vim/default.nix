{pkgs, vim_configurable}:
let
  customPlugins.vimux = pkgs.vimUtils.buildVimPlugin {
    name = "vimux";
    src = pkgs.fetchFromGitHub {
      owner = "benmills";
      repo = "vimux";
      rev = "37f41195e6369ac602a08ec61364906600b771f1";
      sha256 = "0k7ymak2ag67lb4sf80y4k35zj38rj0jf61bf50i6h1bgw987pra";
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
      ];}
    ];
  };
}
