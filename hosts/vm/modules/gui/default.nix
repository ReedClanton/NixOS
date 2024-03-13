{ config, ... }: {

  # This enables the drivers needed to support automatic screen resizing of guest display.
  services.xserver.videoDrivers = [ "vmware" "vboxvideo" "modesetting" ];
	
  # This creates a user space systemd service that runs the drivers needed to support automatic screen resizing.
  systemd.user.services = let
    vbox-client = desc: flags: {
      description = "VirtualBox Guest: ${desc}";

      wantedBy = [ "graphical-session.target" ];
      requires = [ "dev-vboxguest.device" ];
      after = [ "dev-vboxguest.device" ];

      unitConfig.ConditionVirtualization = "oracle";

      serviceConfig.ExecStart = "${config.boot.kernelPackages.virtualboxGuestAdditions}/bin/VBoxClient -fv ${flags}";
      };
  in {
    virtualbox-resize = vbox-client "Resize" "--vmsvga";
    virtualbox-clipboard = vbox-client "Clipboard" "--clipboard";
  };
}

