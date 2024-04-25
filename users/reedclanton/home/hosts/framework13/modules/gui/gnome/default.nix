{ ... }: {
  imports = [
    # Install GUI applications for this VE.
    (if builtins.pathExists ../../../../../modules/applications/gui/default.nix then ../../../../../modules/applications/gui else ../../../../../../../../do-nothing.nix)
    # Host specific VE configuration.
    (if builtins.pathExists ./dconf/default.nix then ./dconf else ../../../../../../../../do-nothing.nix)
  ];
}

