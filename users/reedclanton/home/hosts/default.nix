{ host, ui, ... }: {
  imports = [
    # Setup hardware.
    (if builtins.pathExists ./${host}/modules/hardware/default.nix then ./${host}/modules/hardware else ../../../../do-nothing.nix)
    # User setup.
    (if builtins.pathExists ./${host}/modules/applications/tty/default.nix then ./${host}/modules/applications/tty else ../../../../do-nothing.nix)
    # GUI setup.
    (if builtins.pathExists ./${host}/modules/gui/${ui}/default.nix then ./${host}/modules/gui/${ui} else ../../../../do-nothing.nix)
  ];
}

