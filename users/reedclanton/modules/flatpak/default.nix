{ nix-flatpak, pkgs, ... }: {
	imports = [
		../../home/modules/flatpak/applications/flatseal.nix
	];

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
		update.auto = {
			enable = true;
			onCalendar = "daily";
		};
	};
}

