# This installs a bunch of fetch applications. It's just for fun.
{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
    # Shows country info (Rust).
    countryfetch
    # Shows CPU info (C).
    cpufetch
    # Shows GPU info (C++).
    gpufetch
    # Shows git repository info (Rust).
    onefetch
    # Shows RAM info (Shell).
    ramfetch
  ];
}

