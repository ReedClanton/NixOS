{ ... }: {
	networking.wireless.networks."nixos-desktop" = {
    priority = 505;
    psk = "@nixos_desktop_psk@";
	};
}

