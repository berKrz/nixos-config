{ config, lib, pkgs, ... }:

{
  networking.hostName = "nix-btw";

  environment.systemPackages = with pkgs; [
	vim
	git
 ];

  system.stateVersion = "26.05";

}

