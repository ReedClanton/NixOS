{ config, ... }: {
  home.file = {
    "${config.xdg.configHome}/tmuxp/Default.yaml".text = ''
      session_name: Default
      start_directory: "~"
      windows:
        - window_name: Home
          focus: true
          layout: 39e3,158x35,0,0[158x10,0,0,1,158x24,0,11{94x24,0,11,2,63x24,95,11,3}]
          panes:
            - focus: true
              shell_command:
                - clear;neofetch;pwd;ls -GAp
            - suppress_history: true
              shell_command:
                - btop
            - suppress_history: true
              environment:
                WEATHER_SHORT_WAIT: "30"
                WEATHER_LONG_WAIT: "900"
              shell_command:
                - weather() { clear; curl -s "https://wttr.in/Dallas?1Fnuq"; sleep $1; }
                - sleep 1
                - weather $WEATHER_SHORT_WAIT
                - weather $WEATHER_SHORT_WAIT
                - while true; do ping -c 1 -W .5 wttr.in 2>&1 >/dev/null; if [ "$?" -eq "0" ]; then weather $WEATHER_LONG_WAIT; else echo "wttr not connected, waiting '$WEATHER_SHORT_WAIT'..."; sleep $WEATHER_SHORT_WAIT; fi; done
        - window_name: Home-2
          shell_command_before:
            - clear;pwd;ls -GAp
        - window_name: Home-3
          shell_command_before:
            - clear;pwd;ls -GAp
        - window_name: Home-4
          shell_command_before:
            - clear;pwd;ls -GAp
        - window_name: Home-5
          shell_command_before:
            - clear;pwd;ls -GAp
        - window_name: Home-6
          shell_command_before:
            - clear;pwd;ls -GAp
        - window_name: Home-7
          shell_command_before:
            - clear;pwd;ls -GAp
        - window_name: Home-8
          shell_command_before:
            - clear;pwd;ls -GAp
        - window_name: Home-9
          shell_command_before:
            - clear;pwd;ls -GAp
        - window_name: Tasks
          suppress_history: true
          shell_command_before:
            - clear;pwd;ls -GAp;vit
    '';
    "${config.xdg.configHome}/tmuxp/NixOS.yaml".source = ../../../../../config/tmuxp/NixOS.yaml;
    "${config.xdg.configHome}/tmuxp/Web.yaml".source = ../../../../../config/tmuxp/Web.yaml;
  };
}

