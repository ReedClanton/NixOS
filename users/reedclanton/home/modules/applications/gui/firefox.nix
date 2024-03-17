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
          # Switch <ctl> + <tab> from switching to the next tab to switching to the last used tab.
          "browser.ctrlTab.sortByRecentlyUsed" = true;
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
							urls = [{
								template = "https://flathub.org/apps/search";
								params = [{ name = "q"; value = "{searchTerms}"; }];
							}];
							iconUpdateURL = "https://flathub.org/favicon.png";
							updateInterval = 24 * 60 * 60 * 1000; # Update every day.
							definedAliases = [ "@fl" ];
						};
						"Home Manager Options" = {
							urls = [{
								template = "https://home-manager-options.extranix.com";
								params = [{ name = "query"; value = "{searchTerms}"; }];
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
							urls = [{
								template = "https://nixos.wiki/index.php";
								params = [{ name = "search"; value = "{searchTerms}"; }];
							}];
							iconUpdateURL = "https://nixos.wiki/favicon.png";
							updateInterval = 24 * 60 * 60 * 1000; # Update every day.
							definedAliases = [ "@nw" ];
						};
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
						"NixOS Wiki"
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

