{ lib, user, ... }: {
  imports = [
    ../../../../modules/virtualisation
  ];

  # Setup shared folder.
	fileSystems."/vmshare" = {
		fsType = "vboxsf";
		device = "Shared";
		options = [ "rw" "nofail" ];
	};

  # Configure host as guest.
	virtualisation = {
		vmware = {
      guest.enable = true;
      host.enable = lib.mkForce false;
    };
		virtualbox = {
      guest.enable = true;
      host = {
        enable = lib.mkForce false;
        enableExtensionPack = lib.mkForce false;
      };
    };
	};
}
