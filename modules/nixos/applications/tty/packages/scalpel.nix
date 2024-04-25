{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [ scalpel ];
}

