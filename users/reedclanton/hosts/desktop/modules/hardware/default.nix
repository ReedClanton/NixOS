{ ... }: {
  imports = [
    (if builtins.pathExists ./keyboard/default.nix then ./keyboard else ../../../../../../do-nothing.nix)
    (if builtins.pathExists ./networking/default.nix then ./networking else ../../../../../../do-nothing.nix)
  ];
}

