{ inputs, pkgs, user, ... }: {
	imports = [ inputs.sops-nix.nixosModules.sops ];

	environment.systemPackages = with pkgs; [ sops ];

	sops = {
		defaultSopsFile = ../../config/sops/secrets/wifi.yaml;
		defaultSopsFormat = "yaml";
		age.keyFile = "${user.home}/.config/sops/age/keys.txt";
		secrets = {
			"wireless.env" = { };
		};
	};
}
