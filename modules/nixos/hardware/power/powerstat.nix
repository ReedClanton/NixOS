{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [ powerstat ];
}

