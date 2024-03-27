{ host, ui, ... }: {
  imports = [
    (if builtins.pathExists ./${host}/modules/applications/tty/config then ./${host}/modules/applications/tty/config else ../../../../do-nothing.nix)
    (if builtins.pathExists ./${host}/modules/applications/tty/packages then ./${host}/modules/applications/tty/packages else ../../../../do-nothing.nix)
    (if builtins.pathExists ./${host}/modules/applications/tty/programs then ./${host}/modules/applications/tty/programs else ../../../../do-nothing.nix)
    (if builtins.pathExists ./${host}/modules/gui/${ui} then ./${host}/modules/gui/${ui} else ../../../../do-nothing.nix)
    (if builtins.pathExists ./${host}/modules/hardware then ./${host}/modules/hardware else ../../../../do-nothing.nix)
    (if builtins.pathExists ./${host}/modules/networking then ./${host}/modules/networking else ../../../../do-nothing.nix)
  ];
}

