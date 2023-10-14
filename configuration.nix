# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

# TODO:
#	- Disable auto start of gdm.
#	- Move `fileSystems."/" from hardware-configuration.nix to this file and change it to use a drive label rather than uuid (maybe).
#	- Configure console (font, size, colors, etc.).
#	- Configure system from disk partitoning up
#	- Determine if the following can have packages removed and installed via flatpak:
#		- gnome-color-manager -> org.gnome.ColorViewer
#		- gnome-connections -> org.gnome.Connections
#		- baobab -> org.gnome.baobab
#	- Fix Minecraft flatpak (this will also allow Steam to be installed)
#	- Test each gnome app installed from flatpak to ensure they function. When they don't implement fix in this file.
#	- Add system packages:
#		- Drivers
#		- Auto detect correct driver
#		- WiFi stuff
#		- Kernal(s)
#		- bashtop
#	- Switch to unstable.
#	- Add user packages:
#		- ...
#	- Configure git.
#	- Configure bluetooth audio.
#	- Break up this file.
#	- Handle Gnome configuration.
#	- Handle transfering of data.
#	- Detemrine how x11 is being used and attempt to remove it.

{ config, pkgs, lib, ... }:
let
  normalUserName = "reedclanton";
  normalUserRealName = "ReedClanton";
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

   ########################
  ## System Configuration ##
   ########################
  
#  boot = import ./system/setup/boot.nix;
  boot = {
    ## Bootloader ##
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };

    ## Kernel(s) ##
    # TODO: Detemrine how to install multiple kernels and boot into the latest automatically.
#    kernelPackages = pkgs.linuxPackages_latest;

    ## Kernel Module(s) ##
    # TODO: Dynamicly determine what module(s) should be used based on hardware.
    # Empeture monitoring:    Intel      AMD
#    initrd.kernelModules = [ "coretemp" "k10temp" ];
  };

  ## Networking ##
  networking = {
    hostName = "framework-13";
    # Enables wireless support via wpa_supplicant.
    # TODO: Figure out why this causes issues and ensure wirelsss works (somehow).
#    wireless.enable = true;
    # Configure network proxy.
#    proxy.default = "http://user:password@proxy:port/";
#    proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    # Enable networking.
    networkmanager.enable = true;
    # Open ports in the firewall.
#    networking.firewall.allowedTCPPorts = [ ... ];
#    networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
#    networking.firewall.enable = false;
  };

  ## Time ##
  time.timeZone = "America/Chicago";

  ## Language/Character Set ##
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

   ####################################
  ## Driver Instilation/Configuration ##
   ####################################

  ## Printing ##
  # Enable CUPS printing driver.
  services.printing.enable = true;

  ## Sound ##
  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this.
#    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
#    media-session.enable = true;
  };

  ## User I/O ##
  # Enable touchpad support (enabled default in most desktopManager).
#  services.xserver.libinput.enable = true;

  # Finger print reader driver setup.
  # TODO: Test.
#  services.fprintd = {
#    enable = true;
#    tod = {
#      enable = true;
      # TODO: Determine which of the bellow drivers should be used (ideally programaticly).
#      driver = pkgs.libfprint-2-tod1-vfs0090;
#      driver = pkgs.libfprint-2-tod1-goodix;
#    };
#  };

   ###########################
  ## Default Package Removal ##
   ###########################
  services.xserver.excludePackages = [ pkgs.xterm ];

   ###############################
  ## System Package Installation ##
   ###############################

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Driver(s) #
    # TODO: Dynamicly install driver(s) based on hardware.
    # Basic system driver(s)/firmware.
#    mesa
#    linux-firmware
    # Microcode.
#    microcodeIntel
#    microcodeAmd
    # Integrated graphics driver(s).
#    xf86videointel
    # VM driver(s).
#    pkgs.virtualboxGuestAdditions
#    xf86videovmware
    # Bluetooth driver.
#    bluez
    # Standards based printer driver.
#    cups
    # HP printer driver.
