{ lib, hostName, ... }: {
	imports = [
    # TODO: update path to include hardware directory.
		../../../../../modules/networking
	];

	networking = {
		hostName = lib.mkForce hostName;
    # Mark internal PCI wireless interface as unmanaged so wpa_supplicant will manage it.
    networkmanager.unmanaged = [ "wlp4s6" "wlp2s0u1u1i3" ];
    # Disable wpa_supplicant.
    #   TODO:
    #     - Sort out why wpa_supplicant doesn't work on this host.
    wireless.enable = lib.mkForce false;
	};
}

