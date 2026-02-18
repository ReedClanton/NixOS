{ ui, ... }: {
  imports = [
    (
      if builtins.pathExists ../../../../../../modules/home-manager/gui/${ui}/default.nix then
        ../../../../../../modules/home-manager/gui/${ui}
      else
        ../../../../../../do-nothing.nix
    )
  ];
  wayland.windowManager.hyprland.extraConfig = builtins.readFile ../../../config/hyprland/hyprland.conf;
  xdg.configFile."hypr/hyprland.conf".force = true;
}

