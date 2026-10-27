{ ... }: {
  programs.kitty = {
    enable = true;

    font = {
      name = "Noto Sans Mono";
      size = 12;
    };

    settings = {
      window_padding_width = 8;
      confirm_os_window_close = 0;
    };

    keybindings = {
      "ctrl+shift+t" = "new_tab_with_cwd";
      "ctrl+shift+n" = "new_os_window_with_cwd";
    };
  };
}
