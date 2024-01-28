{ config, inputs, pkgs, sops-nix, user, ... }: {
	environment.systemPackages = with pkgs; [ sops ];

	sops = {
		defaultSopsFile = ../../config/sops/secrets/reedclanton.yaml;
		defaultSopsFormat = "yaml";
		age.keyFile = "${user.home}/.config/sops/age/keys.txt";
		secrets = {
			"app/element-desktop/message-key" = {
				owner = config.users.users."${user.name}".name;
				group = config.users.users."${user.name}".group;
				mode = "400";
			};
			"users/${user.name}/pwd_hash".mode = "400";
			"wireless.env" = {
				owner = config.users.users."${user.name}".name;
				group = config.users.users."${user.name}".group;
				mode = "400";
			};
		};
	};
}
