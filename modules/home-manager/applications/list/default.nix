{ config, ui, lib, ... }: with lib; {
  # Generate list of all application(s) installed by Home Manager.
  home.file."${config.xdg.userDirs.documents}/home-manager-install-list".text =
  let
    # Only include flatpaks if running a GUI.
    flatpaks-list = (
      if ("${ui}" == "tty") then
        null
      else
        (builtins.map (p: "flatpak: ${p.appId}") config.services.flatpak.packages)
    );
    packages-list = builtins.map (p: "package: ${p.name}") config.home.packages;
    programs = builtins.mapAttrs
      (name: value:
        (if name == "bash" || name != "exa" && name != "mako" && (builtins.tryEval (builtins.hasAttr "enable" value && value.enable)).value then
          "program: ${name}"
        else
          ""))
      config.programs;
    programs-list = builtins.map (key: builtins.getAttr key programs) (builtins.attrNames programs);
    # Only include flatpaks if running a GUI.
    install-list = (
      if (builtins.isNull flatpaks-list) then
        packages-list ++ programs-list
      else
        flatpaks-list ++ packages-list ++ programs-list
    );
    sortedUnique = builtins.sort builtins.lessThan (unique install-list);
    formatted = builtins.concatStringsSep "\n" sortedUnique;
  in formatted;
}

