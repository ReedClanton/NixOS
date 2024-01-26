{ inputs, config, pkgs, lib, user, ... }: {
	time.timeZone = user.timeZone;
}

