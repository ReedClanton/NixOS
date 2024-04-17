{ pkgs, ... }: {
	imports = [ ./default.nix ];

	environment.systemPackages = with pkgs; [
		oversteer
	];
}
