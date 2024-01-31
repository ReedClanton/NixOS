{ config, inputs, pkgs, sops-nix, user, ... }: {
	environment = {
		etc = {
#			"keys/age/${user.name}_keys.txt" = {
#				user = user.name;
#				source = ../../keys.txt;
#			};
			"keys/ssh/ssh_host_ed25519_key_${user.name}" = {
				user = user.name;
				source = ../../id_ed25519;
			};
		};
		systemPackages = with pkgs; [ sops ];
	};

	sops = {
		defaultSopsFile = ../../config/sops/secrets/reedclanton.yaml;
		defaultSopsFormat = "yaml";
		age = {
#			keyFile = "${user.home}/.config/sops/age/keys.txt";
#			keyFile = "/etc/keys/age/${user.name}_keys.txt";
			sshKeyPaths = [ "/etc/keys/ssh/ssh_host_ed25519_key_${user.name}" ];
		};
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
