{ config, lib, ... }: with lib; {
  environment.etc."current-system-packages".text =
  let
    packages = builtins.map (p: "${p.name}") config.environment.systemPackages;
    sortedUnique = builtins.sort builtins.lessThan (unique packages);
    formatted = builtins.concatStringsSep "\n" sortedUnique;
  in formatted;
}
