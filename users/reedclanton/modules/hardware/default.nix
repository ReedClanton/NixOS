{ ... }: {
  imports = [
    (if builtins.pathExists ./bluetooth/default.nix then ./bluetooth else ../../../../do-nothing.nix)
    (if builtins.pathExists ./drive/default.nix then ./drive else ../../../../do-nothing.nix)
    (if builtins.pathExists ./game-controller/default.nix then ./game-controller else ../../../../do-nothing.nix)
    (if builtins.pathExists ./gpu/default.nix then ./gpu else ../../../../do-nothing.nix)
    (if builtins.pathExists ./keyboard/default.nix then ./keyboard else ../../../../do-nothing.nix)
    (if builtins.pathExists ./networking/default.nix then ./networking else ../../../../do-nothing.nix)
    (if builtins.pathExists ./power/default.nix then ./power else ../../../../do-nothing.nix)
    (if builtins.pathExists ./printing/default.nix then ./printing else ../../../../do-nothing.nix)
    (if builtins.pathExists ./v4l2loopback/default.nix then ./v4l2loopback else ../../../../do-nothing.nix)
  ];
}

