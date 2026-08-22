{ ... }: {
  programs.kitty = {
    enable = true;
		
    font = {
      name = "Noto Sans Mono";
      size = 12;
    };

    settings = {
      window_padding_width = 8;
      confirm_on_quit = "never";
      confirm_on_window_close = 0;
    };
  };
}
