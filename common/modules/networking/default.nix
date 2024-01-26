let
	# Import known networks.
	wifi = import ./wifi.nix;
in {
	networking = {
		hostName = "nixos";
		networkmanager.enable = true;
		# This must be set is host specific nix file.
#		unmanaged = [ ];
		# This is wpa_supplicant.
		wireless = {
			enable = true;
			# Empty means all wireless interfaces are included.
			interfaces = [ ];
			networks = wifi;
			userControlled.enable = true;
		};
	};

	systemd.network.networks =
	let
		# This is used multiple times in what's bellow.
		networkConfig = {
			DHCP = "yes";
			DNSSEC = "yes";
			DNSOverTLS = "yes";
		};
	in {
		"40-bluetooth" = {
			enable = true;
			name = "bn*";
			inherit networkConfig;
			dhcpV4Config.RouteMetric = 3092;
		};
		"40-tunnel" = {
			enable = true;
			name = "tun*";
			inherit networkConfig;
			linkConfig.Unmanaged = true;
		};
		"40-wifi" = {
			enable = true;
			name = "wl*";
			inherit networkConfig;
			dhcpV4Config.RouteMetric = 2048;
		};
		"40-wired" = {
			enable = true;
			name = "en*";
			inherit networkConfig;
			dhcpV4Config.RouteMetric = 1024;
		};
	};
}
