{ config, sops-nix, ... }: {
	sops = {
		defaultSopsFile = ../../../config/sops/secrets/reedclanton.yaml;
		defaultSopsFormat = "yaml";
		age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
		secrets = {
			"app/element-desktop/message-key" = { };
		};
	};
}
