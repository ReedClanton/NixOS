{ user, ... }: {
  ## Status Bar ##
  programs.waybar = {
    enable = true;
  };
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      # Increase the sensitivity of the track pad.
      device = {
        name = "pixa3854:00-093a:0274-touchpad";
        sensitivity = 0.5;
      };
      input = {
        follow_mouse = true;
        kb_layout = user.services.xserver.xkb.layout;
        numlock_by_default = true;
        touchpad = {
          disable_while_typing = true;
          natural_scroll = true;
        };
        # Decrease the sensitivity of the mouse.
        sensitivity = -1;
      };
    };
    # This is enabled in the NixOS portion of the configuration and it conflicts with this. As a result, it must be disabled.
    systemd.enable = false;
  };
}
