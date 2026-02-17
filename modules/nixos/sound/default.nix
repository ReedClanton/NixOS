{ lib, pkgs, user, ... }:
let
  # Patch out microphone boost. Done when boost defaults to on and breaks microphone.
  # See: https://community.frame.work/t/microphone-extremely-staticy/15533/12
  pkgPatchedWithMicBoostDisabled = pkgs.pipewire.overrideAttrs (og-pkg: {
    name = "${og-pkg.pname}-patched-with-mic-boost-disabled";
    # Instead of overriding some post-build action, which would require a
    # rebuild of the package, we override the entire `buildCommand` to
    # produce its outputs by copying the original package's files.
    # This is much faster.
    buildCommand = ''
      set -euo pipefail
      
      # Copy original files, for each split-output (`out`, `dev` etc.).
      # TODO: Remove hard coded refrence to pipewire so this function will
      #   work with any package.
      ${
        lib.concatStringsSep "\n"
          (map
            (outputName:
              ''
                echo "Copying output ${outputName}"
                set -x
                cp -a ${pkgs.pipewire.${outputName}} ''$${outputName}
                set +x
              ''
            )
            og-pkg.outputs
          )
      }
      
      # Replace:
      #     [Element (Internal|Int) Mic Boost]
      #     required-any = any
      #     switch = select
      #     volume = merge
      # with:
      #     [Element (Internal|Int) Mic Boost]
      #     required-any = any
      #     switch = select
      #     volume = 0
      # The target file `analog-input-internal-mic.conf` should be determined
      # by the output of `pacmd list-sources` for the relevant microphone `index:`,
      # which for my microphone is:
      #     active port: <analog-input-internal-mic>
      set -x
      INFILE=$out/share/alsa-card-profile/mixer/paths/analog-input-internal-mic.conf
      cat $INFILE | \
        ${pkgs.python3}/bin/python -c \
          'import re,sys; print(re.sub("\[Element Internal Mic Boost\]\nrequired-any = any\nswitch = select\nvolume = merge", "[Element Internal Mic Boost]\nrequired-any = any\nswitch = select\nvolume = zero", sys.stdin.read()))' | \
            ${pkgs.python3}/bin/python -c \
              'import re,sys; print(re.sub("\[Element Int Mic Boost\]\nrequired-any = any\nswitch = select\nvolume = merge", "[Element Int Mic Boost]\nrequired-any = any\nswitch = select\nvolume = zero", sys.stdin.read()))' > \
                tmp.conf
      # Ensure file changed (something was replaced)
      ! cmp tmp.conf $INFILE
      chmod +w $out/share/alsa-card-profile/mixer/paths/analog-input-internal-mic.conf
      cp tmp.conf $INFILE
      set +x
    '';
  });
in {
  # Alsa terminal utilities.
  environment.systemPackages = with pkgs; [ alsa-utils ];

  users.users.${user.name}.extraGroups = [ "audio" ];

  # RealtimeKit priority scheduling for audio.
	security.rtkit.enable = true;
	services = {
    # Use Pipewire.
    pipewire = {
      audio.enable = true;
		  enable = true;
		  alsa = {
			  enable = true;
			  support32Bit = true;
		  };
#      package = pkgPatchedWithMicBoostDisabled;
      # Enable PulseAudio server emulation.
		  pulse.enable = true;
		  jack.enable = true;
    };
	};
}

