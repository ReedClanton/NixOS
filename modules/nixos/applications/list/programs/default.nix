{ config, lib, ... }: with lib; {
  # Generate list of NixOS installed program(s).
  environment.etc."nixos-programs-list".text =
  let
    programs = builtins.mapAttrs
      (name: value:
        (if name == "bash" || name != "info" && name != "man" && name != "unity3d" && name != "x2goserver" && (builtins.tryEval (builtins.hasAttr "enable" value && value.enable)).value then
          "${name}"
        else
          ""))
      config.programs;
    programs-list = builtins.map (key: builtins.getAttr key programs) (builtins.attrNames programs);
    sortedUnique = builtins.sort builtins.lessThan (unique programs-list);
    formatted = builtins.concatStringsSep "\n" sortedUnique;
  in formatted;
}

