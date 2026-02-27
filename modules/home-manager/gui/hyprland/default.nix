{ config, lib, pkgs, user, ... }: {
  ## Set Dark Theme ##
  dconf.settings."org/gnome/desktop/interface" = {
    gtk-theme = "gruvbox-dark";
    color-scheme = "prefer-dark";
  };
  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "macchiato";
        accent = "maroon";
      };
      name = "Papirus-Dark";
    };
    theme = {
      package = pkgs.gruvbox-dark-gtk;
      name = "gruvbox-dark";
    };
    colorScheme = "dark";
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.Settings = ''
      gtk-application-prefer-dark-theme=1
    '';
  };
  # Ensure theme gets applied.
  xdg.configFile."gtk-4.0/gtk.css".force = true;

  ## Status Bar ##
  # Config file configuration.
  home.file."${config.xdg.configHome}/ashell/config.toml".source = ../../config/gui/hyprland/ashell.toml;
  # Nix (Home Manger) configuration.
  programs.ashell = {
    enable = true;
    systemd.enable = true;
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
