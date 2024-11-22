{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc 
    rust-analyzer
    ripgrep
    fd
    tree-sitter
    python312Packages.tree-sitter
    python312Packages.pynvim
  ];
  home.file.".config/nvim" = {
    force = true;
    source = ./neovim;
    recursive = false;
  };
}
