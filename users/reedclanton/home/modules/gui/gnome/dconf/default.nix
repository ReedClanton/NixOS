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

#    "org/gnome/clocks" = {
#      world-clocks = [
#        { location = mkVariant [ (mkUint32 2) (mkVariant [ "Denver" "KBKF" true [ (mkTuple [ 0.6930702459669482 (-1.8283729951886007) ]) ] [ (mkTuple [ 0.6935790792570746 (-1.8323287315783685) ]) ] ]) ]; }
#        { location = mkVariant [ (mkUint32 2) (mkVariant [ "Dallas" "KDAL" true [ (mkTuple [ 0.5733842925114371 (-1.690448351049749) ]) ] [ (mkTuple [ 0.5721722660656822 (-1.6895950770317414) ]) ] ]) ]; }
#      ];
#    };
    
    "org/gnome/desktop/app-folders" = {
      folder-children = [ "Utilities" "YaST" "Pardus" "a34bc971-3d63-4c9a-bf67-25b18f6c9f69" "0e6d9c41-2187-48d9-946a-fabdc2c7aaaf" "dcb71360-6f7a-4f50-982b-4a90b6109ec0" "8ad2500a-c38c-4574-99d9-94ddc25a258d" "e3b0e33f-4533-47ac-8e0b-a9d4c19aeae4" "754c665e-313f-4980-8b0b-23d76c530d8b" "a05e33c3-2ed0-4f27-85f7-59779ccdd078" "b28077c6-4406-47bb-9944-2f97dbb63baa" "a54951de-2c86-4c90-89cf-b1abbebf809d" ];
    };

    "org/gnome/desktop/app-folders/folders/0e6d9c41-2187-48d9-946a-fabdc2c7aaaf" = {
      apps = [ "btop.desktop" "org.corectrl.corectrl.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.baobab.desktop" "org.gnome.font-viewer.desktop" "jstest-gtk.desktop" "org.gnome.Logs.desktop" "cups.desktop" "nixos-manual.desktop" "org.berarma.Oversteer.desktop" "org.gnome.Settings.desktop" "org.gnome.Software.desktop" "gnome-system-monitor.desktop" "com.github.LongSoft.UEFITool.desktop" ];
      name = "Utilities-System";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/754c665e-313f-4980-8b0b-23d76c530d8b" = {
      apps = [ "virtualbox.desktop" "vmware-netcfg.desktop" "vmware-player.desktop" "vmware-workstation.desktop" ];
      name = "Virtualisation";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/8ad2500a-c38c-4574-99d9-94ddc25a258d" = {
      apps = [ "simple-scan.desktop" "org.gnome.Evince.desktop" "org.libreoffice.LibreOffice.desktop" "org.libreoffice.LibreOffice.base.desktop" "org.libreoffice.LibreOffice.calc.desktop" "org.libreoffice.LibreOffice.draw.desktop" "org.libreoffice.LibreOffice.impress.desktop" "org.libreoffice.LibreOffice.math.desktop" "org.libreoffice.LibreOffice.writer.desktop" ];
      name = "Office";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/Pardus" = {
      categories = [ "X-Pardus-Apps" ];
      name = "X-Pardus-Apps.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "org.gnome.FileRoller.desktop" "org.gnome.Calculator.desktop" "org.gnome.Snapshot.desktop" "org.gnome.clocks.desktop" "org.gnome.Connections.desktop" "org.gnome.Contacts.desktop" "com.github.tchx84.Flatseal.desktop" "fr.romainvigier.MetadataCleaner.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.World.PikaBackup.desktop" "org.gnome.Weather.desktop" ];
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
      apps = [ "org.blender.Blender.desktop" "com.jgraph.drawio.desktop.desktop" "org.freecadweb.FreeCAD.desktop" "org.gimp.GIMP.desktop" "org.gnome.Loupe.desktop" ];
      name = "Multi-Media";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/a34bc971-3d63-4c9a-bf67-25b18f6c9f69" = {
      apps = [ "ca.desrt.dconf-editor.desktop" "org.gnome.Extensions.desktop" "yelp.desktop" "org.gnome.Tour.desktop" ];
      name = "Utilities-Gnome";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/a54951de-2c86-4c90-89cf-b1abbebf809d" = {
      apps = [ "org.audacityteam.Audacity.desktop" "droidcam.desktop" "org.mixxx.Mixxx.desktop" "com.obsproject.Studio.desktop" "org.rncbc.qpwgraph.desktop" "qv4l2.desktop" "qvidcap.desktop" "vlc.desktop" ];
      name = "Audio & Video";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/b28077c6-4406-47bb-9944-2f97dbb63baa" = {
      apps = [ "org.gnome.TwentyFortyEight.desktop" "org.wesnoth.Wesnoth.desktop" "com.mojang.Minecraft.desktop" "org.gnome.Mines.desktop" "protonup-qt.desktop" "com-valvesoftware-steam" ];
      name = "Games";
    };

    "org/gnome/desktop/app-folders/folders/dcb71360-6f7a-4f50-982b-4a90b6109ec0" = {
      apps = [ "org.gnome.gitlab.somas.Apostrophe.desktop" "arduino.desktop" "cc.arduino.arduinoide.desktop" "cc.arduino.IDE2.desktop" "io.github.nokse22.asciidraw.desktop" "org.gnome.Characters.desktop" "org.gnome.gedit.desktop" "nvim.desktop" "org.gnome.TextEditor.desktop" "com.github.liferooter.textpieces.desktop" ];
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

    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = true;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = -0.8;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      speed = 0.24242424242424243;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/privacy" = {
      old-files-age = mkUint32 30;
      recent-files-max-age = -1;
      remove-old-temp-files = true;
    };

    "org/gnome/desktop/search-providers" = {
      enabled = [ "org.gnome.Weather.desktop" ];
#      sort-order = [ "org.gnome.Settings.desktop" "org.gnome.Documents.desktop" "org.gnome.Contacts.desktop" "org.gnome.Calculator.desktop" "org.gnome.Calendar.desktop" "org.gnome.Weather.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Software.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.clocks.desktop" "org.gnome.Characters.desktop" ];
      sort-order = [ "org.gnome.Settings.desktop" "org.gnome.Contacts.desktop" "org.gnome.Calculator.desktop" "org.gnome.Calendar.desktop" "org.gnome.Weather.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Software.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.clocks.desktop" "org.gnome.Characters.desktop" ];
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 900;
    };

    "org/gnome/desktop/sound" = {
      allow-volume-above-100-percent = true;
      event-sounds = false;
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-applications = [];
      switch-applications-backward = [];
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
      edge-tiling = true;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
    };

    # Disable the Insert key.
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "Insert";
      command = ":";
      name = "DisableInsertKey";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      ambient-enabled = false;
      power-button-action = "interactive";
      power-saver-profile-on-low-battery = true;
      sleep-inactive-ac-timeout = 1800;
	    sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-timeout = 1200;
    };

    "org/gnome/shell" = {
      favorite-apps = [ "firefox.desktop" "org.telegram.desktop.desktop" "element-desktop.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Console.desktop" "org.gnome.Calendar.desktop" "org.gnome.Geary.desktop" "com.valvesoftware.Steam.desktop" ];
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };

#    "org/gnome/shell/world-clocks" = {
#      locations = [
#        (mkVariant [ (mkUint32 2) (mkVariant [ "Denver" "KBKF" true [ (mkTuple [ 0.6930702459669482 (-1.8283729951886007) ]) ] [ (mkTuple [ 0.6935790792570746 (-1.8323287315783685) ]) ] ]) ])
#        (mkVariant [ (mkUint32 2) (mkVariant [ "Dallas" "KDAL" true [ (mkTuple [ 0.5733842925114371 (-1.690448351049749) ]) ] [ (mkTuple [ 0.5721722660656822 (-1.6895950770317414) ]) ] ]) ])
#      ];
#    };

    "org/gtk/gtk4/settings/file-chooser" = {
      show-hidden = true;
      sort-directories-first = true;
    };

    "org/gtk/settings/file-chooser" = {
      clock-format = "12h";
	    show-hidden = false;
	    sort-directories-first = true;
    };
  };
}

