{ pkgs, ... }: {
  # Provides entropy. Initially included to support `linux-router` package.
	home.packages = with pkgs; [ haveged ];
}

