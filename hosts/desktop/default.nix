# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }: {
	imports = [
		# Include the results of the hardware scan.
		./hardware-configuration.nix
		# Setup this host.
		../../common/modules/boot/efi-systemd.nix
		../../common/modules/getty
		../../common/modules/language
		./modules/sops
		./modules/networking
		../../common/modules/nix
		../../common/modules/nixpkgs
		./modules/packages
		../../common/modules/printing
		../../common/modules/programs
		../../common/modules/sound
		../../common/modules/ssh
		../../common/modules/sudo
		../../common/modules/time
		../../common/modules/tty
		../../common/modules/v4l2loopback
		../../common/modules/virtualisation
		../../common/modules/xdg
	];
}
