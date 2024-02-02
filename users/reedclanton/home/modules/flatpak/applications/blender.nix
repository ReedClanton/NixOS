{ nix-flatpak, pkgs, ... }: {
	# Enable hardware accelerated rendering.
	home.packages = [ pkgs.blender-hip ];

	services.flatpak.packages = [{ appId = "org.blender.Blender"; origin = "flathub"; }];
}

