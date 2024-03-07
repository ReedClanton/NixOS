{ ... }: {
	imports = [
		# Include the results of the hardware scan.
		./hardware-configuration.nix
    # Commented out because installing newer firemware prevents shutdown and boot.
#    ../../modules/hardware/wifi/mt7961
    (if builtins.pathExists ./modules/hardware/default.nix then ./modules/hardware else ../../do-nothing.nix)
		# Setup this host.
    (if builtins.pathExists ./modules/applications/tty/default.nix then ./modules/applications/tty else ../../do-nothing.nix)
		(if builtins.pathExists ./modules/boot/default.nix then ./modules/boot else ../../modules/boot/efi-systemd.nix)
		(if builtins.pathExists ./modules/documentation/default.nix then ./modules/documentation else ../../modules/documentation)
		(if builtins.pathExists ./modules/getty/default.nix then ./modules/getty else ../../modules/getty)
		(if builtins.pathExists ./modules/language/default.nix then ./modules/language else ../../modules/language)
		(if builtins.pathExists ./modules/networking/default.nix then ./modules/networking else ../../modules/networking)
		(if builtins.pathExists ./modules/nix/default.nix then ./modules/nix else ../../modules/nix)
		(if builtins.pathExists ./modules/packages/default.nix then ./modules/packages else ../../modules/packages)
		(if builtins.pathExists ./modules/printing/default.nix then ./modules/printing else ../../modules/printing)
		(if builtins.pathExists ./modules/programs/default.nix then ./modules/programs else ../../modules/programs)
    (if builtins.pathExists ./modules/proton/default.nix then ./modules/proton else ../../modules/proton)
		(if builtins.pathExists ./modules/sound/default.nix then ./modules/sound else ../../modules/sound)
		(if builtins.pathExists ./modules/ssh/default.nix then ./modules/ssh else ../../modules/ssh)
		(if builtins.pathExists ./modules/sudo/default.nix then ./modules/sudo else ../../modules/sudo)
		(if builtins.pathExists ./modules/time/default.nix then ./modules/time else ../../modules/time)
		(if builtins.pathExists ./modules/tty/default.nix then ./modules/tty else ../../modules/tty)
		(if builtins.pathExists ./modules/v4l2loopback/default.nix then ./modules/v4l2loopback else ../../modules/v4l2loopback)
		(if builtins.pathExists ./modules/virtualisation/default.nix then ./modules/virtualisation else ../../modules/virtualisation)
		(if builtins.pathExists ./modules/xdg/default.nix then ./modules/xdg else ../../modules/xdg)
	];

	# Enable firmware updating (run `fwupdmgr update` in terminal to update).
	services.fwupd.enable = true;
}
