{ config, user, ... }: {
	programs.zsh = {
		enable = true;
		enableCompletion = user.shell.completion;
		autocd = true;
		dotDir = ".config/zsh";
		history = {
			# Adds time stamps.
			extended = true;
			ignoreAllDups = true;
			ignoreDups = true;
			ignorePatterns = user.shell.history.ignore;
			ignoreSpace = true;
			path = "${config.xdg.configHome}/zsh/history";
			save = user.shell.history.maxLineCount;
			# TODO: Determine what I want this to be.
			share = false;
			size = user.shell.history.maxLineCount;
		};
		historySubstringSearch.enable = true;
		initExtra = builtins.concatStringsSep "\n" [
			user.shell.shellRc
			''compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"''
		];
		loginExtra = ''
			autoload -Uz compinit && compinit
			zstyle ':completion:*' matcher-list ''' 'm:{a-zA-Z}={A-Za-z}'
		'';
		profileExtra = user.shell.shellProfile;
		syntaxHighlighting.enable = true;
	};
}

