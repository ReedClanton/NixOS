{ user, ... }: {
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
    uninstallUnmanaged = true;
		update.auto = {
			enable = true;
			onCalendar = "daily";
		};
	};

  # Needed for desktop icons to show up due to nix-flatpak bug: #31.
	xdg.systemDirs.data = [
		"${user.home}/.local/share/flatpak/exports/share"
	];
}

