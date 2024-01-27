{ pkgs, shell, ... }: {
	programs.tmux = {
		enable = true;
		baseIndex = 1;
		clock24 = false;
		disableConfirmationPrompt = false;
		escapeTime = 500;
		extraConfig = builtins.readFile ../../../config/tmux/tmux.conf;
		historyLimit = shell.history.inMemory;
		mouse = true;
		plugins = with pkgs; [
#			tmuxPlugins.better-mouse-mode
			tmuxPlugins.sensible
#			tmuxPlugins.sidebar
#			tmuxPlugins.yank
		];
		shortcut = "a";
		# Tmux wrapper.
		tmuxp.enable = true;
	};
}

