{ pkgs, ... }: {
  home.packages = with pkgs; [
    libmatroska
    mkvtoolnix-cli
  ];
}

