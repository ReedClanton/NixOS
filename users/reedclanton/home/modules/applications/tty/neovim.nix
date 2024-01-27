{ config, ... }: {
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		extraConfig = builtins.readFile ../../../config/neovim/init.vim;
#		coc = {
#			enable = true;
#			pluginConfig = ''
#		'';
#		};
	};
}

