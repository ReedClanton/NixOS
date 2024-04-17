{ lib, hostName, ... }: {
	imports = [
		../../../../../modules/nixos/hardware/networking
	];

	networking = {
		hostName = lib.mkForce hostName;
		wireless.enable = lib.mkForce false;
	};
}

