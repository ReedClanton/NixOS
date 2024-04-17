{ ... }: {
  imports = [
    (if builtins.pathExists ../../../../../modules/nixos/hardware/game-controller/logitech-wheel.nix then ../../../../../modules/nixos/hardware/game-controller/logitech-wheel.nix else (if builtins.pathExists ../../../../../modules/nixos/hardware/game-controller/wheel.nix then ../../../../../modules/nixos/hardware/game-controller/wheel.nix else (if builtins.pathExists ../../../../../modules/nixos/hardware/game-controller/default.nix then ../../../../../modules/nixos/hardware/game-controller else ../../../../../do-nothing.nix)))
  ];
}

