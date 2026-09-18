{ ... }: {
#  home.file."TODO" = {
#    source = builtins.fetchGit {
#      url = "https://github.com/ReedClanton/shell_base";
#      ref = "main";
#    };
#    # Includes all directories within the repository.
#    recursive = true;
#  };
}

