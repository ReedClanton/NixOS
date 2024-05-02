{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [ dash ];
}

