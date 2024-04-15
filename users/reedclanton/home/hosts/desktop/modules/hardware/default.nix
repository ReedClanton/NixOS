{ ... }: {
  imports = [
    (if builtins.pathExists ./mouse/default.nix then ./mouse else ../../../../../../../do-nothing.nix)
  ];
}

