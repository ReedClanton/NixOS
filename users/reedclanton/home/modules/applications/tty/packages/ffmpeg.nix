{ pkgs, ... }: {
  home.packages = with pkgs; [ ffmpeg_5-full ];
}

