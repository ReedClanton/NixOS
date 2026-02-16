{ config, ... }: {
	networking.wireless = {
    secretsFile = "/run/secrets/wireless.env";
		networks = {
			"private" = {
				priority = 500;
				psk = "ext:private_psk";
			};
     "iPhone 13 Pro" = {
        priority = 450;
        psk = "ext:iPhone_13_Pro_psk";
      };
			"private-2.4" = {
				priority = 400;
				psk = "ext:private_2_4_psk";
			};
      "UNIT 463" = {
        priority = 400;
        psk = "ext:unit_463";
      };
      "Pixel_1465" = {
        priority = 401;
        psk = "ext:pixel_1465";
      };
      "UNIT 242" = {
        priority = 400;
        psk = "ext:unit_242";
      };
      "SpectrumSetup-18" = {
        priority = 400;
        psk = "ext:spectrumsetup_18";
      };
      "GL-AXT1800-87c-5G" = {
        priority = 390;
        psk = "ext:gl_axt1800_87c_5g";
      };
      "New Image Guest" = {
        priority = 375;
        psk = "ext:new_image_guest";
      };
      "@Homegrown Free WiFi" = {
        priority = 375;
      };
      "The Russell Guest" = {
        priority = 375;
      };
      "AURUM LIVING" = {
        priority = 375;
        psk = "ext:aurum_living_psk";
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
        psk = "ext:spectrumsetup_33_psk";
      };
      "ConnectsWorkspace" = {
        priority = 350;
        psk = "ext:connectsworkspace_psk";
      };
      "Obi-WLAN Kenobi" = {
        priority = 350;
        psk = "ext:obi_wlan_kenobi_psk";
      };
			"Primary" = {
				priority = 350;
				psk = "ext:Primary_psk";
			};
      "Aurum Living" = {
        priority = 300;
        psk = "ext:aurum_living_psk";
      };
      "OYB Guest" = {
        priority = 300;
        psk = "ext:oyb_guest_psk";
      };
      "Incantation - Guest" = {
        priority = 300;
        psk = "ext:incantation_guest_psk";
      };
      "Movement Guest" = {
        priority = 300;
        psk = "ext:movement_guest_psk";
      };
      "MVM Guest" = {
        priority = 300;
        psk = "ext:mvm_guest_psk";
      };
			"Becks Coffee" = {
				priority = 300;
				psk = "ext:Becks_Coffee_psk";
			};
			"CaffeLuce5g" = {
				priority = 300;
				psk = "ext:CaffeLuce5g_psk";
			};
			"COLGuest" = {
				priority = 300;
				psk = "ext:COLGuest_psk";
			};
			"Copper_Kettle_Guest" = {
				priority = 300;
				psk = "ext:Copper_Kettle_Guest_psk";
			};
			"DBC Guest" = {
				priority = 300;
				psk = "ext:DBC_Guest_psk";
			};
			"HOME-D182" = {
				priority = 400;
				psk = "ext:HOME_D182_psk";
			};
			"Jade Mountain Guest" = {
				priority = 300;
				psk = "ext:Jade_Mountain_Guest_psk";
			};
			"LittleToadGuest" = {
				priority = 300;
				psk = "ext:LittleToadGuest_psk";
			};
			"MySpectrumWiFi76-2G" = {
				priority = 400;
				psk = "ext:MySpectrumWiFi76_2G_psk";
			};
			"Neds Public" = {
				priority = 300;
				psk = "ext:Neds_Public_psk";
			};
			"Sauls Guests" = {
				priority = 300;
				psk = "ext:Sauls_Guests_psk";
			};
			"Silke2" = {
				priority = 300;
				psk = "ext:Silke2_psk";
			};
			"Station 26 Guest" = {
				priority = 300;
				psk = "ext:Station_26_Guest_psk";
			};
			"The Frothy Cup-Guest" = {
				priority = 300;
				psk = "ext:The_Frothy_Cup_Guest_psk";
			};
			"thelaundryroom" = {
				priority = 300;
				psk = "ext:thelaundryroom_psk";
			};
			"JCPL-PUBLIC" = {
				priority = 200;
			};
		};
	};
}

