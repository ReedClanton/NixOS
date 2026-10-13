{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [ shellspec ];
}

