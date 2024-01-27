{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [ flatpak ];

	services.flatpak = {
		enable = true;
		packages = [
			"flathub:app/com.github.tchx84.Flatseal//stable"
			# Media tool(s).
			"flathub:app/io.github.nokse22.asciidraw//stable"
			"flathub:app/org.audacityteam.Audacity//stable"
			"flathub:app/org.blender.Blender//stable"
			"flathub:app/com.jgraph.drawio.desktop//stable"
#			"flathub:app/im.riot.Riot//stable"
			"flathub:app/org.freecadweb.FreeCAD//stable"
			"flathub:app/io.freetubeapp.FreeTube//stable"
			"flathub:app/org.gimp.GIMP//stable"
			"flathub:app/fr.romainvigier.MetadataCleaner//stable"
			"flathub:app/us.zoom.Zoom//stable"
			# System tool(s).
			"flathub:app/com.github.LongSoft.UEFITool//stable"
			# Text tool(s).
			"flathub:app/cc.arduino.arduinoide//stable"
			"flathub:app/cc.arduino.IDE2//stable"
			"flathub:app/org.libreoffice.LibreOffice//stable"
			"flathub:app/com.github.liferooter.textpieces//stable"
			# Web tool(s).
			"flathub:app/com.brave.Browser//stable"
			"flathub:app/org.telegram.desktop//stable"
			"flathub:app/com.github.micahflee.torbrowser-launcher//stable"
			"flathub:app/com.transmissionbt.Transmission//stable"
			"flathub:app/org.nickvision.tubeconverter//stable"
			# Game(s).
#			"flathub:app/com.mojang.Minecraft//stable"
			"flathub:app/com.valvesoftware.Steam//stable"
		];
		remotes = {
			"flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
			"flathub-beta" = "https://dl.flathub.org/beta-repo/flathub-beta.flatpakrepo";
		};
	};
}

