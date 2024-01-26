{ config, pkgs, user, ... }: {
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
				bookmarks = [
					{
						name = "Bookmarks Toolbar";
						toolbar = true;
						bookmarks = [
							{
								name = "T-Mobile Router";
								url = "http://192.168.12.1/";
								tags = [ "t_mobile" "router" ];
							}
							{
								name = "Code";
								bookmarks = [
									{
										name = "POSIX_Shell";
										bookmarks = [
											{
												name = "Articles/Info";
												bookmarks = [
													{
														name = "rothgar/awesome-tuis";
														url = "https://github.com/rothgar/awesome-tuis";
														tags = [ "code" "posix" "shell" "article" "info" ];
													}
												];
											}
											{
												name = "Docs";
												bookmarks = [
													{
														name = "dodie/testing-in-bash";
														url = "https://github.com/dodie/testing-in-bash/";
														tags = [ "code" "posix" "shell" "unit" "test" "testing" ];
													}
													{
														name = "POSIX Extended Regex";
														url = "https://docs.thousandeyes.com/product-documentation/internet-and-wan-monitoring/tests/http-server-tests/posix-extended-regular-expression-syntax";
														tags = [ "code" "posix" "shell" "docs" "regex" ];
													}
													{
														name = "POSIX-Extended Regex";
														url = "https://en.wikibooks.org/wiki/Regular_Expressions/POSIX-Extended_Regular_Expressions";
														tags = [ "code" "posix" "shell" "docs" "regex" ];
													}
													{
														name = "Shell Comparison";
														url = "https://en.wikipedia.org/wiki/Comparison_of_command_shells";
														tags = [ "code" "posix" "shell" "docs" "comparison" ];
													}
													{
														name = "Base Specifications";
														url = "https://pubs.opengroup.org/onlinepubs/9699919799/";
														tags = [ "code" "posix" "shell" "docs" "ieee" ];
													}
													{
														name = "POSIX I/O Redirection";
														url = "https://www.ibm.com/docs/en/aix/7.1?topic=ks-input-output-redirection-in-korn-shell-posix-shell";
														tags = [ "code" "posix" "shell" "docs" "redirection" ];
													}
													{
														name = "Determine the Current Shell";
														url = "https://www.baeldung.com/linux/find-current-shell";
														tags = [ "code" "posix" "shell" "docs" "current" ];
													}
													{
														name = "Print to the Same Line";
														url = "https://www.baeldung.com/linux/echo-printf-overwrite-terminal-line";
														tags = [ "code" "posix" "shell" "docs" "print" "same" "line" ];
													}
													{
														name = "Catch Signls";
														url = "https://unix.stackexchange.com/questions/520035/exit-trap-with-posix";
														tags = [ "code" "posix" "shell" "docs" "trap catch signls" ];
													}
													{
														name = "String Manipulation";
														url = "https://www.geeksforgeeks.org/string-manipulation-in-shell-scripting/";
														tags = [ "code" "posix" "shell" "docs" "stirng" "manipulation" ];
													}
													{
														name = "styleguide";
														url = "https://google.github.io/styleguide/shellguide.html#s4-comments";
														tags = [ "code" "posix" "shell" "docs" "style" "guide" ];
													}
													{
														name = "Determine Shell";
														url = "https://unix.stackexchange.com/questions/9501/how-to-test-what-shell-i-am-using-in-a-terminal";
														tags = [ "code" "posix" "shell" "docs" "detemrine" ];
													}
													{
														name = "Special Characters (Control Characters)";
														url = "https://en.wikipedia.org/wiki/Control_character";
														tags = [ "code" "posix" "shell" "docs" "special" "chracters" "control" ];
													}
													{
														name = "Best Practices";
														url = "https://bertvv.github.io/cheat-sheets/Bash.html";
														tags = [ "code" "posix" "shell" "docs" "best" "practices" ];
													}
													{
														name = "Linux File Structure";
														url = "https://i.stack.imgur.com/BlpRb.png";
														tags = [ "code" "posix" "linux" "file" "structure" ];
													}
												];
											}
											{
												name = "Libraries";
												bookmarks = [
												];
											}
											{
												name = "Tools";
												bookmarks = [
													{
														name = "Twin-twinrc";
														url = "https://github.com/cosmos72/twin/blob/master/twinrc";
														tags = [ "code" "posix" "shell" "tool" "twin" ];
													}
													{
														name = "Tmux";
														url = "https://github.com/nordtheme/tmux";
														tags = [ "code" "posix" "shell" "tool" "tmux" ];
													}
													{
														name = "pgrange/bash_unit";
														url = "https://github.com/pgrange/bash_unit";
														tags = [ "code" "posix" "shell" "unit" "test" "testing" "library" ];
													}
													{
														name = "shellspec/shellspec";
														url = "https://github.com/shellspec/shellspec";
														tags = [ "code" "posix" "shell" "tool" "spec" "shellspec" ];
													}
												];
											}
										];
									}
									{
										name = "C++";
										bookmarks = [
											{
												name = "Docs";
												bookmarks = [
													{
														name = "Google C++ Style Guide";
														url = "https://google.github.io/styleguide/cppguide.html#General_Naming_Rules";
														tags = [ "code" "docs" "c++" "documentation" ];
													}
												];
											}
										];
									}
									{
										name = "Arduino";
										bookmarks = [
											{
												name = "Docs";
												bookmarks = [
													{
														name = "How to organize my Arduino projects' structure for easy source control? - Arduino Stack Exchange";
														url = "https://arduino.stackexchange.com/questions/348/how-to-organize-my-arduino-projects-structure-for-easy-source-control";
														tags = [ "code" "docs" "documentation" "arduino" ];
													}
												];
											}
										];
									}
									{
										name = "Mine";
										bookmarks = [
											{
												name = "ReedClanton/shell_base";
												url = "https://github.com/ReedClanton/shell_base";
												tags = [ "code" "shell" "mine" "repo" "base" ];
											}
											{
												name = "Coverage report";
												url = "file:///home/reedclanton/git/shell_base/coverage/index.html";
												tags = [ "code" "test" "coverage" "report" ];
											}
										];
									}
									{
										name = "GitHub Apps";
										bookmarks = [
											{
												name = "Epic Generator";
												url = "https://github.com/TimonVS/epic-generator";
												tags = [ "code" "github" "apps" "epic" "generator" ];
											}
										];
									}
									{
										name = "Web";
										bookmarks = [
											{
												name = "Tools";
												bookmarks = [
													{
														name = "CSS/HTML/XML/JavaScript/PHP/JSON Formatter";
														url = "https://webformatter.com/css";
														tags = [ "code" "tool" "html" "web" "formatter" "css" "xml" "javascript" "php" "json" ];
													}
													{
														name = "HTML Colors";
														url = "https://www.w3schools.com/colors/colors_names.asp";
														tags = [ "code" "tool" "html" "web" "color" ];
													}
													{
														name = "Tmux Cheat Sheet";
														url = "https://tmuxcheatsheet.com/";
														tags = [ "tool" "tmux" "cheat" "sheet" ];
													}
												];
											}
											{
												name = "HTML";
												bookmarks = [
													{
														name = "HTML - Named character references";
														url = "https://www.w3.org/TR/2011/WD-html5-20110525/named-character-references.html";
														tags = [ "code" "html" "character" ];
													}
													{
														name = "HTML Checker";
														url = "https://validator.w3.org/nu/#textarea";
														tags = [ "code" "html" "checker" "validator" ];
													}
												];
											}
										];
									}
								];
							}
							{
								name = "GHX-UltiPro";
								url = "https://ew21.ultipro.com/Login.aspx?ReturnUrl=%2f";
								tags = [ "ghx" "work" ];
							}
							{
								name = "Finance";
								bookmarks = [
									{
										name = "Rocky Mountain Reserve HSA";
										url = "https://rmrbenefits.wealthcareportal.com/Page/Dashboard";
										tags = [ "finance" "rocky" "mountain" "reserve" "hsa" "health" "savings" "account" ];
									}
									{
										name = "FCU/Bank/Credit";
										bookmarks = [
											{
												name = "AA FCU";
												url = "https://i-branch.aafcu.com/AirAcademyCUOnline/uux.aspx#/landingPage";
												tags = [ "finance" "aa" "fcu" "aafcu" "air" "academy" "federal" "credit" "union" ];
											}
											{
												name = "AMEX";
												url = "https://global.americanexpress.com/activity/recent";
												tags = [ "finance" "amex" ];
											}
											{
												name = "Chase";
												url = "https://secure25ea.chase.com/web/auth/dashboard#/dashboard/overviewAccounts/overview/multiCard";
												tags = [ "finance" "chase" ];
											}
											{
												name = "Discover";
												url = "https://card.discover.com/web/achome/homepage";
												tags = [ "finance" "discover" ];
											}
											{
												name = "Navy FCU";
												url = "https://myaccounts.navyfederal.org/NFCU/accounts/accountsummary";
												tags = [ "finance" "fcu" "federal" "credit" "union" "nfcu" "navy" ];
											}
											{
												name = "Space Age FCU";
												url = "https://olb.spaceagefcu.org/app/user/accounts";
												tags = [ "finance" "fcu" "federal" "credit" "union" "space" "age" "sa" "safcu" ];
											}
										];
									}
								];
							}
							{
								name = "Pinned";
								bookmarks = [
									{
										name = "5";
										url = "https://www.youtube.com/";
									}
								];
							}
							{
								name = "Tools";
								bookmarks = [
									{
										name = "Safing.io";
										url = "https://safing.io/";
										tags = [ "tool" "safing" "io" "foss" "privacy" ];
									}
									{
										name = "Home | endoflife.date";
										url = "https://endoflife.date/";
									}
									{
										name = "Text to ASCII Art Generator (TAAG)";
										url = "http://www.patorjk.com/software/taag/#p=display";
										tags = [ "generator" "tool" "ascii" "art" "text" ];
									}
								];
							}
							{
								name = "localhost:5000";
								url = "http://localhost:5000/";
								tags = [ "local" ];
							}
							{
								name = "NixOS Tabs";
								bookmarks = [
									{
										name = "NixOS 23.05 manual | Nix & NixOS";
										url = "https://nixos.org/manual/nixos/stable/";
										tags = [ "nixos" ];
									}
									{
										name = "NixOS Search";
										url = "https://search.nixos.org/packages?channel=unstable&show=tmuxPlugins.sidebar&from=0&size=50&sort=alpha_asc&type=packages&query=tmuxPlugins";
										tags = [ "nixos" ];
									}
									{
										name = "Configuration Collection";
										url = "https://nixos.wiki/wiki/Configuration_Collection";
									}
									{
										name = "Home Manager Manual";
										url = "https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone";
									}
									{
										name = "Home Manager - Configuration Options (Appendix A)";
										url = "https://nix-community.github.io/home-manager/options.xhtml";
									}
									{
										name = "Vimjoyer - YouTube";
										url = "https://www.youtube.com/@vimjoyer/videos";
									}
									{
										name = "Nix home-manager tutorial: Declare your entire home directory - YouTube";
										url = "https://www.youtube.com/watch?v=FcC2dzecovw";
									}
									{
										name = "Extending NixOS Configurations";
										url = "https://hoverbear.org/blog/extending-nixos-configurations/";
									}
									{
										name = "Declarative GNOME configuration with NixOS";
										url = "https://hoverbear.org/blog/declarative-gnome-configuration-in-nixos/";
									}
									{
										name = "neoclide/coc.nvim: Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers.";
										url = "https://github.com/neoclide/coc.nvim";
									}
									{
										name = "nix-community/nixvim: Configure Neovim with Nix! [maintainer=@pta2002, @traxys, @GaetanLepage]";
										url = "https://github.com/nix-community/nixvim";
									}
									{
										name = "tmux-python/tmuxp: 🖥️ tmux session manager. built on libtmux";
										url = "https://github.com/tmux-python/tmuxp";
									}
									{
										name = "Error: reading symbolic link '/nix/var/nix/profiles/per-user/root/channels/': No such file or directory - Help - NixOS Discourse";
										url = "https://discourse.nixos.org/t/error-reading-symbolic-link-nix-var-nix-profiles-per-user-root-channels-no-such-file-or-directory/34838";
									}
									{
										name = "(4) NixOS Config - Autologin - Flatpak - Fonts - Polkit - Release Upgrade - YouTube";
										url = "https://www.youtube.com/watch?v=IRRtk320j2A";
									}
									{
										name = "Is it possible to configure flatpaks with home-manager? : r/NixOS";
										url = "https://www.reddit.com/r/NixOS/comments/14uj2b6/is_it_possible_to_configure_flatpaks_with/";
										tags = [ "nixos" "flatpak" ];
									}
									{
										name = "Install on Linux - Safing Docs";
										url = "https://docs.safing.io/portmaster/install/linux#manual-install-and-launching";
									}
									{
										name = "My E-Mail configuration: Nix & Home-Manager, Notmuch & mbsync - beb.ninja";
										url = "https://beb.ninja/post/email/";
									}
									{
										name = "gauteh/lieer: Fast email-fetching and sending and two-way tag synchronization between notmuch and GMail";
										url = "https://github.com/gauteh/lieer";
									}
									{
										name = "gauteh/lieer: Fast email-fetching and sending and two-way tag synchronization between notmuch and GMail";
										url = "https://github.com/gauteh/lieer/";
									}
									{
										name = "getting-started";
										url = "https://notmuchmail.org/getting-started/";
									}
								];
							}
							{
								name = "Workout";
								bookmarks = [
									{
										name = "Routine (Scroll to Pure Strength)";
										url = "https://www.hybridcalisthenics.com/programs";
										tags = [ "workout" "strength" "routine" ];
									}
									{
										name = "Exercises";
										bookmarks = [
											{
												name = "Pushups";
												url = "https://www.hybridcalisthenics.com/advanced-incline-pushups";
												tags = [ "workout" "pushup" "pushups" ];
											}
											{
												name = "Leg Raises (Move on to L-Sit)";
												url = "https://www.hybridcalisthenics.com/alternating-leg-raises";
												tags = [ "workout" "leg" "raise" "exercise" ];
											}
											{
												name = "L-Sit";
												url = "https://www.youtube.com/watch?v=wuDgmAr2ez8";
												tags = [ "workout" "monday" "l-sit" "l" "sit" ];
											}
											{
												name = "Squats";
												url = "https://www.hybridcalisthenics.com/assisted-squats";
												tags = [ "workout" "squats" "exercise" "squat" ];
											}
											{
												name = "Pullups";
												url = "https://www.hybridcalisthenics.com/horizontal-pullups";
												tags = [ "workout" "pullup" "exercise" "pullups" ];
											}
											{
												name = "Bridges";
												url = "https://www.hybridcalisthenics.com/straight-bridges";
												tags = [ "workout" "bridges" "exercise" "bridge" ];
											}
											{
												name = "Clutch Flags";
												url = "https://www.hybridcalisthenics.com/clutchflags";
												tags = [ "workout" "clutch" "flags" "exercise" "flag" ];
											}
											{
												name = "Twists";
												url = "https://www.hybridcalisthenics.com/straight-leg-twists";
												tags = [ "workout" "exercise" "twist" "twists" ];
											}
										];
									}
								];
							}
						];
					}
				];
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
#					"dom.security.https_only_mode_ever_enabled_pbm" = true;
#					"dom.security.https_only_mode_pbm" = true;
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

