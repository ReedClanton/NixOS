{ host, lib, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "hosts/${host}/modules/hardware/default.nix";
    # Used when no action needs to be taken.
    do-nothing = "./../../../../do-nothing.nix";
    # Tracks location of local/global bluetooth configuration.
    local-bluetooth-configuration = "./bluetooth/default.nix";
    global-bluetooth-configuration = "./../../../../modules/nixos/hardware/bluetooth/default.nix";
    # Tracks location of local/global drive configuration.
    local-drive-configuration = "./drive/default.nix";
    global-drive-configuration = "./../../../../modules/nixos/hardware/drive/default.nix";
    # Tracks location of local/global game controller configuration.
    local-game-controller-configuration = "./game-controller/default.nix";
    global-game-controller-configuration = "./../../../../modules/nixos/hardware/game-controller/default.nix";
    # Tracks location of local/global GPU configuration.
    local-gpu-configuration = "./gpu/default.nix";
    global-gpu-configuration = "./../../../../modules/nixos/hardware/gpu/default.nix";
    # Tracks location of local/global networking configuration.
    local-networking-configuration = "./networking/default.nix";
    global-networking-configuration = "./../../../../modules/nixos/hardware/networking/default.nix";
    # Tracks location of local/global power configuration.
    local-power-configuration = "./power/default.nix";
    global-power-configuration = "./../../../../modules/nixos/hardware/power/default.nix";
    # Tracks location of local/global printing configuration.
    local-printing-configuration = "./printing/default.nix";
    global-printing-configuration = "./../../../../modules/nixos/hardware/printing/default.nix";
    # Tracks location of local/global USB configuration.
    local-usb-configuration = "./usb/default.nix";
    global-usb-configuration = "./../../../../modules/nixos/hardware/usb/default.nix";
    # Tracks location of local/global v4l2loopback device configuration.
    local-v4l2loopback-configuration = "./v4l2loopback/default.nix";
    global-v4l2loopback-configuration = "./../../../../modules/nixos/hardware/v4l2loopback/default.nix";
  in [
    # Setup bluetooth.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${local-bluetooth-configuration}")) then
        ./. + (builtins.substring 1 9999 "${local-bluetooth-configuration}")
      else
        trivial.warn
          "${current-file-path}: Host machine '${host}' has no local bluetooth configuration (${local-bluetooth-configuration}), calling common module (${global-bluetooth-configuration})..."
          (
            if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-bluetooth-configuration}")) then
              ./. + (builtins.substring 1 9999 "${global-bluetooth-configuration}")
            else
              trivial.warn
                "${current-file-path}: Common bluetooth configuration file (${global-bluetooth-configuration}) and local configuration file (${local-bluetooth-configuration}) couldn't be found. Bluetooth will not be configured."
                ./. + (builtins.substring 1 9999 "${do-nothing}")
          )
    )
    # Setup drive(s).
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${local-drive-configuration}")) then
        ./. + (builtins.substring 1 9999 "${local-drive-configuration}")
      else
        trivial.warn
          "${current-file-path}: Host machine '${host}' has no local drive configuration (${local-drive-configuration}), calling common module (${global-drive-configuration})..."
          (
            if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-drive-configuration}")) then
              ./. + (builtins.substring 1 9999 "${global-drive-configuration}")
            else
              throw "${current-file-path}: Common drive configuration file (${global-drive-configuration}) and local configuration file (${local-drive-configuration}) couldn't be found. Drive configuration must exist for OS to be installed."
          )
    )
    # Setup game controller(s).
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${local-game-controller-configuration}")) then
        ./. + (builtins.substring 1 9999 "${local-game-controller-configuration}")
      else
        trivial.warn
          "${current-file-path}: Host machine '${host}' has no local game controller configuration (${local-game-controller-configuration}), calling common module (${global-game-controller-configuration})..."
          (
            if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-game-controller-configuration}")) then
              ./. + (builtins.substring 1 9999 "${global-game-controller-configuration}")
            else
              trivial.warn
                "${current-file-path}: Common game controller configuration file (${global-game-controller-configuration}) and local configuration file (${local-game-controller-configuration}) couldn't be found. No game controllers will not be configured."
                ./. + (builtins.substring 1 9999 "${do-nothing}")
          )
    )
    # Setup GPU.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${local-gpu-configuration}")) then
        ./. + (builtins.substring 1 9999 "${local-gpu-configuration}")
      else
        trivial.warn
          "${current-file-path}: Host machine '${host}' has no local GPU configuration (${local-gpu-configuration}), calling common module (${global-gpu-configuration})..."
          (
            if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-gpu-configuration}")) then
              ./. + (builtins.substring 1 9999 "${global-gpu-configuration}")
            else
              throw "${current-file-path}: Common GPU configuration file (${global-gpu-configuration}) and local configuration file (${local-gpu-configuration}) couldn't be found. GPU configuration must exist for OS to be installed."
          )
    )
    # Setup networking.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${local-networking-configuration}")) then
        ./. + (builtins.substring 1 9999 "${local-networking-configuration}")
      else
        trivial.warn
          "${current-file-path}: Host machine '${host}' has no local networking configuration (${local-networking-configuration}), calling common module (${global-networking-configuration})..."
          (
            if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-networking-configuration}")) then
              ./. + (builtins.substring 1 9999 "${global-networking-configuration}")
            else
              trivial.warn
                "${current-file-path}: Common networking configuration file (${global-networking-configuration}) and local configuration file (${local-networking-configuration}) couldn't be found. No networking will not be configured."
                ./. + (builtins.substring 1 9999 "${do-nothing}")
          )
    )
    # Setup power management.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${local-power-configuration}")) then
        ./. + (builtins.substring 1 9999 "${local-power-configuration}")
      else
        trivial.warn
          "${current-file-path}: Host machine '${host}' has no local power management configuration (${local-power-configuration}), calling common module (${global-power-configuration})..."
          (
            if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-power-configuration}")) then
              ./. + (builtins.substring 1 9999 "${global-power-configuration}")
            else
              trivial.warn
                "${current-file-path}: Common power management configuration file (${global-power-configuration}) and local configuration file (${local-power-configuration}) couldn't be found. No power management will not be configured."
                ./. + (builtins.substring 1 9999 "${do-nothing}")
          )
    )
    # Setup printing.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${local-printing-configuration}")) then
        ./. + (builtins.substring 1 9999 "${local-printing-configuration}")
      else
        trivial.warn
          "${current-file-path}: Host machine '${host}' has no local printing configuration (${local-printing-configuration}), calling common module (${global-printing-configuration})..."
          (
            if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-printing-configuration}")) then
              ./. + (builtins.substring 1 9999 "${global-printing-configuration}")
            else
              trivial.warn
                "${current-file-path}: Common networking configuration file (${global-printing-configuration}) and local configuration file (${local-printing-configuration}) couldn't be found. Printing will not be configured."
                ./. + (builtins.substring 1 9999 "${do-nothing}")
          )
    )
    # Setup USB.
    (
      if builtins.pathExists (./. + (builtins.substring 1 9999 "${local-usb-configuration}")) then
        ./. + (builtins.substring 1 9999 "${local-usb-configuration}")
      else
        trivial.warn
          "${current-file-path}: Host machine '${host}' has no local USB configuration (${local-usb-configuration}), calling common module (${global-usb-configuration})..."
          (
            if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-usb-configuration}")) then
              ./. + (builtins.substring 1 9999 "${global-usb-configuration}")
            else
              trivial.warn
                "${current-file-path}: Common USB configuration file (${global-usb-configuration}) and local configuration file (${local-usb-configuration}) couldn't be found. USB will not be configured."
                ./. + (builtins.substring 1 9999 "${do-nothing}")
          )
    )
    # Setup V4L2Loopback device.
#    (
#      if builtins.pathExists (./. + (builtins.substring 1 9999 "${local-v4l2loopback-configuration}")) then
#        ./. + (builtins.substring 1 9999 "${local-v4l2loopback-configuration}")
#      else
#        trivial.warn
#          "${current-file-path}: Host machine '${host}' has no local v4l2loopback configuration (${local-v4l2loopback-configuration}), calling common module (${global-v4l2loopback-configuration})..."
#          (
#            if builtins.pathExists (./. + (builtins.substring 1 9999 "${global-v4l2loopback-configuration}")) then
#              ./. + (builtins.substring 1 9999 "${global-v4l2loopback-configuration}")
#            else
#              trivial.warn
#                "${current-file-path}: Common v4l2loopback configuration file (${global-v4l2loopback-configuration}) and local configuration file (${local-v4l2loopback-configuration}) couldn't be found. v4l2loopback device will not be configured."
#                ./. + (builtins.substring 1 9999 "${do-nothing}")
#          )
#    )
  ];
}

