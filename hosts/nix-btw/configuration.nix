{ config, lib, pkgs, ... }: {
  networking.hostName = "nix-btw";

  hardware.nvidia.prime = {
    amdgpuBusId = "PCI:74:0:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  system.stateVersion = "26.05";
}

