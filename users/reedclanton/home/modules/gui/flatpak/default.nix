{ nix-flatpak, pkgs, user, ... }: {
	home.packages = with pkgs; [ flatpak ];

	services.flatpak = {
		enable = true;
		remotes = [{
			name = "flathub-beta";
			location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
		}];
		update = {
			auto = {
				enable = true;
				onCalendar = "daily";
			};
			onActivation = true;
		};
	};

	xdg.systemDirs.data = [
		"/var/lib/flatpak/exports/share"
		"${user.home}/.local/share/flatpak/exports/share"
	];
}

