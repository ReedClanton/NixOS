{ config, lib, ... }: with lib; {
  # Generate list of Home Manager installed program(s).
  home.file."${config.xdg.userDirs.documents}/home-manager-programs-list".text =
  let
    programs = builtins.mapAttrs
      (name: value:
        (if name == "bash" || name != "exa" && name != "mako" && (builtins.tryEval (builtins.hasAttr "enable" value && value.enable)).value then
          "${name}"
        else
          ""))
      config.programs;
    programs-list = builtins.map (key: builtins.getAttr key programs) (builtins.attrNames programs);
    sortedUnique = builtins.sort builtins.lessThan (unique programs-list);
    formatted = builtins.concatStringsSep "\n" sortedUnique;
  in formatted;
}

