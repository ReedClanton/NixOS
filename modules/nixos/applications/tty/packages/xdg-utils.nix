{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [ xdg-utils ];
}

