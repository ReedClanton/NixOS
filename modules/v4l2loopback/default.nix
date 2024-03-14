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
	};
}

