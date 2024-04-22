{ ... }: {
  imports = [
    # Host specific setup.
    (if builtins.pathExists ./dconf/default.nix then ./dconf else ../../../../../../../../do-nothing.nix)
    # Configure flatpak.
    (if builtins.pathExists ../../../../../modules/applications/gui/flatpaks/default.nix then ../../../../../modules/applications/gui/flatpaks else ../../../../../../../../modules/home-manager/applications/gui/flatpaks)
    # Install some flatpak(s).
    # Note(s):
    #   - Not in conditional b/c build should fail when these basic application(s) can't be installed.
    ../../../../../modules/applications/gui/flatpaks/applications/brave.nix
    ../../../../../modules/applications/gui/flatpaks/applications/libre-office.nix
    ../../../../../modules/applications/gui/flatpaks/applications/tor-browser-launcher.nix
    # Install some package(s).
    # Note(s):
    #   - Not in conditional b/c build should fail when these basic application(s) can't be installed.
    ../../../../../modules/applications/gui/packages/gedit.nix
    # Install some program(s).
    # Note(s):
    #   - Not in conditional b/c build should fail when these basic application(s) can't be installed.
    ../../../../../modules/applications/gui/programs/firefox.nix
  ];
}

