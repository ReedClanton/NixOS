{ pkgs, user, ... }: {
  environment.systemPackages = with pkgs; [
    # Query or control network driver and hardware settings.
    ethtool
  ];

	networking = {
		hostName = "nixos";
		networkmanager.enable = true;
		# This must be set in host specific nix file.
#		unmanaged = [ ];
		# This is wpa_supplicant.
		wireless = {
			enable = true;
			# Empty means all wireless interfaces are included.
			interfaces = [ ];
			# This must be set in host/user specific nix file.
#			networks = { };
			userControlled.enable = true;
		};
	};

	systemd.network.networks =
	let
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

	users.users."${user.name}".extraGroups = [ "networkmanager" ];
}
