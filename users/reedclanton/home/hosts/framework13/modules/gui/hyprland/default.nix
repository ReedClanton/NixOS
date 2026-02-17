{ ... }: {
  imports = [
    # Install GUI applications for this DE.
    (if builtins.pathExists ../../../../../modules/applications/gui/default.nix then ../../../../../modules/applications/gui else ../../../../../../../../do-nothing.nix)
  ];
}

