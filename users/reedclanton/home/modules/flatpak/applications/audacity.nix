{ nix-flatpak, ... }: {
	services.flatpak.packages = [{ appId = "org.audacityteam.Audacity"; origin = "flathub"; }];
}

