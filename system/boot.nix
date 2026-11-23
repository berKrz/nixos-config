{ ... }: {
  boot.loader.systemd-boot.enable = true;
  # Cap boot menu entries (and kernels/initrds kept on the 512M ESP)
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  zramSwap.enable = true;

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";

  # Alternative keyboard
  console.keyMap = "us";
}
