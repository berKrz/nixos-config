{
  description = "NixOS Configuration";

  # Noctalia v5 binary cache
  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWp0xNFQsBRglJzxWPp3dkU4=" ];
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

    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helium.url = "github:schembriaiden/helium-browser-nix-flake";

  };

  outputs = { self, nixpkgs, home-manager, disko, ... }@inputs:
    let
      system = "x86_64-linux";
      hostname = "nix-btw";
      username = "berkrz";

      nixosSystem = nixpkgs.lib.nixosSystem {
        inherit system;

        # Makes inputs available in every module
        specialArgs = { inherit inputs; };
        modules = [
          disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          inputs.mangowm.nixosModules.mango
          inputs.noctalia-greeter.nixosModules.default
	  ./hosts/${hostname}
	  ./system
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              # Makes inputs available in every HM module
              extraSpecialArgs = { inherit inputs; };
              backupFileExtension = "backup";
	      users.${username} = import ./user;
	    };
	  }
        ];
      };
    in {
      nixosConfigurations.${hostname} = nixosSystem;
    };
}
