{ config, ui, ... }: {
  home.file = {
    "${config.xdg.configHome}/tmuxp/Default.yaml".source = (
      if "${ui}" == "tty" || "${ui}" == "hyprland" then
        ../../../../config/tmuxp/Default-tty.yaml
      else (
        if "${ui}" == "gnome" then
          ../../../../config/tmuxp/Default-gnome.yaml
        else (
          if "${ui}" == "kde" then
            ../../../../config/tmuxp/Default-kde.yaml
          else (
            if "${ui}" == "xfce" then
              ../../../../config/tmuxp/Default-xfce.yaml
            else
              ../../../../../../config/tmuxp/Default.yaml
          )
        )
      )
    );
    "${config.xdg.configHome}/tmuxp/NixOS.yaml".source = ../../../../../../config/tmuxp/NixOS.yaml;
    "${config.xdg.configHome}/tmuxp/Web.yaml".source = ../../../../../../config/tmuxp/Web.yaml;
  };
}

