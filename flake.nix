{
	description = "Root of NixOS system configuration. Contains all flakes.";

	inputs = {
    # Module that handles disk partitioning.
    disko = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/disko";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Desktop environment.
    hyprland.url = "github:hyprwm/Hyprland";
    # Primary source of package(s).
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    # Handles Flatpaks.
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    # Includes common hardware stuff (like Framework laptop stuff).
    # Note: The latest version of this repo is broken.
    nixos-hardware.url = "github:NixOS/nixos-hardware/a8dd1b21995964b115b1e3ec639dd6ce24ab9806";
    # Secret management.
    sops-nix.url = "github:Mic92/sops-nix/799b572ef1ce4c6ed8efa806b9b542ae8d9cfe6e";
    # Here in case something is needed from unstable that's not in `nixpkgs`.
		unstable.url = "github:nixos/nixpkgs/nixos-unstable";
#    unstable.url = "github:ReedClanton/nixpkgs/master";
	};

	outputs = inputs@{ self, home-manager, nix-flatpak, nixpkgs, nixos-hardware, sops-nix, unstable, ... }:
	let
		# Variable(s) used in flake(s).
		system = "x86_64-linux";
		user = import ./data/users/reedclanton.nix;

		# Packages setup.
		pkgs = import nixpkgs {
			inherit system;
			config.allowUnfree = true;
		};
    pkgs-unstable = import unstable {
      inherit system;
      config.allowUnfree = true;
    };

		# This function is used to construct NixOS flakes for each host.
		mkComputer = host: ui: extraModules: extraHomeModules:
		let
			# Host name is derived from name of host and name of UI as well as type of system (nixos in our case).
			hostName = inputs.nixpkgs.lib.strings.concatStringsSep "-" [ "nixos" host ui ];
		in inputs.nixpkgs.lib.nixosSystem {
			inherit system;
			# Allow NixOS to access flake data.
			specialArgs = { inherit host hostName inputs nixos-hardware pkgs pkgs-unstable system ui user; };
			modules = [
				## External Module(s) ##
				home-manager.nixosModules.home-manager
				sops-nix.nixosModules.sops
				
				## Configuration ##
				# Host specific configuration (path derived from provided name of host).
				./hosts/${host}
				# User's NixOS Configuration.
				./users/${user.name}
				# Home Manager Setup
				{
					home-manager = {
						# Allow Home Manager to access flake data.
						extraSpecialArgs = { inherit host hostName inputs pkgs pkgs-unstable system ui user; };
						useGlobalPkgs = true;
						useUserPackages = true;
						users."${user.name}".imports = [
							## External Module(s) ##
							sops-nix.homeManagerModules.sops
							## Configuration ##
							# This shale be the only entry to the Home Manager configuration.
							(if builtins.pathExists ./users/${user.name}/home/default.nix then ./users/${user.name}/home else ./do-nothing.nix)
						] ++ extraHomeModules;
					};
				}
			] ++ extraModules;
		};
	in {
		nixosConfigurations = {
			nixos-desktop-gnome = mkComputer
				# Name of host and UI.
				"desktop"
				"gnome"
				# Additional module(s).
				[
					## Module(s) ##
					nix-flatpak.nixosModules.nix-flatpak
					## Configuration ##
					./modules/nixos/gui/gnome
				]
				# Additional Home Manager module(s).
				[
					## Module(s) ##
					nix-flatpak.homeManagerModules.nix-flatpak
				];
			nixos-desktop-hyprland = mkComputer
				# Name of host and UI.
				"desktop"
				"hyprland"
				# Additional module(s).
				[
					## Module(s) ##
					nix-flatpak.nixosModules.nix-flatpak
					## Configuration ##
					./modules/nixos/gui/hyprland
				]
				# Additional Home Manager module(s).
				[
					## Module(s) ##
					nix-flatpak.homeManagerModules.nix-flatpak
				];
			nixos-desktop-kde = mkComputer
				# Name of host and UI.
				"desktop"
				"kde"
				# Additional module(s).
				[
					## Module(s) ##
					nix-flatpak.nixosModules.nix-flatpak
					## Configuration ##
					./modules/nixos/gui/kde
				]
				# Additional Home Manager module(s).
				[
					## Module(s) ##
					nix-flatpak.homeManagerModules.nix-flatpak
				];
			nixos-desktop-tty = mkComputer
				# Name of host and UI.
				"desktop"
				"tty"
				# Additional module(s).
				[ ]
				# Additional Home Manager module(s).
				[ ];
      nixos-desktop-xfce = mkComputer
        # Name of host and UI.
        "desktop"
        "xfce"
        # Additional module(s).
        [
          ## Module(s) ##
          nix-flatpak.nixosModules.nix-flatpak
          ## Configuration ##
          ./modules/nixos/gui/xfce
        ]
        # Additional Home Manager module(s).
        [
          ## Module(s) ##
          nix-flatpak.homeManagerModules.nix-flatpak
        ];
			nixos-framework13-gnome = mkComputer
				# Name of host and UI.
				"framework13"
				"gnome"
				# Additional module(s).
				[
					## Module(s) ##
					nixos-hardware.nixosModules.framework-11th-gen-intel
					nix-flatpak.nixosModules.nix-flatpak
					## Configuration ##
					./modules/nixos/gui/gnome
				]
				# Additional Home Manager module(s).
				[
					## Module(s) ##
					nix-flatpak.homeManagerModules.nix-flatpak
				];
			nixos-framework13-hyprland = mkComputer
				# Name of host and UI.
				"framework13"
				"hyprland"
				# Additional module(s).
				[
					## Module(s) ##
					nixos-hardware.nixosModules.framework-11th-gen-intel
					nix-flatpak.nixosModules.nix-flatpak
					## Configuration ##
					./modules/nixos/gui/hyprland
				]
				# Additional Home Manager module(s).
				[
					## Module(s) ##
					nix-flatpak.homeManagerModules.nix-flatpak
				];
			nixos-framework13-kde = mkComputer
				# Name of host and UI.
				"framework13"
				"kde"
				# Additional module(s).
				[
					## Module(s) ##
					nixos-hardware.nixosModules.framework-11th-gen-intel
					nix-flatpak.nixosModules.nix-flatpak
					## Configuration ##
					./modules/nixos/gui/kde
				]
				# Additional Home Manager module(s).
				[
					## Module(s) ##
					nix-flatpak.homeManagerModules.nix-flatpak
				];
			nixos-framework13-tty = mkComputer
				# Name of host and UI.
				"framework13"
				"tty"
				# Additional module(s).
				[
					## Module(s) ##
					nixos-hardware.nixosModules.framework-11th-gen-intel
				]
				# Additional Home Manager module(s).
				[ ];
      nixos-framework13-xfce = mkComputer
        # Name of host and UI.
        "framework13"
        "xfce"
        # Additional module(s).
        [
          ## Module(s) ##
          nixos-hardware.nixosModules.framework-11th-gen-intel
          nix-flatpak.nixosModules.nix-flatpak
          ## Configuration ##
          ./modules/nixos/gui/xfce
        ]
        # Additional Home Manager module(s).
        [
          ## Module(s) ##
          nix-flatpak.homeManagerModules.nix-flatpak
        ];
			nixos-vm-gnome = mkComputer
				# Name of host and UI.
				"vm"
				"gnome"
				# Additional module(s).
				[
					## Module(s) ##
					nix-flatpak.nixosModules.nix-flatpak
					## Configuration ##
					./modules/nixos/gui/gnome
				]
				# Additional Home Manager module(s).
				[
					## Module(s) ##
					nix-flatpak.homeManagerModules.nix-flatpak
				];
			nixos-vm-hyprland = mkComputer
				# Name of host and UI.
				"vm"
				"hyprland"
				# Additional module(s).
				[
					## Module(s) ##
					nix-flatpak.nixosModules.nix-flatpak
					## Configuration ##
					./modules/nixos/gui/hyprland
				]
				# Additional Home Manager module(s).
				[
					## Module(s) ##
					nix-flatpak.homeManagerModules.nix-flatpak
				];
			nixos-vm-kde = mkComputer
				# Name of host and UI.
				"vm"
				"kde"
				# Additional module(s).
				[
					## Module(s) ##
					nix-flatpak.nixosModules.nix-flatpak
					## Configuration ##
					./modules/nixos/gui/kde
				]
				# Additional Home Manager module(s).
				[
					## Module(s) ##
					nix-flatpak.homeManagerModules.nix-flatpak
				];
			nixos-vm-tty = mkComputer
				# Name of host and UI.
				"vm"
				"tty"
				# Additional module(s).
				[ ]
				# Additional Home Manager module(s).
				[ ];
      nixos-vm-xfce = mkComputer
        # Name of host and UI.
        "vm"
        "xfce"
        # Additional module(s).
        [
          ## Module(s) ##
          nix-flatpak.nixosModules.nix-flatpak
          ## Configuration ##
          ./modules/nixos/gui/xfce
        ]
        # Additional Home Manager module(s).
        [
          ## Module(s) ##
          nix-flatpak.homeManagerModules.nix-flatpak
        ];
		};
	};
}

