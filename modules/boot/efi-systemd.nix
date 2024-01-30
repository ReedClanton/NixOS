{ pkgs, ... }: {
	boot = {
		kernelPackages = pkgs.linuxPackages_latest;
		loader = {
			efi.canTouchEfiVariables = true;
			systemd-boot = {
				enable = true;
				configurationLimit = 10;
			};
			timeout = 1;
		};
	};
}

