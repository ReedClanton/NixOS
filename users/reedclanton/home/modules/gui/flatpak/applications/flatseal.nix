{ nix-flatpak, ... }: {
	services.flatpak.packages = [{ appId = "com.github.tchx84.Flatseal"; origin = "flathub"; }];
}

