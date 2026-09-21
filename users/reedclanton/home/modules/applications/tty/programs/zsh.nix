{ config, lib, user, ... }: with lib; {
	programs.zsh = {
		enable = true;
		enableCompletion = user.shell.completion;
		autocd = true;
    # This controls the *directory* that the z shell looks for configuration in.
    dotDir = "${config.xdg.configHome}/zsh";
		history = {
			# Adds time stamps.
			extended = true;
			ignoreAllDups = true;
			ignoreDups = true;
			ignorePatterns = user.shell.history.ignore;
			ignoreSpace = true;
			path = "${config.xdg.configHome}/zsh/history";
			save = user.shell.history.maxLineCount;
			share = false;
			size = user.shell.history.maxLineCount;
		};
		historySubstringSearch.enable = true;
    # The number passed to `lib.mkOrder` controls at what point the code is run:
    # - 500 (mkBefore):
    #   - Early initialization.
    #   - Replaces initExtraFirst option.
    # - 550:
    #   - Before completion initialization.
    #   - Replaces initExtraBeforeCompInit option.
    # - 1000 (default):
    #   - General configuration.
    #   - Replaces initExtra.
    # - 1500 (mkAfter):
    #   - Last to run configuration
    initContent =
    let
      zshConfigEarlyInit = mkOrder 500 ''
        ################################
        ## Stage: Early Initialization ##
        ################################
        # Control where zsh dump file(s) are written to.
        compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
      '';
      zshConfig = mkOrder 1000 user.shell.shellProfile;
      zshConfigLastInit = mkOrder 1500 user.shell.shellRc;
    in mkMerge [ zshConfigEarlyInit zshConfig zshConfigLastInit ];
		loginExtra = ''
      autoload -Uz compinit && compinit
      zstyle ':completion:*' matcher-list ''' 'm:{a-zA-Z}={A-Za-z}'
    '';
		syntaxHighlighting.enable = true;
	};
}

