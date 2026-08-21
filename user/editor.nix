{ pkgs, ... }: {
  programs.neovim = {
    enable        = true;
    defaultEditor = true;

    extraLuaConfig = ''
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

      gcc
      tree-sitter
    ];
  };
}
