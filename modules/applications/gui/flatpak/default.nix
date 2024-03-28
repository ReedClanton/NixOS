{ ... }: {
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
		update.auto = {
			enable = true;
			onCalendar = "daily";
		};
	};
}

