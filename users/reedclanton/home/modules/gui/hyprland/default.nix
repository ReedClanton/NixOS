{ ... }: {
  wayland.windowManager.hyprland.extraConfig = builtins.readFile ../../../config/hyprland/hyprland.conf;
  xdg.configFile."hypr/hyprland.conf".force = true;
}

