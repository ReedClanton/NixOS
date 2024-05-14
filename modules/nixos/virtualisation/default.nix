{ pkgs, user, ... }: {
	users.extraGroups.vboxuser.members = [ user.name ];

	virtualisation = {
		vmware.host = {
      enable = true;
      # Only needed while https://store-us.vmware.com/workstation_buy_dual is down for maintenance.
      package = (pkgs.vmware-workstation.overrideAttrs rec {
        src = ./vmware.bundle;
        unpackPhase = let
          vmware-unpack-env = pkgs.buildFHSEnv rec {
            name = "vmware-unpack-env";
            targetPkgs = pkgs: [ pkgs.zlib ];
          };
        in ''
          ${vmware-unpack-env}/bin/vmware-unpack-env -c "sh ${src} --extract unpacked"
        '';
      });
    };
		virtualbox.host = {
			enable = true;
			enableExtensionPack = true;
		};
	};
}
