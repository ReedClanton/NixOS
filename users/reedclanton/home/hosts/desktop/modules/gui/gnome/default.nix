{ ... }: {
  # Import external host and user specific configuration for this Desktop Environment (DE).
  imports = [
    # Host specific DE configuration.
    (if builtins.pathExists ./dconf/default.nix then ./dconf else ../../../../../../../../do-nothing.nix)
  ];
}

