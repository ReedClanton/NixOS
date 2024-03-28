{ ... }: {
  imports = [
    (if builtins.pathExists ./drive/default.nix then ./drive else ../../../../do-nothing.nix)
    (if builtins.pathExists ./gpu/default.nix then ./gpu else ../../../../do-nothing.nix)
  ];
}

