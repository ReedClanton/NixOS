{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
    # Open GL GPU benchmarking tool.
    glmark2
    # System benchmarking tool (CPU, filesystem level disk I/O, RAM, database, thread-based scheduler, POSIX mutex).
    sysbench
  ];
}

