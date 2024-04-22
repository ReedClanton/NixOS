{ ... }: {
  imports = [
    (if builtins.pathExists ./management/default.nix then ./management else ../../../../../modules/nixos/hardware/power/management)
    (if builtins.pathExists ./tlp/default.nix then ./tlp else ../../../../../modules/nixos/hardware/power/tlp)
  ];
}

