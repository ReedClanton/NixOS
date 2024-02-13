{ nix-flatpak, ... }: {
	services.flatpak.packages = [{ appId = "org.wesnoth.Wesnoth//stable"; origin = "flathub"; }];
}

