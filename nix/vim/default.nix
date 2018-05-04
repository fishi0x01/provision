{pkgs, vim_configurable}:
{
  pkg = vim_configurable.customize { 
    name = "vim"; 
    vimrcConfig.packages.myVimPackage = with pkgs.vimPlugins; {
      start = [ "nerdtree" ];
    };
    vimrcConfig.customRC = builtins.readFile ../../.vimrc;
  };
}
