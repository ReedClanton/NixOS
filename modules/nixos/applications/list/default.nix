{ config, lib, ... }: with lib; {
  # Generate list of installed package(s).
  environment.etc."nixos-package-list".text =
  let
    packages = builtins.map (p: "${p.name}") config.environment.systemPackages;
    sortedUnique = builtins.sort builtins.lessThan (unique packages);
    formatted = builtins.concatStringsSep "\n" sortedUnique;
  in formatted;
}
