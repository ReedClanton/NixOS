{ ... }: {
  programs.eza = {
    enable = true;
    git = true;
    # TODO (issue #34): Figure out why icons are broken.
    icons = "never";
  };
}

