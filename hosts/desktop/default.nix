# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }: {
	imports = [
		# Include the results of the hardware scan.
		./hardware-configuration.nix
		# Setup this host.
		../../modules/boot/efi-systemd.nix
		../../modules/getty
		../../modules/language
		./modules/sops
		./modules/networking
		../../modules/nix
		../../modules/nixpkgs
		./modules/packages
		../../modules/printing
		../../modules/programs
		../../modules/sound
		../../modules/ssh
		../../modules/sudo
		../../modules/time
		../../modules/tty
		../../modules/v4l2loopback
		../../modules/virtualisation
		../../modules/xdg
	];
}
