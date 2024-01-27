{ pkgs, user, ... }: {
	programs.firefox = {
		enable = true;
		# TODO: Test this by disabling it while in gnome and seeing if anything changes.
		package = pkgs.firefox.override {
			# See nixpkgs' firefox/wrapper.nix to check which options you can use
			cfg = {
				# Gnome shell native connector
				enableGnomeExtensions = true;
			};
		};
		profiles = {
			"${user.name}" = {
				bookmarks = import ../../../config/firefox/bookmarks.nix;
				settings = {
					# Turn off data collection.
					"app.shield.optoutstudies.enabled" = false;
					"browser.aboutConfig.showWarning" = false;
					# Ask where to download files.
					"browser.download.useDownloadDir" = false;
					# Remove adds from new tab page.
					"browser.newtabpage.activity-stream.showSponsored" = false;
					# Continue session on re-launch.
					"browser.startup.page" = 3;
					# Turn off search bar data collection.
					"browser.urlbar.quicksuggest.dataCollection.enabled" = false;
					# Turn off search bar adds.
					"browser.urlbar.suggest.quicksuggest.sponsored" = false;
					# Don't warn when quitting with ctrl + q.
					"browser.warnOnQuitShortcut" = false;
					# HTTPS only in private browsing.
					"dom.security.https_only_mode_ever_enabled_pbm" = true;
					"dom.security.https_only_mode_pbm" = true;
					# Highlight all matching search term(s).
					"findbar.highlightAll" = true;
					"media.autoplay.default" = 5;
					"privacy.donottrackheader.enabled" = true;
				};
				id = 0;
				isDefault = true;
				search = {
					default = "Google";
					engines = {
						"Flathub" = {
							urls = [{ template = "https://flathub.org/apps/search?q={searchTerms}"; }];
							iconUpdateURL = "https://flathub.org/_next/static/media/flathub-logo-toolbar.d9915edb.svg";
							updateInterval = 24 * 60 * 60 * 1000; # Update every day.
							defineAliases = [ "@fl" ];
						};
						"Home Manager Options" = {
							urls = [{
								template = "https://mipmip.github.io/home-manager-option-search";
								params = [ { name = "query"; value = "{searchTerms}"; } ];
							}];
							iconUpdateURL = "https://avatars.githubusercontent.com/u/33221035";
							updateInterval = 24 * 60 * 60 *1000; # Update every day.
							definedAliases = [ "@hm" ];
						};
						"Nix Packages" = {
							urls = [{
								template = "https://search.nixos.org/packages";
								params = [
									{ name = "type"; value = "packages"; }
									{ name = "query"; value = "{searchTerms}"; }
								];
							}];
							icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
							definedAliases = [ "@np" ];
						};
						"Nix Options" = {
							urls = [{
								template = "https://search.nixos.org/options";
								params = [
									{ name = "type"; value = "packages"; }
									{ name = "query"; value = "{searchTerms}"; }
								];
							}];
							icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
							definedAliases = [ "@no" ];
						};
						"NixOS Wiki" = {
							urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
							iconUpdateURL = "https://nixos.wiki/favicon.png";
							updateInterval = 24 * 60 * 60 * 1000; # Update every day.
							defineAliases = [ "@nw" ];
						};
						"Google".metaData.alias = "@g";
					};
					force = true;
					order = [
						"Google"
						"Nix Packages"
						"Nix Options"
						"Nix Wiki"
						"Home Manager Options"
						"Flathub"
						"DuckDuckGo"
					];
					privateDefault = "DuckDuckGo";
				};
				settings = {
					"browser.startup.homepage" = "https://www.google.com";
				};
			};
		};
	};
}
