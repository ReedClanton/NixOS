{ ... }: {
	imports = [
		# Include the results of the hardware scan.
		./hardware-configuration.nix
		./modules/hardware/drive/steam.nix
		./modules/hardware/drive/vm.nix
		./modules/hardware/gpu
		../../modules/hardware/game-controller/logitech-wheel.nix
		# Setup this host.
		../../modules/boot/efi-systemd.nix
		../../modules/documentation
		../../modules/getty
		../../modules/language
		./modules/networking
		../../modules/nix
		../../modules/packages
		../../modules/proton
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
