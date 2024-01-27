{
	description = "Root of NixOS system configuration. Contains all flakes.";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
		unstable.url = "github:nixos/nixpkgs/nixos-unstable";
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
		flatpaks.url = "github:GermanBread/declarative-flatpak/stable";
	};

	outputs = inputs@{ self, flatpaks, home-manager, nixpkgs, nixos-hardware, sops-nix, unstable, ... }:
	let
		pkgs = import nixpkgs {
			inherit system;
			config.allowUnfree = true;
		};

		# Variable(s) used in flake(s).
		shell = import ./data/shell.nix;
		system = "x86_64-linux";
		user = import ./data/users/reedclanton.nix;

		# This function is used to construct NixOS flakes for each host.
		mkComputer = host: ui: extraModules: extraHomeModules:
		let
			# Host name is derived from name of host and name of UI as well as type of system (nixos in our case).
			hostName = inputs.nixpkgs.lib.strings.concatStringsSep "-" [ "nixos" host ui ];
		in inputs.nixpkgs.lib.nixosSystem {
			inherit system;
			# Allow NixOS to access flake data.
			specialArgs = { inherit hostName inputs nixos-hardware pkgs shell system user; };
			modules = [
				## External Module(s) ##
				home-manager.nixosModules.home-manager
				
				## Configuration ##
				# Host specific configuration (path derived from provided name of host).
				./hosts/${host}
				# User's NixOS Configruration.
				(./. + "/users/${user.name}")
				# Home Manager Setup
				{
					home-manager = {
						# Allow Home Manager to access flake data.
						extraSpecialArgs = { inherit hostName inputs pkgs shell system user; };
						useGlobalPkgs = true;
						useUserPackages = true;
						users."${user.name}".imports = [
							# Basic Home Manager setup.
							(./. + "/users/${user.name}/home")
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
					## Modules(s) ##
					flatpaks.nixosModules.default
					## Configuration ##
					./modules/gui/gnome
				]
				# Additional Home Manager module(s).
				[
					(./. + "/users/${user.name}/home/modules/gui/gnome/")
				];
			nixos-desktop-hyprland = mkComputer
				# Name of host and UI.
				"desktop"
				"hyprland"
				# Additional module(s).
				[
					## Modules(s) ##
					flatpaks.nixosModules.default
					## Configuration ##
					./modules/gui/hyprland
				]
				# Additional Home Manager module(s).
				[
					(./. + "/users/${user.name}/home/modules/gui/hyprland")
				];
			nixos-desktop-kde = mkComputer
				# Name of host and UI.
				"desktop"
				"kde"
				# Additional module(s).
				[
					## Modules(s) ##
					flatpaks.nixosModules.default
					## Configuration ##
					./modules/gui/kde
				]
				# Additional Home Manager module(s).
				[
					(./. + "/users/${user.name}/home/modules/gui/hyprland")
				];
			nixos-desktop-tty = mkComputer
				# Name of host and UI.
				"desktop"
				"tty"
				# Additional module(s).
				[
					## Modules(s) ##
					## Configuration ##
				]
				# Additional Home Manager module(s).
				[ ];
		};
	};
}
