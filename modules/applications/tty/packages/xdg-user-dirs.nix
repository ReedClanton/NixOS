{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [ xdg-user-dirs ];
}

