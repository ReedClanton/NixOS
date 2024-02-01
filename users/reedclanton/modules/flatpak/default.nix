{ nix-flatpak, pkgs, ... }: {
	imports = [
		../../home/modules/flatpak/applications/flatseal.nix
	];

#	environment.systemPackages = with pkgs; [ flatpak ];

	services.flatpak = {
		enable = true;
		remotes = [
			{
				name = "flathub-beta";
				location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
			}
			{
				name = "flathub";
				location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
			}
		];
		# Commented out because: https://github.com/gmodena/nix-flatpak/issues/30
#		update = {
#			auto.enable = true;
#			onActivation = true;
#		};
	};
}

