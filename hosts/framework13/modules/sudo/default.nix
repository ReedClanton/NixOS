{ user, ... }: {
	imports = [
		../../../../modules/sudo
	];

	security.sudo.extraRules = [{
		users = [ user.name ];
		commands = [
			{
				command = "/run/current-system/sw/bin/brightnessctl set 100%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 99%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 98%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 97%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 96%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 95%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 94%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 93%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 92%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 91%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 90%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 89%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 88%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 87%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 86%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 85%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 84%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 83%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 82%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 81%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 80%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 79%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 78%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 77%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 76%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 75%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 74%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 73%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 72%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 71%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 70%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 69%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 68%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 67%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 66%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 65%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 64%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 63%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 62%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 61%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 60%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 59%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 58%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 57%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 56%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 55%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 54%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 53%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 52%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 51%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 50%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 49%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 48%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 47%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 46%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 45%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 44%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 43%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 42%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 41%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 40%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 39%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 38%";
				options = [ "NOPASSWD" ];
			}	
			{
				command = "/run/current-system/sw/bin/brightnessctl set 37%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 36%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 35%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 34%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 33%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 32%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 31%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 30%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 29%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 28%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 27%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 26%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 25%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 24%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 23%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 22%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 21%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 20%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 19%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 18%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 17%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 16%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 15%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 14%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 13%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 12%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 11%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 10%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 9%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 8%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 7%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 6%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 5%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 4%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 3%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 2%";
				options = [ "NOPASSWD" ];
			}
			{
				command = "/run/current-system/sw/bin/brightnessctl set 1%";
				options = [ "NOPASSWD" ];
			}
		];
	}];
}

