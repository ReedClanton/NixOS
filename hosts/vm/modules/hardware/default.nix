{ ... }: {
  imports = [
    (if builtins.pathExists ./bluetooth/default.nix then ./bluetooth else ../../../../modules/nixos/hardware/bluetooth)
    (if builtins.pathExists ./drive/default.nix then ./drive else ../../../../do-nothing.nix)
    (if builtins.pathExists ./game-controller/default.nix then ./game-controller else ../../../../modules/nixos/hardware/game-controller)
    (if builtins.pathExists ./gpu/default.nix then ./gpu else ../../../../do-nothing.nix)
    (if builtins.pathExists ./networking/default.nix then ./networking else ../../../../modules/nixos/hardware/networking)
    (if builtins.pathExists ./power/default.nix then ./power else ../../../../do-nothing.nix)
    (if builtins.pathExists ./printing/default.nix then ./printing else ../../../../modules/nixos/hardware/printing)
    (if builtins.pathExists ./v4l2loopback/default.nix then ./v4l2loopback else ../../../../modules/nixos/hardware/v4l2loopback)
  ];
}

