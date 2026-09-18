{ ... }:
let
  # Pinned snapshot of the shell_base repo. Flakes evaluate in pure mode, so `fetchGit` must be
  # given a `rev`; without one the build fails. To pull in newer changes, update `rev`.
  shellBase = builtins.fetchGit {
    url = "https://github.com/ReedClanton/shell_base";
    ref = "main";
    # Get the latest with:
    #   git ls-remote https://github.com/ReedClanton/shell_base main
    rev = "e2b1e800c16f8b9a68c30cfbe8a7ad5b00e652c9";
  };
in {
  # Recursively links the contents of shell_base/src/shell/ into ~/.config/zsh/.
  xdg.configFile."shell" = {
    source = "${shellBase}/src/shell";
    # Links each file individually instead of linking the whole directory.
    recursive = true;
  };
}
