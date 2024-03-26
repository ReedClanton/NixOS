{ lib, user, ... }: {
  # Copy KeePass file into more obvious location.
  home.file."Documents/Secrets/KeePass/.keep".text = "Home Manager can only create directories that contain something. Thus in order for Home Manager to create the directory this file is in, a file must be created in it. Hense the existice of this file.";
  home.activation.linkMyStuff = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ln -sf $XDG_CONFIG_HOME/NixOS/users/${user.name}/home/config/kee-pass/reedclanton.kdbx $XDG_DOCUMENTS_DIR/Secrets/KeePass/reedclanton.txt
  '';

	services.flatpak.packages = [{ appId = "org.gnome.World.Secrets"; origin = "flathub"; }];
}

