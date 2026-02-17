{ config, ... }: {
	networking.wireless = {
    secretsFile = "/run/secrets/wireless.conf";
		networks = {
     "iPhone 13 Pro" = {
        priority = 500;
        pskRaw = "ext:iPhone_13_Pro_psk";
      };
      "Pixel_1465" = {
        priority = 450;
        pskRaw = "ext:pixel_1465_psk";
      };
			"private" = {
				priority = 401;
				pskRaw = "ext:private_psk";
			};
			"private-2.4" = {
				priority = 400;
				pskRaw = "ext:private_2_4_psk";
			};
      "UNIT 463" = {
        priority = 400;
        pskRaw = "ext:unit_463_psk";
      };
      "UNIT 242" = {
        priority = 400;
        pskRaw = "ext:unit_242_psk";
      };
      "SpectrumSetup-18" = {
        priority = 400;
        pskRaw = "ext:spectrumsetup_18_psk";
      };
      "GL-AXT1800-87c-5G" = {
        priority = 390;
        pskRaw = "ext:gl_axt1800_87c_5g_psk";
      };
      "New Image Guest" = {
        priority = 375;
        pskRaw = "ext:new_image_guest_psk";
      };
      "@Homegrown Free WiFi" = {
        priority = 375;
      };
      "The Russell Guest" = {
        priority = 375;
      };
      "AURUM LIVING" = {
        priority = 375;
        pskRaw = "ext:aurum_living_psk";
      };
      "Tavern242_Guest" = {
        priority = 375;
      };
      "@Bangers" = {
        priority = 350;
      };
      "IHGWiFi.com" = {
        priority = 350;
      };
      "aainflight.com" = {
        priority = 350;
      };
      "Origin_Guest" = {
        priority = 350;
      };
      "SpectrumSetup-33" = {
        priority = 350;
        pskRaw = "ext:spectrumsetup_33_psk";
      };
      "ConnectsWorkspace" = {
        priority = 350;
        pskRaw = "ext:connectsworkspace_psk";
      };
      "Obi-WLAN Kenobi" = {
        priority = 350;
        pskRaw = "ext:obi_wlan_kenobi_psk";
      };
			"Primary" = {
				priority = 350;
				pskRaw = "ext:Primary_psk";
			};
      "OYB Guest" = {
        priority = 300;
        pskRaw = "ext:oyb_guest_psk";
      };
      "Incantation - Guest" = {
        priority = 300;
        pskRaw = "ext:incantation_guest_psk";
      };
      "Movement Guest" = {
        priority = 300;
        pskRaw = "ext:movement_guest_psk";
      };
      "MVM Guest" = {
        priority = 300;
        pskRaw = "ext:mvm_guest_psk";
      };
			"Becks Coffee" = {
				priority = 300;
				pskRaw = "ext:Becks_Coffee_psk";
			};
			"CaffeLuce5g" = {
				priority = 300;
				pskRaw = "ext:CaffeLuce5g_psk";
			};
			"COLGuest" = {
				priority = 300;
				pskRaw = "ext:COLGuest_psk";
			};
			"Copper_Kettle_Guest" = {
				priority = 300;
				pskRaw = "ext:Copper_Kettle_Guest_psk";
			};
			"DBC Guest" = {
				priority = 300;
				pskRaw = "ext:DBC_Guest_psk";
			};
			"HOME-D182" = {
				priority = 400;
				pskRaw = "ext:HOME_D182_psk";
			};
			"Jade Mountain Guest" = {
				priority = 300;
				pskRaw = "ext:Jade_Mountain_Guest_psk";
			};
			"LittleToadGuest" = {
				priority = 300;
				pskRaw = "ext:LittleToadGuest_psk";
			};
			"MySpectrumWiFi76-2G" = {
				priority = 400;
				pskRaw = "ext:MySpectrumWiFi76_2G_psk";
			};
			"Neds Public" = {
				priority = 300;
				pskRaw = "ext:Neds_Public_psk";
			};
			"Sauls Guests" = {
				priority = 300;
				pskRaw = "ext:Sauls_Guests_psk";
			};
			"Silke2" = {
				priority = 300;
				pskRaw = "ext:Silke2_psk";
			};
			"Station 26 Guest" = {
				priority = 300;
				pskRaw = "ext:Station_26_Guest_psk";
			};
			"The Frothy Cup-Guest" = {
				priority = 300;
				pskRaw = "ext:The_Frothy_Cup_Guest_psk";
			};
			"thelaundryroom" = {
				priority = 300;
				pskRaw = "ext:thelaundryroom_psk";
			};
			"JCPL-PUBLIC" = {
				priority = 200;
			};
		};
	};
}

