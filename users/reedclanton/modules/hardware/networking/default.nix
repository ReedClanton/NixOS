{ config, ... }: {
	networking.wireless = {
		environmentFile = config.sops.secrets."wireless.env".path;
		networks = {
			"private" = {
				priority = 500;
				psk = "@private_psk@";
			};
     "iPhone 13 Pro" = {
        priority = 450;
        psk = "@iPhone_13_Pro_psk@";
      };
			"private-2.4" = {
				priority = 400;
				psk = "@private_2_4_psk@";
			};
      "UNIT 463" = {
        priority = 400;
        psk = "@unit_463@";
      };
      "UNIT 242" = {
        priority = 400;
        psk = "@unit_242@";
      };
      "AURUM LIVING" = {
        priority = 375;
        psk = "@aurum_living_psk@";
      };
      "aainflight.com" = {
        priority = 350;
      };
      "Origin_Guest" = {
        priority = 350;
      };
      "SpectrumSetup-33" = {
        priority = 350;
        psk = "@spectrumsetup_33_psk@";
      };
      "ConnectsWorkspace" = {
        priority = 350;
        psk = "@connectsworkspace_psk@";
      };
      "Obi-WLAN Kenobi" = {
        priority = 350;
        psk = "@obi_wlan_kenobi_psk@";
      };
			"Primary" = {
				priority = 350;
				psk = "@Primary_psk@";
			};
      "Aurum Living" = {
        priority = 300;
        psk = "@aurum_living_psk@";
      };
      "OYB Guest" = {
        priority = 300;
        psk = "@oyb_guest_psk@";
      };
      "Incantation - Guest" = {
        priority = 300;
        psk = "@incantation_guest_psk@";
      };
      "Movement Guest" = {
        priority = 300;
        psk = "@movement_guest_psk@";
      };
      "MVM Guest" = {
        priority = 300;
        psk = "@mvm_guest_psk@";
      };
			"Becks Coffee" = {
				priority = 300;
				psk = "@Becks_Coffee_psk@";
			};
			"CaffeLuce5g" = {
				priority = 300;
				psk = "@CaffeLuce5g_psk@";
			};
			"COLGuest" = {
				priority = 300;
				psk = "@COLGuest_psk@";
			};
			"Copper_Kettle_Guest" = {
				priority = 300;
				psk = "@Copper_Kettle_Guest_psk@";
			};
			"DBC Guest" = {
				priority = 300;
				psk = "@DBC_Guest_psk@";
			};
			"HOME-D182" = {
				priority = 400;
				psk = "@HOME_D182_psk@";
			};
			"Jade Mountain Guest" = {
				priority = 300;
				psk = "@Jade_Mountain_Guest_psk@";
			};
			"LittleToadGuest" = {
				priority = 300;
				psk = "@LittleToadGuest_psk@";
			};
			"MySpectrumWiFi76-2G" = {
				priority = 400;
				psk = "@MySpectrumWiFi76_2G_psk@";
			};
			"Neds Public" = {
				priority = 300;
				psk = "@Neds_Public_psk@";
			};
			"Sauls Guests" = {
				priority = 300;
				psk = "@Sauls_Guests_psk@";
			};
			"Silke2" = {
				priority = 300;
				psk = "@Silke2_psk@";
			};
			"Station 26 Guest" = {
				priority = 300;
				psk = "@Station_26_Guest_psk@";
			};
			"The Frothy Cup-Guest" = {
				priority = 300;
				psk = "@The_Frothy_Cup_Guest_psk@";
			};
			"thelaundryroom" = {
				priority = 300;
				psk = "@thelaundryroom_psk@";
			};
			"JCPL-PUBLIC" = {
				priority = 200;
			};
		};
	};
}

