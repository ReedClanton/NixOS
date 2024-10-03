{ ... }: {
	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "23.11";

	nix = {
		settings = {
			## System Updating ##
			auto-optimise-store = true;
			experimental-features = [ "nix-command" "flakes" ];

			# Enable caching of Hyprland so it doesn't need to build.
			substituters = [ "https://hyprland.cachix.org" ];
			trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
		};

		## Garbage Collection ##
		gc = {
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than 365d";
		};
	};
}

