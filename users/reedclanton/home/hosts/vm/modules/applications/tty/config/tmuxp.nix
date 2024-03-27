{ config, ... }: {
  home.file = {
    "${config.xdg.configHome}/tmuxp/Default.yaml".source = ../../../../config/tmuxp/Default.yaml;
    "${config.xdg.configHome}/tmuxp/NixOS.yaml".source = ../../../../../../config/tmuxp/NixOS.yaml;
    "${config.xdg.configHome}/tmuxp/Web.yaml".source = ../../../../../../config/tmuxp/Web.yaml;
  };
}

