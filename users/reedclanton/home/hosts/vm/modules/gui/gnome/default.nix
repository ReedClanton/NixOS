{ ... }: {
  imports = [
    # Configure flatpak.
    (if builtins.pathExists ../../../../../modules/applications/gui/flatpaks/default.nix then ../../../../../applications/gui/flatpaks else ../../../../../../../../modules/home-manager/applications/gui/flatpaks)
    # Install some flatpak(s).
    ../../../../../modules/applications/gui/flatpaks/applications/brave.nix
    ../../../../../modules/applications/gui/flatpaks/applications/libre-office.nix
    ../../../../../modules/applications/gui/flatpaks/applications/tor-browser-launcher.nix
    # Install base flatpak(s).
    (if builtins.pathExists ../../../../../../../../modules/home-manager/applications/gui/flatpaks/applications/default.nix then ../../../../../../../../modules/home-manager/applications/gui/flatpaks/applications else ../../../../../../../../do-nothing.nix)
    # Install some package(s).
    ../../../../../modules/applications/gui/packages/gedit.nix
    # Install some program(s).
    ../../../../../modules/applications/gui/programs/firefox.nix
    # Host specific VE configuration.
    (if builtins.pathExists ./dconf/default.nix then ./dconf else ../../../../../../../../do-nothing.nix)
  ];
}

