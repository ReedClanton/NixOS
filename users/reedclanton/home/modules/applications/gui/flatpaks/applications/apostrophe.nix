{ ... }: {
	services.flatpak.packages = [
    { appId = "org.gnome.gitlab.somas.Apostrophe"; origin = "flathub"; }
    { appId = "org.gnome.gitlab.somas.Apostrophe.Plugin.TexLive"; origin = "flathub"; }
  ];
}

