{ config, user, ... }: {
	# Ensure shell's directory exists in XDG's configuration home.
	home.file."${config.xdg.configHome}/bash/.keep".text = "Home Manager can only create directories that contain something. Thus in order for Home Manager to creation the directory this file is in, a file must be created in it. Hense the existice of this file.";

	programs.bash = {
		enable = true;
		enableCompletion = user.shell.completion;
		# This is run by every shell.
		bashrcExtra = user.shell.shellRc;
		historyControl = [ "ignoredups" "erasedups" "ignorespace" ];
		historyFile = "${config.xdg.configHome}/bash/history";
		historyFileSize = user.shell.history.maxLineCount;
		historyIgnore = user.shell.history.ignore;
		# Number of history lines to keep in memory.
		historySize = user.shell.history.inMemory;
		# Run while initializing interactive shells.
		initExtra = ''
			## Shell Indapendent ##
			${user.shell.shellProfile}
			
			## Bash Specific ##
			# Tab-completing matches regardless of case.
			bind "set completion-ignore-case on"
			# Tab-completing only requires one press.
			bind "set show-all-if-ambiguous on"
			# Turns off the notification/bell noise.
			bind "set bell-style none"
		'';
		sessionVariables = {
			HISTTIMEFORMAT = "%F %T: ";
		};
		shellOptions = [
			"autocd"
			"cdspell"
			"dirspell"
			"dotglob"
			"nocaseglob"
			"nocasematch"
		];
	};
}

