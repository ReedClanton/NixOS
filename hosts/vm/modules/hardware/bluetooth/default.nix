{ ... }: {
  # No need for bluetooth on a virtual machine.
  imports = [ ../../../../../do-nothing.nix ];
}

