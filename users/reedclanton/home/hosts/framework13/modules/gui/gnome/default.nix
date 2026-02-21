{ pkgs, ... }: {
  # Import external host and user specific configuration for this Desktop Environment (DE).
  imports = [
    # Host specific Desktop Environment (DE) configuration.
    (if builtins.pathExists ./dconf/default.nix then ./dconf else ../../../../../../../../do-nothing.nix)
  ];

  # Cursor broke for some reason. Now I set it here.
  home.pointerCursor = {
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
  };
}

