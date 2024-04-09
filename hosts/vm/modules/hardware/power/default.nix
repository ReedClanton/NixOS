{ ... }: {
  # No need for power usage optimization on a virtual machine.
  imports = [ ../../../../../do-nothing.nix ];
}

