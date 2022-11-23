{ pkgs, vim_configurable }:
{
  pkg = vim_configurable.customize { 
    name = "vim";
    vimrcConfig.customRC = builtins.readFile ./.vimrc;
    vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
      start = [
        ansible-vim
        nerdtree
        kotlin-vim
        ctrlp-vim
        YouCompleteMe
        rust-vim
        syntastic
        vimux
        vim-fugitive
        vim-clang-format
        vim-nix
        vim-json
        vim-jinja
        vim-jsx-pretty
        vim-toml
        vim-vagrant
      ];
      opt = [];
    };
  };
}

