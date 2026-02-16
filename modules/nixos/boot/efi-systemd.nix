{ lib, pkgs, ... }: {
	boot = {
    # When this value is updated, it's necessary to also update the kernel version used in a number
    # of other locations. Search this repo for `linuxKernel.packages.linux_` as well as
    # for `linuxPackages_` and update each instance. It's known currently that
    # `./modules/nixos/hardware/game-controller/logitech-wheel.nix` and
    # `./modules/nixos/virtualisation/default.nix` must be updated.
    kernelPackages = lib.mkDefault pkgs.linuxPackages_6_19;
		loader = {
			efi.canTouchEfiVariables = true;
			systemd-boot = {
				enable = true;
				# Disabled for security. May need to enable for backwards compatibility.
				editor = false;
				configurationLimit = 31;
			};
			timeout = 1;
		};
	};
}

