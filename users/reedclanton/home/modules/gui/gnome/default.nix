{ config, lib, pkgs, user, ... }: with lib; {
	imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "user/${user.name}/home/modules/gui/gnome/default.nix";
    # Tracks location of GNOME dconf configuration.
    dconf-configuration = "./dconf/default.nix";
  in [
    # Configure DE.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${dconf-configuration}")) then
        ./. + (builtins.substring 1 9999 "${dconf-configuration}")
      else
        trivial.warn
          "${current-file-path}: User '${user.name}' has no GNOME dconf configuration (${dconf-configuration})."
          ../../../../../../do-nothing.nix
    )
	];

  # GTK theming settings
  gtk = {
    enable = true;
    colorScheme = "dark";
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
  };
  # Likely already installed by NixOS, but included here just in case.
  home.packages = with pkgs; [ adwaita-icon-theme ];
}
