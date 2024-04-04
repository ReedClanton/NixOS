{ ... }: {
  imports = [
    (if builtins.pathExists ./bluetooth/default.nix then ./bluetooth else ../../../../modules/hardware/bluetooth)
    (if builtins.pathExists ./drive/default.nix then ./drive else ../../../../do-nothing.nix)
    (if builtins.pathExists ./game-controller/default.nix then ./game-controller else ../../../../modules/hardware/game-controller/logitech-wheel.nix)
    (if builtins.pathExists ./gpu/default.nix then ./gpu else ../../../../do-nothing.nix)
  ];
}

