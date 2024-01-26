{ inputs, config, ... }: {
	boot.loader = {
		systemd-boot = {
			enable = true;
			configurationLimit = 10;
		};
		efi.canTouchEfiVariables = true;
		timeout = 1;
	};
}

