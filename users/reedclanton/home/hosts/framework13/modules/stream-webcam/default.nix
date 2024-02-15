{ pkgs, ... }: {
  home.packages = with pkgs; [
    ffmpeg
    libmatroska
    v4l-utils
  ];
}

