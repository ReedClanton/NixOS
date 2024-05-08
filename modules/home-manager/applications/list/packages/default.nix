{ config, lib, ... }: with lib; {
  # Generate list of installed package(s).
  home.file."${config.xdg.userDirs.documents}/home-manager-package-list".text =
  let
    packages = builtins.map (p: "${p.name}") config.home.packages;
    sortedUnique = builtins.sort builtins.lessThan (unique packages);
    formatted = builtins.concatStringsSep "\n" sortedUnique;
  in formatted;
}
