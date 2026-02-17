{ lib, pkgs, user, ... }: {
	users.extraGroups.vboxuser.members = [ user.name ];

  # Note(s):
  #    - The package used when `virtualisation.vmware.host.enable` is set to `true` is no longer accessible at the URL
  #      that's used.
  #    - The best fix would be to create a Nix overlay for this option, or the `virtualisation.vmware.host.package`
  #      option. However, until I figure this out, this solution will have to do.
  #    - At time of writing, the latest version of the Linux kernel that's supported by VirtualBox is 6.19. Once this
  #      changes, the value of `boot.kernelPackages` and the package installed by `environment.systemPackages` bellow
  #      should be updated.
  boot.kernelPackages = pkgs.linuxPackages_6_18;
  environment.systemPackages = [
    pkgs.linuxKernel.packages.linux_6_18.vmware
  ];
  virtualisation = {
    vmware.host.enable = true;
    virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
    };
  };
}
