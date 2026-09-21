{ ... }:
let
  # Pinned snapshot of the shell_base repo. Flakes evaluate in pure mode, so `fetchGit` must be
  # given a `rev`; without one the build fails. To pull in newer changes, update `rev`.
  shellFunctions = builtins.fetchGit {
    url = "https://github.com/ReedClanton/shell-functions";
    ref = "main";
    # Get the latest with:
    #   git ls-remote https://github.com/ReedClanton/shell-functions main
    rev = "3797319eecd13daf49ea017ca3bd87d2176e9255";
  };
in {
  # Recursively links the contents of shell-functions into ~/.config/shell-functions/.
  xdg.configFile."shell-functions" = {
    source = "${shellFunctions}";
    # Links each file individually instead of linking the whole directory.
    recursive = true;
  };
}
