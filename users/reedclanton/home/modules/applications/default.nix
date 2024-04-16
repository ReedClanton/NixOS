# This file installed *all* applications. Not appropriate for tty environments.
{ ... }: {
  imports = [
    (if builtins.pathExists ./gui/default.nix then ./gui else ../../../../../do-nothing.nix)
    (if builtins.pathExists ./tty/default.nix then ./tty else ../../../../../do-nothing.nix)
  ];
}

