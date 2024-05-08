{ config, lib, ... }: with lib; {
  # Generate list of installed flatpak package(s).
  home.file."${config.xdg.userDirs.documents}/home-manager-flatpak-list".text =
  let
    packages = builtins.map (p: "${p.appId}") config.services.flatpak.packages;
    sortedUnique = builtins.sort builtins.lessThan (unique packages);
    formatted = builtins.concatStringsSep "\n" sortedUnique;
  in formatted;
}

