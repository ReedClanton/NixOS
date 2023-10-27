# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

# TODO (MID):
#   - DECIDE:
#     - If NixOS configuration should auto detect hardware (VM, Intel, AMD, etc) and install based on that or just have
#      seprate configurations that are run manually.
#   - DO:
#     - Update/remove todos based on above choice.

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
#		- bashtop
#	- Add user packages:
#		- ...
#	- Configure git.
#	- Configure bluetooth audio.
#	- Handle Gnome configuration.
#	- Handle transfering of data.
#	- Detemrine how x11 is being used and attempt to remove it.

{ config, pkgs, lib, ... }:
let
  normalUserName = "reedclanton";
  normalUserRealName = "ReedClanton";
in
{
  # TODO (LOW):
  #   - RESEARCH:
  #     - How to break up .nix files such that diffrent systems may be installed (likly involves flakes).
  #   - THEN:
  #     - Break up .nix files such that a system may be built with any combination of items from 'Hardware' and 'UI':
  #       - Hardware:
  #         - VM
  #         - Intel CPU/integrated graphics
  #         - AMD CPU/integrated graphics
  #         - AMD deticated graphics
  #         - NVIDIA deticated graphics
  #       - UI:
  #         - tty
  #         - Gnome
  #         - KDE
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

   ########################
  ## System Configuration ##
   ########################
  
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
    # TODO (LOW):
    #   - RESEARCH:
    #     - Can multiple kernels be installed.
    #       - If yes, determine how to choose what kernel is booted.
    #     - Can "snapshots" of a system with a given kernel (ex. lts) be kept around in case of an issue with the
    #      latest kernel such that it may be booted into.
    #   - DECIDE:
    #     - Choose one of the above options.
    #   - DO:
    #     - Implement the option chosen above.
#    kernelPackages = pkgs.linuxPackages_latest;

    ## Initialization ##
    initrd = {
      # Kernel Module(s) #
      # TODO (MID):
      #   - TEST:
      #     - Test on real hardware that hardware specific kernel modules, like those for tempeture monitoring
      #      (Intel: coretemp, AMD: k10temp), are automaticly installed by NixOS when hardware-configuration.nix is
      #      created.
      #   - DO:
      #     - If hardware specific kernel modules are handled by the NixOS install, then go through all todo items and
      #      remove/update them based on findings.
      # TODO (HIGH):
      #   - RESEARCH:
      #     - How to enable VM guest additions such that auto screen resizing occurs.
      #   - DO:
      #     - Enable auto screen resizing.
#      kernelModules = [ "coretemp" "k10temp" ];
      
      # File System #
      # TODO (MID):
      #   - DO:
      #     - Only diable bellow when in a VM.
      # Disable file system check on ext4 VMs (not needed in VMs and may cause problems).
      checkJournalingFS = false;
    };
  };

  ## Networking ##
  networking = {
    hostName = "framework-13";
    # Enables wireless support via wpa_supplicant.
    # TODO (MID):
    #   - RESEARCH:
    #     - How to enable both wired and wireless networking.
    #   - DO:
    #     - Enable wired and wireless networking when on real hardware.
#    wireless.enable = true;
    # Enable networking.
    networkmanager.enable = true;
    # TODO (LOW):
    #   - DECIDE:
    #     - Choose if a fireware should be installed and configured or if Portmaster should be used.
    #   - DO:
    #     - Install and configure option chosen above.
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

   #####################################
  ## Driver Installation/Configuration ##
   #####################################

  ## Printing ##
  # Enable CUPS printing driver.
  services.printing.enable = false;
  # Additional drivers that may or may not be needed depending on printer.
#  services.printing.drivers = [
    # Drivers for many different printers from many different vendors.
#    pkgs.gutenprint
    # Additional binary-only drivers for some printers.
#    pkgs.gutenprintBin
    # Drivers for HP printers.
#    pkgs.hplip
    # Drivers for HP printers with proprietary plugins.
    #   NOTE: Use NIXPKGS_ALLOW_UNFREE=1 nix-shell -p hplipWithPlugin --run 'sudo -E hp-setup' to add the printer,
    #    regular CUPS UI doesn't seem to work.
#    pkgs.hplipWithPlugin
    # Postscript drivers for Lexmark.
#    pkgs.postscript-lexmark
    # Proprietary Samsung drivers.
#    pkgs.samsung-unified-linux-driver
    # Drivers for printers that support SPL (Samsung Printer Language).
#    pkgs.splix
    # Drivers for some Brother printers.
#    pkgs.brlaser
    # Generic drivers for more Brother printers.
#    pkgs.brgenml1lpr
#    pkgs.brgenml1cupswrapper
    # Drivers for some Canon Pixma devices.
#    pkgs.cnijfilter2
#  ];
  # Enable network printer auto-detect.
#  services.avahi = {
#    enable = true;
#    nssmdns = true;
#    openFirewall = true;
#  };
  # TODO (LOW):
  #   - BLOCKED:
  #     - Can't setup a printer because I don't own one...
  #   - DO:
  #     - Configure printer so it's already setup upon system install.

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
  # TODO (MID):
  #   - TEST:
  #     - Determine if fingerprint reader works.
  #   - DO:
  #     - If fingerprint reader doesn't work, get it working.
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

#  services.xserver.excludePackages = [ pkgs.xterm ];
  services.xserver.excludePackages = [];

   ###############################
  ## System Package Installation ##
   ###############################

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Driver(s) #
    # TODO (LOW) (BLOCKED):
    #   - BLOCKED:
    #     - Must decide if hardware will be configured via auto detect, NixOS install, or manually by installer.
    #   - DO:
    #     - Install hardware specific package(s).
    # Basic system driver(s)/firmware.
#    mesa
#    linux-firmware
    # Microcode.
#    microcodeIntel
#    microcodeAmd
    # Integrated graphics driver(s).
#    xf86videointel
    # VM driver(s).
#    virtualboxGuestAdditions
#    xf86videovmware
    # Bluetooth driver.
#    bluez
    # Text Tool(s) #
    nano
    # System Tool(s) #
    wget
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
#    x11 = false;
  };
  # Map VM shared directory at boot.
  fileSystems."/virtualboxshare" = {
    fsType = "vboxsf";
    device = "Shared";
    options = [ "rw" "nofail" ];
  };
#  virtualisation.virtualbox.host = {
#    enable = true;
#    enableExtenstionPack = true;
#  };

   ################################
  ## System Package Configuration ##
   ################################
  # TODO: Figure out why git config won't get applied.
#  system.activationScripts = {
#    gitConfig = ''
#      /run/current-system/sw/bin/git config --global user.name "${normalUserRealName}"
#    '';
#    gitConfigEmail = ''
#      /run/current-system/sw/bin/git config --global user.email "clantonreed@gmail.com"
#    '';
#    gitConfigEditor = ''
#      /run/current-system/sw/bin/git config --global core.editor "nvim"
#    '';
#  };
#  programs.git.config = [ { userName = "TEST"; } { user.name = "TEST2"; } { core.editor = "nvim"; } ];
  programs.git = {
    enable = true;
#    userName = "${normalUserRealName}";
#    userEmail = "clantonreed@gmail.com";
#    coreEditor = "nvim";
  };

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
  system.stateVersion = "unstable"; # Did you read the comment?

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
