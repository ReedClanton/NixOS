{ ... }: {
  # Import this user's Hyprland configuration file.
  wayland.windowManager.hyprland.extraConfig = builtins.readFile ../../../config/hyprland/hyprland.conf;
  # Force this user's Hyprland configuration file to be used.
  # Note(s):
  #   - Because of this, everywhere else that Hyprland is configured must be done via Nix.
  xdg.configFile."hypr/hyprland.conf".force = true;
}

