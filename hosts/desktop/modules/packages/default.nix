{ inputs, config, pkgs, lib, ... }: {
	imports = [
		../../../../common/modules/packages
	];

	environment.systemPackages = with pkgs; [
		# Tool(s): System #
		brightnessctl
	];
}

