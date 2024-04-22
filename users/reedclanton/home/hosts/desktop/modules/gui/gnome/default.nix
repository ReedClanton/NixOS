{ ... }: {
  imports = [
    # Host specific setup.
    (if builtins.pathExists ./dconf/default.nix then ./dconf else ../../../../../../../../do-nothing.nix)
    # Install all GUI application(s).
    (if builtins.pathExists ../../../../../modules/applications/gui/default.nix then ../../../../../modules/applications/gui else ../../../../../../../../modules/home-manager/applications/gui)
  ];
}

