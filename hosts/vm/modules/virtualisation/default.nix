{ lib, user, ... }: {
  imports = [
    ../../../../modules/nixos/virtualisation
  ];

  # Setup shared folder.
	fileSystems."/vmshare" = {
		fsType = "vboxsf";
		device = "Share";
		options = [ "rw" "nofail" ];
	};

  # Configure host as guest.
	virtualisation = {
		vmware = {
      guest.enable = true;
      host.enable = lib.mkForce false;
    };
		virtualbox = {
      guest = {
        enable = true;
        # X11 is needed in order to enable the drivers that allow for automatic screen resizing.
        x11 = true;
      };
      host = {
        enable = lib.mkForce false;
        enableExtensionPack = lib.mkForce false;
      };
    };
	};
}
