{ lib, user, ... }: {
  ## Status Bar ##
  programs.waybar = {
    enable = true;
  };
  ## Hyprland ##
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    # Settings is handled by user & host specific home-manager configuration.
    # Note(s):
    #   - These settings are set to default so they may be easily overwritten.
    settings = {
      input = lib.mkDefault {
        # Window focus will follow mouse when this is `true`.
        follow_mouse = true;
        # Set keyboard layout.
        kb_layout = user.services.xserver.xkb.layout;
        numlock_by_default = true;
        touchpad = {
          disable_while_typing = true;
          natural_scroll = true;
        };
      };
    };
    # This is enabled in the NixOS portion of the configuration and it conflicts with this. As a result, it must be disabled.
    systemd.enable = false;
  };
}
