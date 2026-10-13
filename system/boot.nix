{ ... }: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  zramSwap.enable = true;

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";

  boot.kernelParams = [
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1" # dGPU power config
  ];

  # Alternative keyboard
  console.keyMap = "us";
}
