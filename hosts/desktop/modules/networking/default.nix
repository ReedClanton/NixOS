{ lib, hostName, ... }: {
	imports = [
		../../../../modules/networking
	];

	networking = {
		hostName = lib.mkForce hostName;
    # Mark internal PCI wireless interface as unmanaged so wpa_supplicant will manage it.
    networkmanager.unmanaged = [ "wlp4s6" "wlp2s0u1u1i3" ];
	};
}

