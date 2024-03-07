{
	description = "Root of NixOS system configuration. Contains all flakes.";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
		unstable.url = "github:nixos/nixpkgs/nixos-unstable";
#    unstable.url = "github:ReedClanton/nixpkgs/master";
		# Includes common hardware stuff (like Framework laptop stuff).
		nixos-hardware.url = "github:NixOS/nixos-hardware/master";
		home-manager = {
			url = "github:nix-community/home-manager/release-23.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		hyprland.url = "github:hyprwm/Hyprland";
		# Secret management.
		sops-nix.url = "github:Mic92/sops-nix";
		# Handles Flatpaks.
		nix-flatpak.url = "github:gmodena/nix-flatpak";
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
			specialArgs = { inherit hostName inputs nixos-hardware pkgs pkgs-unstable system ui user; };
			modules = [
				## External Module(s) ##
				home-manager.nixosModules.home-manager
				sops-nix.nixosModules.sops
				
				## Configuration ##
				# Host specific configuration (path derived from provided name of host).
				./hosts/${host}
				# User's NixOS Configruration.
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
							# Basic Home Manager setup.
							(if builtins.pathExists ./users/${user.name}/home then ./users/${user.name}/home else ./do-nothing.nix)
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
					./modules/gui/gnome
					(if builtins.pathExists ./users/${user.name}/modules/flatpak then ./users/${user.name}/modules/flatpak else ./do-nothing.nix)
				]
				# Additional Home Manager module(s).
				[
					## Module(s) ##
					nix-flatpak.homeManagerModules.nix-flatpak
					## Configuration ##
          # NoOp
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
					./modules/gui/hyprland
					(if builtins.pathExists .users/${user.name}/modules/flatpak then ./users/${user.name}/modules/flatpak else ./do-nothing.nix)
				]
				# Additional Home Manager module(s).
				[
					## Module(s) ##
					nix-flatpak.homeManagerModules.nix-flatpak
					## Configuration ##
          # NoOp
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
					./modules/gui/kde
					(if builtins.pathExists ./users/${user.name}/modules/flatpak then ./users/${user.name}/modules/flatpak else ./do-nothing.nix)
				]
				# Additional Home Manager module(s).
				[
					## Module(s) ##
					nix-flatpak.homeManagerModules.nix-flatpak
					## Configuration ##
          # NoOp
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
          ./modules/gui/xfce
          (if builtins.pathExists ./users/${user.name}/modules/flatpak then ./users/${user.name}/modules/flatpak else ./do-nothing.nix)
        ]
        # Additional Home Manager module(s).
        [
          ## Module(s) ##
          nix-flatpak.homeManagerModules.nix-flatpak
          ## Configuration ##
          # NoOp
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
					./modules/gui/gnome
					(if builtins.pathExists ./users/${user.name}/modules/flatpak then ./users/${user.name}/modules/flatpak else ./do-nothing.nix)
				]
				# Additional Home Manager module(s).
				[
					## Module(s) ##
					nix-flatpak.homeManagerModules.nix-flatpak
					## Configuration ##
          # NoOp
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
					./modules/gui/hyprland
					(if builtins.pathExists ./users/${user.name}/modules/flatpak then ./users/${user.name}/modules/flatpak else ./do-nothing.nix)
				]
				# Additional Home Manager module(s).
				[
					## Module(s) ##
					nix-flatpak.homeManagerModules.nix-flatpak
					## Configuration ##
          # NoOp
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
					./modules/gui/kde
					(if builtins.pathExists ./users/${user.name}/modules/flatpak then ./users/${user.name}/modules/flatpak else ./do-nothing.nix)
				]
				# Additional Home Manager module(s).
				[
					## Module(s) ##
					nix-flatpak.homeManagerModules.nix-flatpak
					## Configuration ##
          # NoOp
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
          ./modules/gui/xfce
          (if builtins.pathExists ./users/${user.name}/modules/flatpak then ./users/${user.name}/modules/flatpak else ./do-nothing.nix)
        ]
        # Additional Home Manager module(s).
        [
          ## Module(s) ##
          nix-flatpak.homeManagerModules.nix-flatpak
          ## Configuration ##
          # NoOp
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
					./modules/gui/gnome
					(if builtins.pathExists ./users/${user.name}/modules/flatpak then ./users/${user.name}/modules/flatpak else ./do-nothing.nix)
				]
				# Additional Home Manager module(s).
				[
					## Module(s) ##
					nix-flatpak.homeManagerModules.nix-flatpak
					## Configuration ##
          # NoOp
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
					./modules/gui/hyprland
					(if builtins.pathExists ./users/${user.name}/modules/flatpak then ./users/${user.name}/modules/flatpak else ./do-nothing.nix)
				]
				# Additional Home Manager module(s).
				[
					## Module(s) ##
					nix-flatpak.homeManagerModules.nix-flatpak
					## Configuration ##
          # NoOp
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
					./modules/gui/kde
					(if builtins.pathExists ./users/${user.name}/modules/flatpak then ./users/${user.name}/modules/flatpak else ./do-nothing.nix)
				]
				# Additional Home Manager module(s).
				[
					## Module(s) ##
					nix-flatpak.homeManagerModules.nix-flatpak
					## Configuration ##
          # NoOp
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
          ./modules/gui/xfce
          (if builtins.pathExists ./users/${user.name}/modules/flatpak then ./users/${user.name}/modules/flatpak else ./do-nothing.nix)
        ]
        # Additional Home Manager module(s).
        [
          ## Module(s) ##
          nix-flatpak.homeManagerModules.nix-flatpak
          ## Configuration ##
          # NoOp
        ];
		};
	};
}

