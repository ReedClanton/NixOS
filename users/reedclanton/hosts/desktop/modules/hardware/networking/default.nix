{ ... }: {
	networking.wireless.networks."nixos-framework13" = {
    priority = 505;
    psk = "@nixos_framework13_psk@";
	};
}

