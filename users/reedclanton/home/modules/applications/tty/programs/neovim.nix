{ config, lib, user, ... }: {
  home = {
    # Link NeoVIM spell dictionary into configuration.
    activation.linkNeoVIMSpellFile = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      ln -sf ${config.xdg.configHome}/NixOS/users/${user.name}/home/config/neovim/spell/en.utf-8.add ${config.xdg.configHome}/nvim/spell/en.utf-8.add
    '';
    # Ensure tmux spell check configuration directory exists.
    file."${config.xdg.configHome}/nvim/spell/.keep".text = "Home Manager can only create directories that contain something. Thus in order for Home Manager to create the directory this file is in, a file must be created in it. Hense the existice of this file.";
  };

	programs.neovim = {
		enable = true;
		defaultEditor = true;
		extraConfig = builtins.readFile ../../../../config/neovim/init.vim;
#		coc = {
#			enable = true;
#			pluginConfig = ''
#		'';
#		};
	};
}

