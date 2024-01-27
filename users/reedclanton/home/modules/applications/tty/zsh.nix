{ config, shell, ... }: {
	programs.zsh = {
		enable = true;
		enableCompletion = shell.completion;
		autocd = true;
		dotDir = ".config/zsh";
		history = {
			# Adds time stamps.
			extended = true;
			ignoreAllDups = true;
			ignoreDups = true;
			ignorePatterns = shell.history.ignore;
			ignoreSpace = true;
			path = "${config.xdg.configHome}/zsh/history";
			save = shell.history.maxLineCount;
			# TODO: Determine what I want this to be.
			share = false;
			size = shell.history.maxLineCount;
		};
		historySubstringSearch.enable = true;
		initExtra = builtins.concatStringsSep "\n" [
			shell.shellRc
			''compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"''
		];
		loginExtra = ''
			autoload -Uz compinit && compinit
			zstyle ':completion:*' matcher-list ''' 'm:{a-zA-Z}={A-Za-z}'
		'';
		profileExtra = shell.shellProfile;
		syntaxHighlighting.enable = true;
	};
}

