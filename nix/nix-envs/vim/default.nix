{pkgs, vim_configurable}:
let
  ### vim-virtualenv
  customPlugins.vim-virtualenv = pkgs.vimUtils.buildVimPlugin {
    name = "vim-virtualenv";
    src = pkgs.fetchFromGitHub {
      owner = "jmcantrell";
      repo = "vim-virtualenv";
      rev = "e7bb5b1960603decf2975f052db672850c5a7de4";
      sha256 = "0fy3w6kmmvhqk54f428rvydw3cs13iv8dalk30mazfjzbnq4ckfq";
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
        "ansible-vim"
        "nerdtree"
        "kotlin-vim"
        "ctrlp-vim"
        "YouCompleteMe"
        "fugitive"
        "rust-vim"
        "syntastic"
        "vimux"
        "vim-clang-format"
        "vim-nix"
        "vim-json"
        "vim-jinja"
        "vim-jsx-pretty"
        "vim-toml"
      ];}
    ];
  };
}
