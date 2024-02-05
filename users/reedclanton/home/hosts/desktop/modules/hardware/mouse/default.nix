{ config, ... }: {
	home.file."${config.xdg.configHome}/kcminputrc".source = ../../../../../config/hardware/mouse/kcminputrc;
}
