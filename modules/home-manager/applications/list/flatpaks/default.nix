{ config, lib, ... }: with lib; {
  # Generate list of Home Manager installed flatpak package(s).
  home.file."${config.xdg.userDirs.documents}/home-manager-flatpak-list".text =
  let
    flatpaks-list = builtins.map (p: "${p.appId}") config.services.flatpak.packages;
    sortedUnique = builtins.sort builtins.lessThan (unique flatpaks-list);
    formatted = builtins.concatStringsSep "\n" sortedUnique;
  in formatted;
}

