{ pkgs, user, ... }: {
  environment.systemPackages = with pkgs; [
    arduino
    # Arduino CI/CD tool.
    arduino-ci
    arduino-cli
    arduino-mk
    # Tool that uploads programs to an Arduino over a network.
    arduinoOTA
  ];

  users.users."${user.name}".extraGroups = [ "dialout" ];
}
