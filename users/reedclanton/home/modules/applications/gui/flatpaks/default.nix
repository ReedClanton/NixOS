{ pkgs, user, ... }: {
  imports = [ ../../../../../../../modules/applications/gui/flatpak ];

	home.packages = with pkgs; [ flatpak ];

  # Needed for desktop icons to show up due to nix-flatpak bug: #31.
	xdg.systemDirs.data = [
		"${user.home}/.local/share/flatpak/exports/share"
#    "/var/lib/flatpak/exports/share"
	];
}

