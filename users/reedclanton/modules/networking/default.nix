{ inputs, config, ... }:
let
	# Import known networks.
	wifi = import ./wifi.nix;
in {
	networking.wireless.networks = wifi;
}

