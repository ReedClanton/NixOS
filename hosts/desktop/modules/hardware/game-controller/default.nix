{ ... }: {
  imports = [
    (if builtins.pathExists ../../../../../modules/hardware/game-controller/logitech-wheel.nix then ../../../../../modules/hardware/game-controller/logitech-wheel.nix else (if builtins.pathExists ../../../../../modules/hardware/game-controller/wheel.nix then ../../../../../modules/hardware/game-controller/wheel.nix else (if builtins.pathExists ../../../../../modules/hardware/game-controller/default.nix then ../../../../../modules/hardware/game-controller else ../../../../../do-nothing.nix)))
  ];
}

