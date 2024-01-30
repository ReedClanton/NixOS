{ nix-flatpak, ... }: {
	services.flatpak.packages = [{ appId = "io.github.nokse22.asciidraw"; origin = "flathub"; }];
}

