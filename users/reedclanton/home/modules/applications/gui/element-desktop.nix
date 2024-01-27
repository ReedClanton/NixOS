{ config, osConfig, pkgs, ... }: {
	home = {
		packages = with pkgs; [ element-desktop ];
#		file."${config.xdg.userDirs.documents}/Secrets/Element/security-key.txt".source = osConfig.sops.secrets."app/element-desktop/message-key".path;
	};
}

