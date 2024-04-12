# Enables video and audio loopback device.

{ config, pkgs, ... }: {
	environment.systemPackages = with pkgs; [
    # Enables v4l2loopback GUI utilities.
		v4l-utils
	];

	boot = {
		# Make v4l2loopback kernel module available to NixOS.
		extraModulePackages = with config.boot.kernelPackages; [
			v4l2loopback
		];
		# Activate kernel module(s).
		kernelModules = [
			# Virtual camera.
			"v4l2loopback"
			# Virtual Microphone. Custom DroidCam v4l2loopback driver needed for audio.
#			"snd-aloop"
		];

    # Set initial kernel module settings.
    # Note(s):
    #   - Set video card number to 2 or higher to avoid conflicting with existing cameras.
    extraModprobeConfig = ''
      options v4l2loopback video_nr=3 exclusive_caps=1 card_label=v4l2loopback
    '';
	};
}

