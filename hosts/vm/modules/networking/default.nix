{ lib, hostName, ... }: {
	imports = [
		../../../../modules/networking
	];

	networking = {
		hostName = lib.mkForce hostName;
		wireless.enable = lib.mkForce false;
	};
}

