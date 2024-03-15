{ ... }: {
  # Copy KeePass file into more obvious location.
  home.file."Documents/Secrets/KeePass/reedclanton.kdbx".source = ../../../config/kee-pass/reedclanton.kdbx;

	services.flatpak.packages = [{ appId = "org.gnome.World.Secrets"; origin = "flathub"; }];
}

