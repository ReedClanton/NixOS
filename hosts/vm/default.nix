{ ui, ... }: {
	imports = [
		# Include the results of the hardware scan.
		./hardware-configuration.nix
    # Include custom host specific hardware configuration.
    (if builtins.pathExists ./modules/hardware/default.nix then ./modules/hardware else ../../do-nothing.nix)
		# Setup this host.
    (if builtins.pathExists ./modules/applications/tty/packages/default.nix then ./modules/applications/tty/packages else ../../modules/applications/tty/packages)
    (if builtins.pathExists ./modules/applications/tty/programs/default.nix then ./modules/applications/tty/programs else ../../modules/applications/tty/programs)
    (if builtins.pathExists ./modules/benchmark/default.nix then ./modules/benchmark else ../../modules/benchmark)
    (if builtins.pathExists ./modules/boot/default.nix then ./modules/boot else ../../modules/boot/efi-systemd.nix)
    (if builtins.pathExists ./modules/documentation/default.nix then ./modules/documentation else ../../modules/documentation)
    (if builtins.pathExists ./modules/getty/default.nix then ./modules/getty else ../../modules/getty)
    (if builtins.pathExists ./modules/gui/${ui}/default.nix then ./modules/gui/${ui} else ../../do-nothing.nix)
    (if builtins.pathExists ./modules/language/default.nix then ./modules/language else ../../modules/language)
    (if builtins.pathExists ./modules/networking/default.nix then ./modules/networking else ../../modules/networking)
    (if builtins.pathExists ./modules/nix/default.nix then ./modules/nix else ../../modules/nix)
    (if builtins.pathExists ./modules/proton/default.nix then ./modules/proton else ../../modules/proton)
    (if builtins.pathExists ./modules/sound/default.nix then ./modules/sound else ../../modules/sound)
    (if builtins.pathExists ./modules/ssh/default.nix then ./modules/ssh else ../../modules/ssh)
    (if builtins.pathExists ./modules/sudo/default.nix then ./modules/sudo else ../../modules/sudo)
    (if builtins.pathExists ./modules/time/default.nix then ./modules/time else ../../modules/time)
    (if builtins.pathExists ./modules/tty/default.nix then ./modules/tty else ../../modules/tty)
    (if builtins.pathExists ./modules/virtualisation/default.nix then ./modules/virtualisation else ../../modules/virtualisation)
    (if builtins.pathExists ./modules/xdg/default.nix then ./modules/xdg else ../../modules/xdg)
	];
}