#    hplip
    # Text Tool(s) #
    neovim
    nano
    # System Tool(s) #
    wget
    git
    openssh
    rsync
    brightnessctl
    # Terminal Tool(s) #
    man-pages
    man-pages-posix
    tmux
    neofetch
    # Terminal(s) #
    bash
  ];

  ## Virtualisation ##
  users.extraGroups.vboxusers.members = [ "${normalUserName}" ];
  # TODO: Auto detect if in a VM.
  virtualisation.virtualbox.guest = {
    enable = true;
  };
#  virtualisation.virtualbox.host = {
#    enable = true;
#    enableExtenstionPack = true;
#  };

   ################################
  ## System Package Configuration ##
   ################################
  # TODO: Figure out why git config won't get applied.
  system.activationScripts = {
    gitConfig = ''
      /run/current-system/sw/bin/git config --global user.name "${normalUserRealName}"
    '';
    gitConfigEmail = ''
      /run/current-system/sw/bin/git config --global user.email "clantonreed@gmail.com"
    '';
    gitConfigEditor = ''
      /run/current-system/sw/bin/git config --global core.editor "nvim"
    '';
  };
#  programs.git.config = [ { userName = "TEST"; } { user.name = "TEST2"; } { core.editor = "nvim"; } ];
#  programs.git = {
#    enable = true;
#    userName = "${normalUserRealName}";
#    userEmail = "clantonreed@gmail.com";
#    coreEditor = "nvim";
#  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    configure = {
      customRC = ''
        " Turn line numbers on.
        set number
	" TODO: Fill out the rest and figure out why these changes aren't being applied.
      '';
    };
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  programs.bash = {
    enableCompletion = true;
    enableLsColors = true;
  };
  environment.shellAliases = {
#    src = ". $HOME/.bashrc";
    ssh = "ssh -X";
    grep = "grep --color=auto";
    ip = "ip --color=auto";
    ls = "ls --color=auto";
    c = "clear;pwd;ls -GAp";
    g = "c;git branch -a;git status";
    gF = "git fetch --all -ftp";
  };

  ## User Package(s) & Flatpak(s) ##

  # Flatpak #

  # Install Flatpak.
  services.flatpak.enable = true;
  # Add Flatpak repo(s).
  system.activationScripts = {
    flathub = ''
      /run/current-system/sw/bin/flatpak remote-add --system --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    '';
  };
  # Install flatpaks.
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

  # Define a user account.
  users.users.${normalUserName} = {
    isNormalUser = true;
    description = "${normalUserRealName}";
    extraGroups = [ "networkmanager" "wheel" "lp" "scanner" ];
    initialPassword = "password";
    shell = pkgs.bash;
    packages = with pkgs; [
      # System Tool(s) #
      xdg-utils
      xdg-user-dirs
      xdg-ninja
      os-prober
      brightnessctl
      # Development Tool(s) #
      shellspec
      docker
      docker-buildx
      # TODO: Python
      # Terminal Tool(s) #
      bat
      htop
      # TODO: Find a better terminal web browser.
      lynx
      # Terminal(s) #
      dash
      zsh
      ksh
      # Font(s) #
      source-code-pro
    ];
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
  services.xserver.displayManager.autoLogin.user = "${normalUserName}";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
#  programs.mtr.enable = true;
#  programs.gnupg.agent = {
#    enable = true;
#    enableSSHSupport = true;
#  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

   #############################################
  ## Generate List of All Installed Package(s) ##
   #############################################
  
  # Generate list of installed packages in `/etc/current-system-packages`.
  environment.etc."current-system-packages".text =
    let
      packages = builtins.map (p: "${p.name}") config.environment.systemPackages;
      sortedUnique = builtins.sort builtins.lessThan (lib.unique packages);
      formatted = builtins.concatStringsSep "\n" sortedUnique;
    in
  formatted;

   ###################
  ## System Updating ##
   ###################
  
  system.autoUpgrade.enable = true;

   ##############################
  ## NixOS System Configuration ##
   ##############################
  
  nix = {
    extraOptions = "experimental-features = nix-command flakes";

    ## System Updating ##
    settings.auto-optimise-store = true;

    ## Garbage Collection ##
    gc = {
      automatic = false;
      dates = "weekly";
      options = "--delete-older-than 3m";
    };
  };
}
