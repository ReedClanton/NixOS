{ config, lib, ... }: with lib; {
  # Generate list of Home Manager installed package(s).
  home.file."${config.xdg.userDirs.documents}/home-manager-package-list".text =
  let
    packages-list = builtins.map (p: "${p.name}") config.home.packages;
    sortedUnique = builtins.sort builtins.lessThan (unique packages-list);
    formatted = builtins.concatStringsSep "\n" sortedUnique;
  in formatted;
}
