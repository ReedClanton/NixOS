{ ... }: {
	imports = [
		# Include the results of the hardware scan.
		./hardware-configuration.nix
		./modules/hardware/drive/steam.nix
		./modules/hardware/drive/vm.nix
		# Setup this host.
		../../modules/boot/efi-systemd.nix
		../../modules/getty
		./modules/hardware/gpu
		../../modules/language
		./modules/networking
		../../modules/nix
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
