{ lib, pkgs, user, ... }: {
	users.extraGroups.vboxuser.members = [ user.name ];

  # Note(s):
  #    - The package used when `virtualisation.vmware.host.enable` is set to `true` is no longer accessible at the URL
  #      that's used.
  #    - The best fix would be to create a Nix overlay for this option, or the `virtualisation.vmware.host.package`
  #      option. However, until I figure this out, this solution will have to do.
  #    - At time of writing, the latest version of the Linux kernel that's supported by VirtualBox is 6.8. Once this
  #      changes, the value of `boot.kernelPackages` and the package installed by `environment.systemPackages` bellow
  #      should be updated.
  boot.kernelPackages = pkgs.linuxPackages_6_8;
  environment.systemPackages = [
    pkgs.linuxKernel.packages.linux_6_8.vmware
  ];
  virtualisation.virtualbox.host = {
    enable = true;
    enableExtensionPack = true;
  };

  # WIP overlay.
#	virtualisation = {
#		vmware.host = {
#      enable = true;
#      package = (pkgs.vmware-workstation.overrideAttrs rec {
#        src = ./vmware.bundle;
#        unpackPhase = let
#          vmware-unpack-env = pkgs.buildFHSEnv rec {
#            name = "vmware-unpack-env";
#            targetPkgs = pkgs: [ pkgs.zlib ];
#          };
#        in ''
#          ${vmware-unpack-env}/bin/vmware-unpack-env -c "sh ${src} --extract unpacked"
#        '';
#      });
#    };
#		virtualbox.host = {
#			enable = true;
#			enableExtensionPack = true;
#		};
#	};

  # WIP overlay.
#  nixpkgs.overlays = [
#    (self: super: {
#      vmware-workstation = super.vmware-workstation.overrideAttrs (vself: vsuper:
#      let
#        urlBase = "https://softwareupdate.vmware.com/cds/vmw-desktop/ws/${vself.version}/${vself.build}/linux/";
#        file = "VMware-Workstation-${vself.version}-${vself.build}.x86_64.bundle";
#      in {
#        src = "${self.fetchzip {
#          url = urlBase + "core/${file}.tar";
#          hash = "sha256-4kA5zi9roCOHWSpHwEsRehzrlAgrm/lugSLpznPIYRw=";
#          stripRoot=false;
#        }}/${file}";
#        unpackPhase =
#        let
#          vmware-unpack-env = self.buildFHSEnv {
#            name = "vmware-unpack-env";
#            targetPkgs = pkgs: [ self.zlib ];
#          };
#          vmware-tools =
#          let
#            version = "17.5.1";
#            build = "23298084";
#            file = system: "vmware-tools-${system}-${version}-${build}.x86_64.component";
#            hashes = {
#              linux = "sha256-f+CjWSKVWem4pOK23hFnvcRzyYWa8kqqOfokglrIQRA=";
#              linuxPreGlibc25 = "sha256-Y6iJiydnOWX5Ud4AB1XAi3TMqHTwdYUdSuRUqVwS0D8=";
#              netware = "sha256-8kTuuGMwask84KL9zTF+3ZgmH5Ogc8QobUBdoZB4Y+E=";
#              solaris = "sha256-8EL0t5IgP2xj5rCeXqYjiIlIQwP2KAiL0PUd7tk4Jt0=";
#              winPre2k = "sha256-d9mRwGAIcYsGyEyL09BgQIBGoItK4EyT4QbMdKlf6oM=";
#              winPreVista = "sha256-OA5Vqwc8GJewutCz9bwnP/wuZA4SliMjDKPjhZQuqZY=";
#              windows = "sha256-mSwsECZq0wU7xXJhVZE67qw9HkxUrb1HQ6znjE93J5s=";
#            };
#            srcs = map (system:
#              "${self.fetchzip {
#                url = urlBase + "packages/${file system}.tar";
#                hash = hashes.${system};
#                stripRoot=false;
#              }}/${file system}"
#            ) (builtins.attrNames hashes);
#          in
#            lib.concatMapStringsSep " " (src: "--install-component ${src}") srcs;
#        in ''
#          ${vmware-unpack-env}/bin/vmware-unpack-env -c "sh ${vself.src} ${vmware-tools} --extract unpacked"
#        '';
#      });
#    })
#  ];
}
