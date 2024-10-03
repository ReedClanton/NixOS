{ pkgs, ... }: {
	boot = {
		kernelPackages = pkgs.linuxPackages_latest;
		loader = {
			efi.canTouchEfiVariables = true;
			systemd-boot = {
				enable = true;
				# Disabled for security. May need to enable for backwards compatibility.
				editor = false;
				configurationLimit = 20;
			};
			timeout = 1;
		};
	};
}

