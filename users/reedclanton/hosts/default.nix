{ host, ui, ... }: {
  imports = [
    (if builtins.pathExists ./${host}/modules/applications/tty then ./${host}/modules/applications/tty else ../../../../do-nothing.nix)
#    (if builtins.pathExists ./${host}/modules/gui/${ui} then ./${host}/modules/gui/${ui} else ../../../../do-nothing.nix)
    (if builtins.pathExists ./${host}/modules/hardware then ./${host}/modules/hardware else ../../../../do-nothing.nix)
    (if builtins.pathExists ./${host}/modules/networking then ./${host}/modules/networking else ../../../../do-nothing.nix)
  ];
}

