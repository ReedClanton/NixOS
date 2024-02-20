{ pkgs, ... }: {
  hardware.firmware = [
    (
      let
        driverFile1 = builtins.fetchurl "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin";
        driverFile2 = builtins.fetchurl "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin";
      in
      pkgs.runCommandNoCC "mt7961" { } ''
        mkdir -p $out/lib/firmware/mediatek
        cp "${driverFile1}" $out/lib/firmware/mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin
        cp "${driverFile2}" $out/lib/firmware/mediatek/WIFI_RAM_CODE_MT7961_1.bin
      ''
    )
  ];
}

