# Configures Gnome visual environment (VE).

{ config, pkgs, lib, ... }: {
  imports =
    [
      # TODO: Comment.
      ../base.nix
    ];

   ####################
  ## Install Flatpaks ##
   ####################
  
  system.activationScripts = {
    flatpakInstallGnomeSystemUtilities = ''
      /run/current-system/sw/bin/flatpak install -y org.gnome.Calculator org.gnome.clocks org.gnome.Calendar org.gnome.TextEditor org.gnome.gedit org.gnome.Weather org.gnome.Epiphany org.gnome.Evince org.gnome.Characters org.gnome.Contacts org.gnome.font-viewer org.gnome.Loupe org.gnome.SimpleScan
    '';
    flatpakInstallTextTools = ''
      /run/current-system/sw/bin/flatpak install -y com.github.liferooter.textpieces org.libreoffice.LibreOffice
    '';
#    flatpakInstallMediaTools = ''
#      /run/current-system/sw/bin/flatpak install -y fr.romainvigier.MetadataCleaner org.nickvision.tubeconverter org.videolan.VLC org.audacityteam.Audacity org.gimp.GIMP com.jgraph.drawio.desktop io.gitlab.gregorni.ASCIIImages org.freecadweb.FreeCAD org.blender.Blender
#    '';
    flatpakInstallSystemUtilities = ''
      /run/current-system/sw/bin/flatpak install -y com.github.tchx84.Flatseal com.usebottles.bottles com.transmissionbt.Transmission
    '';
#    flatpakInstallGaming = ''
#      /run/current-system/sw/bin/flatpak install -y com.valvesoftware.Steam com.mojang.Minecraft
#    '';
    flatpakInstallUserApplications = ''
      /run/current-system/sw/bin/flatpak install -y org.mozilla.firefox org.telegram.desktop us.zoom.Zoom
    '';
  };

   #######
  ## GUI ##
   #######

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  # TODO: Disable so boots to terminal.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Remove part of Gnome I don't want.
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gnome-text-editor
  ]) ++ (with pkgs.gnome; [
    cheese
    gnome-music
    geary
    totem
    gnome-calculator
    gnome-calendar
    gnome-color-manager
    gnome-maps
    gnome-user-share
    gnome-software
    rygel
    gnome-weather
    gnome-clocks
    epiphany
    evince
    gnome-characters
    gnome-contacts
    gnome-font-viewer
    simple-scan
  ]);

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "reedclanton";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}
