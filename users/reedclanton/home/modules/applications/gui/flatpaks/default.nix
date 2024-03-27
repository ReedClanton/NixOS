{ pkgs, user, ... }: {
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
    uninstallUnmanagedPackages = true;
		update = {
			auto.enable = true;
			onActivation = true;
		};
	};

  # Needed for desktop icons to show up due to nix-flatpak bug: #31.
	xdg.systemDirs.data = [
		"${user.home}/.local/share/flatpak/exports/share"
#    "/var/lib/flatpak/exports/share"
	];
}

