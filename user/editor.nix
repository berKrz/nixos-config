{ pkgs, ... }: {
  programs.neovim = {
    enable        = true;
    defaultEditor = true;

    initLua = ''
      require("config.lazy")
    '';

    extraPackages = with pkgs; [
      # LSPs
      nixd
      lua-language-server
      marksman
      taplo

      # Formatters
      nixfmt
      stylua

      # LazyVim necessary dep
      gcc
      tree-sitter
    ];
  };
}
