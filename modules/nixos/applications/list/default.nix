{ config, lib, ... }: with lib; {
  # Generate list of all application(s) install by NixOS.
  environment.etc."nixos-install-list".text =
  let
    flatpaks-list = builtins.map (p: "flatpak: ${p.appId}") config.services.flatpak.packages;
    packages-list = builtins.map (p: "package: ${p.name}") config.environment.systemPackages;
    programs = builtins.mapAttrs
      (name: value:
        (if name == "bash" || name != "info" && name != "man" && name != "unity3d" && name != "x2goserver" && (builtins.tryEval (builtins.hasAttr "enable" value && value.enable)).value then
          "program: ${name}"
        else
          ""))
      config.programs;
    programs-list = builtins.map (key: builtins.getAttr key programs) (builtins.attrNames programs);
    install-list = flatpaks-list ++ packages-list ++ programs-list;
    sortedUnique = builtins.sort builtins.lessThan (unique install-list);
    formatted = builtins.concatStringsSep "\n" sortedUnique;
  in formatted;
}

