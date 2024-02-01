{ nix-flatpak, ... }: {
	services.flatpak.packages = [{ appId = "org.rncbc.qpwgraph"; origin = "flathub"; }];
}

