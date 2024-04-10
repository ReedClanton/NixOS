{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [ du-dust ];
}

