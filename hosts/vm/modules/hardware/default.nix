{ ... }: {
  imports = [
    (if builtins.pathExists ./drive/default.nix then ./drive/default.nix else ../../../../do-nothing.nix)
    (if builtins.pathExists ./gpu/default.nix then ./gpu/default.nix else ../../../../do-nothing.nix)
  ];
}

