{ ui, ... }: {
	imports = [
		# Include the results of the hardware scan.
		./hardware-configuration.nix
    # Include custom host specific hardware configuration.
    (if builtins.pathExists ./modules/hardware/default.nix then ./modules/hardware else ../../do-nothing.nix)
		# Setup this host.
    (if builtins.pathExists ./modules/applications/list/default.nix then ./modules/applications/list else ../../modules/nixos/applications/list)
    (if builtins.pathExists ./modules/applications/tty/packages/default.nix then ./modules/applications/tty/packages else ../../modules/nixos/applications/tty/packages)
    (if builtins.pathExists ./modules/applications/tty/programs/default.nix then ./modules/applications/tty/programs else ../../modules/nixos/applications/tty/programs)
    (if builtins.pathExists ./modules/benchmark/default.nix then ./modules/benchmark else ../../modules/nixos/benchmark)
    (if builtins.pathExists ./modules/boot/default.nix then ./modules/boot else ../../modules/nixos/boot/efi-systemd.nix)
    (if builtins.pathExists ./modules/documentation/default.nix then ./modules/documentation else ../../modules/nixos/documentation)
    (if builtins.pathExists ./modules/getty/default.nix then ./modules/getty else ../../modules/nixos/getty)
    (if builtins.pathExists ./modules/gui/${ui}/default.nix then ./modules/gui/${ui} else ../../do-nothing.nix)
    (if builtins.pathExists ./modules/language/default.nix then ./modules/language else ../../modules/nixos/language)
    (if builtins.pathExists ./modules/nix/default.nix then ./modules/nix else ../../modules/nixos/nix)
    (if builtins.pathExists ./modules/proton/default.nix then ./modules/proton else ../../modules/nixos/proton)
    (if builtins.pathExists ./modules/sound/default.nix then ./modules/sound else ../../modules/nixos/sound)
    (if builtins.pathExists ./modules/ssh/default.nix then ./modules/ssh else ../../modules/nixos/ssh)
    (if builtins.pathExists ./modules/sudo/default.nix then ./modules/sudo else ../../modules/nixos/sudo)
    (if builtins.pathExists ./modules/time/default.nix then ./modules/time else ../../modules/nixos/time)
    (if builtins.pathExists ./modules/tty/default.nix then ./modules/tty else ../../modules/nixos/tty)
    (if builtins.pathExists ./modules/virtualisation/default.nix then ./modules/virtualisation else ../../modules/nixos/virtualisation)
    (if builtins.pathExists ./modules/xdg/default.nix then ./modules/xdg else ../../modules/nixos/xdg)
	];
}
