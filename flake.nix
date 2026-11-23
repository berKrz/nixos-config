{
  description = "NixOS Configuration";

  # Noctalia v5 binary cache
  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # No inputs.nixpkgs.follows so binary cache doesn't break
    noctalia.url = "github:noctalia-dev/noctalia";

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Prebuilt release binary patched against nixpkgs libs; no cache to break
    helium = {
      url = "github:schembriaiden/helium-browser-nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      nixpkgs,
      home-manager,
      disko,
      ...
    }@inputs:
    let
      hostname = "nix-btw";
      username = "berkrz";
      configDir = "/home/${username}/nixos-config";

      nixosSystem = nixpkgs.lib.nixosSystem {
        # Makes inputs available in every module
        specialArgs = { inherit inputs username configDir; };
        modules = [
          disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          inputs.noctalia-greeter.nixosModules.default
          ./hosts/${hostname}
          ./system
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              # Makes inputs available in every HM module
              extraSpecialArgs = { inherit inputs username configDir; };
              backupFileExtension = "backup";
              users.${username} = import ./user;
            };
          }
        ];
      };
    in
    {
      nixosConfigurations.${hostname} = nixosSystem;
    };
}
