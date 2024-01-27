{ inputs, config, pkgs, ... }: {
	imports = [
		../../../../modules/packages
	];

	environment.systemPackages = with pkgs; [
		# Tool(s): System #
		brightnessctl
	];
}

