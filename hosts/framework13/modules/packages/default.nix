{ pkgs, ... }: {
	imports = [
		../../../../modules/packages
	];

	environment.systemPackages = with pkgs; [
		brightnessctl
    framework-tool
	];
}

