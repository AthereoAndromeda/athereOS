{
  description = "Athereo's Desktop Flake";

  inputs = {
    # Home-manager uses system nixpkgs (home-manager.useGlobalPackages = true)
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    zjstatus.url = "github:dj95/zjstatus";
    xremap.url = "github:xremap/nix-flake";
    base16.url = "github:SenchoPens/base16.nix";
    # Only used to Generate GTK themes. Base16 is used for theming.
    nix-colors.url = "github:misterio77/nix-colors";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tt-schemes = {
      url = "github:tinted-theming/schemes";
      flake = false;
    };

    base16-helix = {
      url = "github:tinted-theming/base16-helix";
      flake = false;
    };

    base16-zathura = {
      url = "github:haozeke/base16-zathura";
      flake = false;
    };

    base16-waybar = {
      url = "github:mnussbaum/base16-waybar";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    base16,
    nix-colors,
    zjstatus,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    lib = nixpkgs.lib;

    overlays = import ./overlays {inherit inputs;};
    my-utils = import ./my-utils {inherit lib;};

    pkgs = import nixpkgs {
      inherit system overlays;
      config.allowUnfree = true;
      config.allowUnfreePredicate = pkg: true;
    };

    pkgs-unstable = import nixpkgs-unstable {
      inherit system overlays;
      config.allowUnfree = true;
      config.allowUnfreePredicate = pkg: true;
    };

    username = "athereo";
    name = "Angelo";

    scheme = "${inputs.tt-schemes}/base16/moonlight.yaml";
    # {scheme = "${inputs.tt-schemes}/base16/rebecca.yaml";}
    # {scheme = "${inputs.tt-schemes}/base16/moonlight.yaml";}
    # {scheme = "${inputs.tt-schemes}/base16/icy.yaml";}
    # {scheme = "${inputs.tt-schemes}/base16/pasque.yaml";}
    # {scheme = "${inputs.tt-schemes}/base16/mellow-purple.yaml";}
    # {scheme = "${inputs.tt-schemes}/base16/stella.yaml";}
    # {scheme = "${inputs.tt-schemes}/base16/nebula.yaml";}
    # {scheme = "${inputs.tt-schemes}/base16/darkviolet.yaml";}
    # {scheme = "${inputs.tt-schemes}/base16/catppuccin-frappe.yaml";}
    # {scheme = "${inputs.tt-schemes}/base16/rose-pine-moon.yaml";}       # Main
    # {scheme = "${inputs.tt-schemes}/base16/tokyodark.yaml";}
    # {scheme = "${inputs.tt-schemes}/base16/tokyo-night-storm.yaml";}
    # {scheme = "${inputs.tt-schemes}/base16/uwunicorn.yaml";}
  in {
    nixosConfigurations = {
      athereo-nixos = lib.nixosSystem {
        inherit system;

        modules = [
          base16.nixosModule
          {
            inherit scheme;

            # Has to enabled before using Hyprland flake package.
            nix.settings = {
              substituters = ["https://hyprland.cachix.org"];
              trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
            };

            nixpkgs.overlays = overlays;
          }

          # Import Home manager module
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              # Use the system-level nixpkgs instead of Home Manager's
              useGlobalPkgs = true;

              # Install packages to /etc/profiles instead of ~/.nix-profile, useful when
              # using multiple profiles for one user, or using `nixos-rebuild build-vm`
              useUserPackages = true;

              users.athereo = import ./profiles/athereo/home.nix;

              extraSpecialArgs = {
                inherit pkgs-unstable inputs scheme nix-colors my-utils;
              };
            };
          }

          ./hosts/athereo-nixos/configuration.nix
        ];

        specialArgs = {
          inherit username name pkgs-unstable inputs nix-colors my-utils;
        };
      };
    };
  };
}
