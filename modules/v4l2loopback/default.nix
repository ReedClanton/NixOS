# Enables video and audio loopback device.

{ config, ... }: {
	boot = {
		# Make v4l2loopback kernel module avilable to NixOS.
		extraModulePackages = with config.boot.kernelPackages; [
			v4l2loopback.out
		];
		# Activate kernel modules.
		kernelModules = [
			# Virtual camera.
			"v4l2loopback"
			# Virtual Microphone, built-in.
			"snd-aloop"
		];
		# Set initial kernel module settings.
		extraModprobeConfig = ''
			options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"
		'';
	};
}
