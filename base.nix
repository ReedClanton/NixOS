# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

# TODO:
#	- Disable auto start of gdm.
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
#	- Break up this file.
#	- Handle Gnome configuration.
#	- Handle transfering of data.
#	- Detemrine how x11 is being used and attempt to remove it.

{ config, pkgs, lib, ... }: {
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

   ########################
  ## System Configuration ##
   ########################
  
  ## Bootloader ##

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ## Networking ##

  networking.hostName = "framework-13";
  # Enables wireless support via wpa_supplicant.
  # networking.wireless.enable = true;

  # Configure network proxy.
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  ## Time ##

  # Set your time zone.
  time.timeZone = "America/Chicago";

  ## Language/Character Set ##

  # Select internationalisation properties.
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

  ## Hardware/Driver Configuration ##

  # Printing #

  # Enable CUPS printing driver.
  services.printing.enable = true;

  # Sound #

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # User I/O #

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Finger print reader driver setup.
  # TODO: Test.
#  services.fprintd.enable = true;
#  services.fprintd.tod.enable = true;
  # TODO: Determine which of the bellow drivers should be used (ideally programaticly).
#  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-vfs0090;
#  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;

   ########################
  ## Program Installation ##
   ########################

  ## System Packages ##

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Virtualisation #

  # TODO: Auto detect if in a VM.
  # Guest.
  virtualisation.virtualbox.guest.enable = true;
  # Host.
#  virtualisation.virtualbox.host.enable = true;
#  virtualisation.virtualbox.host.enableExtenstionPack = true;
#  user.extraGroups.vboxusers.members = [ "reedclanton" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Driver(s) #
#    mesa
#    linux-firmware
#    microcodeIntel
#    microcodeAmd
#    xf86videointel
#    pkgs.virtualboxGuestAdditions
#    xf86videovmware
#    bluez
#    cups
#    pkgs.fprintd
    # Text Tool(s) #
    neovim
    nano
    # System Tool(s) #
    wget
    git
    openssh
    rsync
    # Terminal Tool(s) #
    man-pages
    man-pages-posix
    # Terminal(s) #
    bash
  ];

  # Configure Git #
  programs.git = {
    enable = true;
    userName = "ReedClanton";
    userEmail = "clantonreed@gmail.com";
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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.reedclanton = {
    isNormalUser = true;
    description = "ReedClanton";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # System Tool(s) #
      xdg-utils
      xdg-user-dirs
#      xdg-ninja
      os-prober
      brightnessctl
      # Development Tool(s) #
      shellspec
      docker
      docker-buildx
      # TODO: Python
      # Terminal Tool(s) #
      tmux
      neofetch
      bat
      htop
      bash-completion
      nix-bash-completions
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

   #######################
  ## TODO: Section Title ##
   #######################

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  # Generate list of installed packages in `/etc/current-system-packages`.
  environment.etc."current-system-packages".text =
    let
      packages = builtins.map (p: "${p.name}") config.environment.systemPackages;
      sortedUnique = builtins.sort builtins.lessThan (lib.unique packages);
      formatted = builtins.concatStringsSep "\n" sortedUnique;
    in
  formatted;
}
