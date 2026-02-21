{ ... }: {
  # Import external host and user specific configuration for this Window Manager (WM).
  imports = [
    ../../../../../../../../do-nothing.nix
  ];

  # Host, and user, specific WM configuration.
  wayland.windowManager.hyprland.settings = {
    # Increase the sensitivity of the track pad.
    device = {
      name = "pixa3854:00-093a:0274-touchpad";
      sensitivity = 0.5;
    };
  };
}

