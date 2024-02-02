{ nix-flatpak, pkgs, user, ... }: {
	home.packages = with pkgs; [ flatpak ];

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
		update = {
			auto.enable = true;
			onActivation = true;
		};
	};

	xdg.systemDirs.data = [
		"${user.home}/.local/share/flatpak/exports/share"
	];
}

