{ lib, pkgs, ... }: {
	boot = {
    # This installs the latest LTS kernel.
		kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
		loader = {
			efi.canTouchEfiVariables = true;
			systemd-boot = {
				enable = true;
				# Disabled for security. May need to enable for backwards compatibility.
				editor = false;
				configurationLimit = 25;
			};
			timeout = 1;
		};
	};
}

