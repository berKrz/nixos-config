{ ... }: {
  programs.mangohud = {
    settings = {
        toggle_hud = "Shift_R+F12";
        toggle_hud_position = "Shift_R+F11";

        fps = true;
        frametime = true;
        frame_timing = 1;

        gpu_status = true;
        gpu_temp = true;
        vram = true;

        cpu_stats = true;
        cpu_temp = true;

        ram = true;
      };
  };
}
