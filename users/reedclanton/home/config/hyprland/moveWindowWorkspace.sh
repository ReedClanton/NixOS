activeWorkspace="$(hyprctl activeworkspace -j | jq '.id')"

# Current window in the 1st workspace.
if [ "$activeWorkspace" -ge "1" ] && [ "$activeWorkspace" -le "4" ]; then
	# Determine what workspace caller would like to move to.
	if [ "$1" -eq "1" ]; then
		echo $activeWorkspace
	elif [ "$1" -eq "2" ]; then
		echo $(($activeWorkspace + 4))
	elif [ "$1" -eq "3" ]; then
		echo $(($activeWorkspace + 8))
	elif [ "$1" -eq "4" ]; then
		echo $(($activeWorkspace + 12))
	elif [ "$1" -eq "5" ]; then
		echo $(($activeWorkspace + 16))
	elif [ "$1" -eq "6" ]; then
		echo $(($activeWorkspace + 20))
	elif [ "$1" -eq "7" ]; then
		echo $(($activeWorkspace + 24))
	fi
# Current window in the 2nd workspace.
elif [ "$activeWorkspace" -ge "5" ] && [ "$activeWorkspace" -le "8" ]; then
	# Determine what workspace caller would like to move to.
	if [ "$1" -eq "1" ]; then
		echo $(($activeWorkspace - 4))
	elif [ "$1" -eq "2" ]; then
		echo $activeWorkspace
	elif [ "$1" -eq "3" ]; then
		echo $(($activeWorkspace + 4))
	elif [ "$1" -eq "4" ]; then
		echo $(($activeWorkspace + 8))
	elif [ "$1" -eq "5" ]; then
		echo $(($activeWorkspace + 12))
	elif [ "$1" -eq "6" ]; then
		echo $(($activeWorkspace + 16))
	elif [ "$1" -eq "7" ]; then
		echo $(($activeWorkspace + 20))
	fi
# Current window in the 3rd workspace.
elif [ "$activeWorkspace" -ge "9" ] && [ "$activeWorkspace" -le "12" ]; then
	# Determine what workspace caller would like to move to.
	if [ "$1" -eq "1" ]; then
		echo $(($activeWorkspace - 8))
	elif [ "$1" -eq "2" ]; then
		echo $(($activeWorkspace - 4))
	elif [ "$1" -eq "3" ]; then
		echo $activeWorkspace
	elif [ "$1" -eq "4" ]; then
		echo $(($activeWorkspace + 4))
	elif [ "$1" -eq "5" ]; then
		echo $(($activeWorkspace + 8))
	elif [ "$1" -eq "6" ]; then
		echo $(($activeWorkspace + 12))
	elif [ "$1" -eq "7" ]; then
		echo $(($activeWorkspace + 16))
	fi
# Current window in the 4th workspace.
elif [ "$activeWorkspace" -ge "13" ] && [ "$activeWorkspace" -le "16" ]; then
	# Determine what workspace caller would like to move to.
	if [ "$1" -eq "1" ]; then
		echo $(($activeWorkspace - 12))
	elif [ "$1" -eq "2" ]; then
		echo $(($activeWorkspace - 8))
	elif [ "$1" -eq "3" ]; then
		echo $(($activeWorkspace - 4))
	elif [ "$1" -eq "4" ]; then
		echo $activeWorkspace
	elif [ "$1" -eq "5" ]; then
		echo $(($activeWorkspace + 4))
	elif [ "$1" -eq "6" ]; then
		echo $(($activeWorkspace + 8))
	elif [ "$1" -eq "7" ]; then
		echo $(($activeWorkspace + 12))
	fi
# Current window in the 5th workspace.
elif [ "$activeWorkspace" -ge "17" ] && [ "$activeWorkspace" -le "20" ]; then
	# Determine what workspace caller would like to move to.
	if [ "$1" -eq "1" ]; then
		echo $(($activeWorkspace - 16))
	elif [ "$1" -eq "2" ]; then
		echo $(($activeWorkspace - 12))
	elif [ "$1" -eq "3" ]; then
		echo $(($activeWorkspace - 8))
	elif [ "$1" -eq "4" ]; then
		echo $(($activeWorkspace - 4))
	elif [ "$1" -eq "5" ]; then
		echo $activeWorkspace
	elif [ "$1" -eq "6" ]; then
		echo $(($activeWorkspace + 4))
	elif [ "$1" -eq "7" ]; then
		echo $(($activeWorkspace + 8))
	fi
# Current window in the 6th workspace.
elif [ "$activeWorkspace" -ge "21" ] && [ "$activeWorkspace" -le "24" ]; then
	# Determine what workspace caller would like to move to.
	if [ "$1" -eq "1" ]; then
		echo $(($activeWorkspace - 20))
	elif [ "$1" -eq "2" ]; then
		echo $(($activeWorkspace - 16))
	elif [ "$1" -eq "3" ]; then
		echo $(($activeWorkspace - 12))
	elif [ "$1" -eq "4" ]; then
		echo $(($activeWorkspace - 8))
	elif [ "$1" -eq "5" ]; then
		echo $(($activeWorkspace - 4))
	elif [ "$1" -eq "6" ]; then
		echo $activeWorkspace
	elif [ "$1" -eq "7" ]; then
		echo $(($activeWorkspace + 4))
	fi
# Current window in the 7th workspace.
elif [ "$activeWorkspace" -ge "25" ] && [ "$activeWorkspace" -le "28" ]; then
	# Determine what workspace caller would like to move to.
	if [ "$1" -eq "1" ]; then
		echo $(($activeWorkspace - 24))
	elif [ "$1" -eq "2" ]; then
		echo $(($activeWorkspace - 20))
	elif [ "$1" -eq "3" ]; then
		echo $(($activeWorkspace - 16))
	elif [ "$1" -eq "4" ]; then
		echo $(($activeWorkspace - 12))
	elif [ "$1" -eq "5" ]; then
		echo $(($activeWorkspace - 8))
	elif [ "$1" -eq "6" ]; then
		echo $(($activeWorkspace - 4))
	elif [ "$1" -eq "7" ]; then
		echo $activeWorkspace
	fi
fi
