# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }: with lib.hm.gvariant; {
  dconf.settings = {
    "org/gnome/Console" = {
      audible-bell = false;
    };

    "org/gnome/TextEditor" = {
      highlight-current-line = true;
      show-line-numbers = true;
      show-map = true;
      style-scheme = "cobalt";
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "Utilities" "YaST" "Pardus" "a34bc971-3d63-4c9a-bf67-25b18f6c9f69" "0e6d9c41-2187-48d9-946a-fabdc2c7aaaf" "dcb71360-6f7a-4f50-982b-4a90b6109ec0" "8ad2500a-c38c-4574-99d9-94ddc25a258d" "e3b0e33f-4533-47ac-8e0b-a9d4c19aeae4" "754c665e-313f-4980-8b0b-23d76c530d8b" "a05e33c3-2ed0-4f27-85f7-59779ccdd078" "b28077c6-4406-47bb-9944-2f97dbb63baa" "a54951de-2c86-4c90-89cf-b1abbebf809d" ];
    };

    "org/gnome/desktop/app-folders/folders/0e6d9c41-2187-48d9-946a-fabdc2c7aaaf" = {
      apps = [ "btop.desktop" "org.corectrl.CoreCtrl.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.baobab.desktop" "org.gnome.font-viewer.desktop" "jstest-gtk.desktop" "org.gnome.Logs.desktop" "cups.desktop" "nixos-manual.desktop" "org.gnome.Settings.desktop" "org.gnome.Software.desktop" "org.gnome.SystemMonitor.desktop" "com.github.LongSoft.UEFITool.desktop" ];
      name = "Utilities-System";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/754c665e-313f-4980-8b0b-23d76c530d8b" = {
      apps = [ "virtualbox.desktop" "vmware-netcfg.desktop" "vmware-player.desktop" "vmware-workstation.desktop" ];
      name = "Virtualisation";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/8ad2500a-c38c-4574-99d9-94ddc25a258d" = {
      apps = [ "org.gnome.SimpleScan.desktop" "org.gnome.Papers.desktop" "org.libreoffice.LibreOffice.desktop" "org.libreoffice.LibreOffice.base.desktop" "org.libreoffice.LibreOffice.calc.desktop" "org.libreoffice.LibreOffice.draw.desktop" "org.libreoffice.LibreOffice.impress.desktop" "org.libreoffice.LibreOffice.math.desktop" "org.libreoffice.LibreOffice.writer.desktop" ];
      name = "Office";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/Pardus" = {
      categories = [ "X-Pardus-Apps" ];
      name = "X-Pardus-Apps.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "org.gnome.FileRoller.desktop" "org.gnome.Calculator.desktop" "org.gnome.Snapshot.desktop" "org.gnome.clocks.desktop" "org.gnome.Connections.desktop" "org.gnome.Contacts.desktop" "com.github.tchx84.Flatseal.desktop" "org.gnome.GHex.desktop" "fr.romainvigier.MetadataCleaner.desktop" "org.gnome.World.PikaBackup.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.World.Secrets.desktop" "org.gnome.Weather.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      excluded-apps = [ "org.gnome.font-viewer.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Logs.desktop" "org.gnome.baobab.desktop" "org.gnome.Evince.desktop" "org.gnome.Loupe.desktop" "org.gnome.Characters.desktop" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/a05e33c3-2ed0-4f27-85f7-59779ccdd078" = {
      apps = [ "org.blender.Blender.desktop" "com.jgraph.drawio.desktop.desktop" "org.freecad.FreeCAD.desktop" "org.gimp.GIMP.desktop" "org.gnome.Loupe.desktop" "org.kde.kdenlive.desktop" ];
      name = "Multi-Media";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/a34bc971-3d63-4c9a-bf67-25b18f6c9f69" = {
      apps = [ "ca.desrt.dconf-editor.desktop" "org.gnome.Extensions.desktop" "org.gnome.Yelp.desktop" "org.gnome.Tour.desktop" ];
      name = "Utilities-Gnome";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/a54951de-2c86-4c90-89cf-b1abbebf809d" = {
      apps = [ "org.audacityteam.Audacity.desktop" "org.gnome.Decibels.desktop" "droidcam.desktop" "org.mixxx.Mixxx.desktop" "com.obsproject.Studio.desktop" "org.rncbc.qpwgraph.desktop" "org.gnome.Showtime.desktop" "vlc.desktop" ];
      name = "Audio & Video";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/b28077c6-4406-47bb-9944-2f97dbb63baa" = {
      apps = [ "org.gnome.TwentyFortyEight.desktop" "org.wesnoth.Wesnoth.desktop" "com.mojang.Minecraft.desktop" "org.gnome.Mines.desktop" "io.github.berarma.Oversteer.desktop" "protonup-qt.desktop" ];
      name = "Games";
    };

    "org/gnome/desktop/app-folders/folders/dcb71360-6f7a-4f50-982b-4a90b6109ec0" = {
      apps = [ "org.gnome.gitlab.somas.Apostrophe.desktop" "arduino.desktop" "cc.arduino.arduinoide.desktop" "cc.arduino.IDE2.desktop" "io.github.nokse22.asciidraw.desktop" "org.gnome.Characters.desktop" "org.gnome.gedit.desktop" "nvim.desktop" "org.gnome.TextEditor.desktop" "com.github.liferooter.textpieces.desktop" "io.gitlab.liferooter.TextPieces.desktop" ];
      name = "Text";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/e3b0e33f-4533-47ac-8e0b-a9d4c19aeae4" = {
      apps = [ "com.brave.Browser.desktop" "io.freetubeapp.FreeTube.desktop" "org.nickvision.tubeconverter.desktop" "org.torproject.torbrowser-launcher.desktop" "org.torproject.torbrowser-launcher.settings.desktop" "com.transmissionbt.Transmission.desktop" "us.zoom.Zoom.desktop" ];
      name = "Internet";
    };

    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      clock-show-seconds = true;
      clock-show-weekday = true;
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
      show-battery-percentage = true;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = -0.88;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      speed = 0.242424;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/search-providers" = {
      enabled = [ "org.gnome.Weather.desktop" ];
      sort-order = [ "org.gnome.Settings.desktop" "org.gnome.Contacts.desktop" "org.gnome.Calculator.desktop" "org.gnome.Calendar.desktop" "org.gnome.Weather.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Software.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.clocks.desktop" "org.gnome.Characters.desktop" ];
    };

    "org/gnome/desktop/screensaver" = {
      lock-enabled = false;
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 900;
    };

    "org/gnome/desktop/sound" = {
      allow-volume-above-100-percent = true;
      event-sounds = false;
      input-feedback-sounds = false;
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-left = [ "<Control><Super>Left" ];
      switch-to-workspace-right = [ "<Control><Super>Right" ];
      switch-windows = [ "<Alt>Tab" ];
      switch-windows-backward = [ "<Shift><Alt>Tab" ];
    };

    "org/gnome/gedit/plugins" = {
      active-plugins = [ "quickhighlight" "docinfo" "modelines" "spell" "sort" "filebrowser" ];
    };

    "org/gnome/gedit/preferences/editor" = {
      display-right-margin = true;
      right-margin-position = mkUint32 120;
      scheme = "cobalt";
      tabs-size = mkUint32 4;
      wrap-last-split-mode = "word";
    };

    "org/gnome/gedit/preferences/ui" = {
      statusbar-visible = true;
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = false;
      edge-tiling = true;
      experimental-features = [ "scale-monitor-framebuffer" ];
      workspaces-only-on-primary = false;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "interactive";
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-timeout = 1800;
      sleep-inactive-battery-type = "poweroff";
    };

    "org/gnome/shell" = {
      favorite-apps = [ "firefox.desktop" "org.gnome.World.Secrets.desktop" "org.telegram.desktop.desktop" "slack.desktop" "discord.desktop" "element-desktop.desktop" "org.gnome.Console.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Calendar.desktop" "org.gnome.Geary.desktop" "com.valvesoftware.Steam.desktop" ];
      welcome-dialog-last-shown-version = "45.2";
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      show-hidden = true;
      sort-directories-first = true;
    };

    "org/gtk/settings/file-chooser" = {
      show-hidden = false;
      sort-directories-first = true;
    };
  };
}
