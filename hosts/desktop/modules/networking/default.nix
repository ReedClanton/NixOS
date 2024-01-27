{ lib, hostName, ... }: {
	imports = [
		../../../../modules/networking
	];

	networking = {
		hostName = lib.mkForce hostName;
		# Mark wireless interfaces as unmanaged so spa_supplicant handles them.
		networkmanager.unmanaged = [ "wlp2s0u1u2" "wlp4s6" ];
	};
}

