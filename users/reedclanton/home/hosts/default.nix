{ host, ui, ... }: {
  imports = [
    (if builtins.pathExists ./${host}/modules/applications/tty/config/default.nix then ./${host}/modules/applications/tty/config else ../../../../do-nothing.nix)
    (if builtins.pathExists ./${host}/modules/applications/tty/packages/default.nix then ./${host}/modules/applications/tty/packages else ../../../../do-nothing.nix)
    (if builtins.pathExists ./${host}/modules/applications/tty/programs/default.nix then ./${host}/modules/applications/tty/programs else ../../../../do-nothing.nix)
    (if builtins.pathExists ./${host}/modules/gui/${ui}/default.nix then ./${host}/modules/gui/${ui} else ../../../../do-nothing.nix)
    (if builtins.pathExists ./${host}/modules/hardware/default.nix then ./${host}/modules/hardware else ../../../../do-nothing.nix)
    (if builtins.pathExists ./${host}/modules/networking/default.nix then ./${host}/modules/networking else ../../../../do-nothing.nix)
  ];
}

