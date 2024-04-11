{ user, ... }: {
  programs = {
    atuin = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      settings = {
        # Configures something to do with date/time. Other option is 'us'.
        dialect = "uk";
        # Immediately run command when 'enter' is pressed.
        enter_accept = true;
        # Revert any changes made via Atuin when 'esc' key is pressed.
        exit_mode = "return-original";
        # When searching, search through everything, not just session history.
        filter_mode = "global";
        # Only show session history when up key is pressed.
        filter_mode_shell_up_key_binding = "session";
        # Loop through terminal ignore list and anchor each to start of line.
        history_filter = map (cmd: "^${cmd}") user.shell.history.ignore;
        search_mode = "fuzzy";
        # Determine if full command is shown at bottom of Atuin. Not really needed and kinda a wast of space.
        show_preview = true;
        # Updating is handled by Nix.
        update_check = false;
        # Only show history from current git repo when in a git repo. Turned off (don't like).
        workspaces = false;
      };
    };
    bash.initExtra = builtins.concatStringsSep "\n" [
      user.shell.shellRc
      # Bind 'ctrl' + r to bring up Atuin's search.
      ''bind -x '"\C-r": __atuin_history' ''
    ];
    zsh.initExtra = builtins.concatStringsSep "\n" [
      user.shell.shellRc
      # Bind 'ctrl' + r to bring up Atuin's search.
      "bindkey '^r' atuin-search"
    ];
  };
}

