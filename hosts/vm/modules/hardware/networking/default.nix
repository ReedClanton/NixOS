{ lib, hostName, ... }: {
	imports = [
    # TODO: update path to include hardware directory.
		../../../../../modules/networking
	];

	networking = {
		hostName = lib.mkForce hostName;
		wireless.enable = lib.mkForce false;
	};
}

