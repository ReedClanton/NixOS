{ pkgs, ... }: {
  imports = [
    # Install GUI applications for this DE.
    (if builtins.pathExists ../../../../../modules/applications/gui/default.nix then ../../../../../modules/applications/gui else ../../../../../../../../do-nothing.nix)
    # Host specific VE configuration.
    (if builtins.pathExists ./dconf/default.nix then ./dconf else ../../../../../../../../do-nothing.nix)
  ];
  # Cursor broke for some reason. Now I set it here.
  home.pointerCursor = {
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
  };
}

