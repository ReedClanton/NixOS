{ host, lib, ... }: with lib; {
  imports =
  let
    # Used in log/warning/error messages.
    current-file-path = "hosts/${host}/modules/hardware/drive/default.nix";
  in [
    # NoOp: Not implemented.
  ];
}

