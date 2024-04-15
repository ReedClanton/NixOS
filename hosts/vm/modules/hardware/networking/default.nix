{ lib, hostName, ... }: {
	imports = [
		../../../../../modules/hardware/networking
	];

	networking = {
		hostName = lib.mkForce hostName;
		wireless.enable = lib.mkForce false;
	};
}

