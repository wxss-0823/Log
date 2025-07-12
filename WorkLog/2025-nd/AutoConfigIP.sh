NEO_ESC=`echo -ne "\033"`
COMMAND_CACHE=(cmd 本地连接 a 192.168.10.123)

# Default parameter
name="Local Connection"
addr="127.0.0.1"
mask="255.255.255.0"
gateway=""
workMode="n"
cmdPrefix="Script> "
command=""
printPrefixCmd="read -p "$cmdPrefix" command"
cmdCacheIndex=0

# Print Preview Information
cat <<- EOF
===================================
Automatically IP added Script 
===================================
EOF
echo "Print "help" for more information."

# Main Loop
while true
do
	$printPrefixCmd
	
	# Catch Arrow Keys
	# Up	: ^[[A 	Down	: ^[[B
	# Right	: ^^[C 	Left	: ^[[D

	# read -s -n 1 key
	# if [[ $key == ${NEO_ESC} ]]; then
		# read -sn 2 SubListDo
		# case "$SubListDo" in
		   # "[A")
				# cmdCacheIndex=$(($cmdCacheIndex+1 % ${#COMMAND_CACHE[@]}))
				# echo -n "${COMMAND_CACHE[$cmdCacheIndex]}"
				# command=${COMMAND_CACHE[$cmdCacheIndex]}
				# ;;
		   # "[B")
				# echo "向下"
				# ;;
		   # "[C")
				# echo "向右"
				# ;;
		   # "[D")
				# echo "向左"
				# ;;
		   # *)
			   # exit
		# esac
	# fi
	
	
	
	# Exit Main Loop
	if [ "$command" == "q" ]
	then
		echo "exit"
		break
	fi
	
	# Print Help Information
	if echo "$command" | grep -qwi "help"
	# -q: silence mode; If successful, $? return 0
	# -w: match string; Ignore case
	# -i: match by word
	then
	cat <<- EOF
	cmd [name] [work mode] [addr] *[mask] *[gateway] 

	Required parameter:
	    Work mode	: Add[a], Delete[d] or Set[s]
	    IP address	: Ethernet IPv4
	Optional parameter: 
	    Mask address: [0~255].[0~255].[0~255].[0~255]
	    Gateway		: [0~255].[0~255].[0~255].[0~255]
	e.g. 
	cmd 本地连接 a 192.168.10.123 255.255.255.0 192.168.10.1
	EOF
	command=""
	continue
	fi
	
	# Command String Process
	operationArray=(${command})
	arrayLen=${#operationArray[@]}
	if [ $arrayLen -lt 4 -a $arrayLen -gt 0 ]
	then
		echo "Make sure to enter all the required parameter."
		command=""
		continue
	elif [ $arrayLen == 0 ]
	then
		continue
	elif [ ${operationArray[0]} == "cmd" ]
	then
		name=${operationArray[1]}
		workMode=${operationArray[2]}
		addr=${operationArray[3]}
		mask=${operationArray[4]}
		gateway=${operationArray[5]}
	else
		echo -e "Please input correct command format.\ncmd [name] [work mode] [addr] *[mask] *[gateway]"
		command=""
		continue
	fi
	
	# Check Work Mode Input Format
	MSGeneralCmd="netsh interface ipv4 mode address $name static $addr $mask $gateway"
	case $workMode in
		"a")
			MSCmd=${MSGeneralCmd/mode/add}
			;;
		"d")
			MSCmd=${MSGeneralCmd/[mode]/delete}
			;;
		"s")
			MSCmd=${MSGeneralCmd/[mode]/set}
			;;
		*)
			echo -e "Please input correct work mode prompt.\nWork mode: Add[a], Delete[d] or Set[s]"
			command=""
			continue
	esac
	
	# Regular Expression Match IP address
	IPpattern="^([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])$"
	
	# Check IPv4 Address & Mask Format
	if ! [[ "$addr" =~ $IPpattern ]]
	then
		echo "Please check IPv4 address format: $addr =~ [0~255].[0~255].[0~255].[0~255]"
		command=""
		continue
	fi
	if [ "$mask" != "" ]
	then
		if ! [[ "$mask" =~ $IPpattern ]]
		then
			echo "Please check IPv4 mask format: $mask =~ [0~255].[0~255].[0~255].[0~255]"
			command=""
			continue
		fi
	fi
	
	# Check Gateway format
	if [ "$gateway" != "" ]
	then
		if ! [[ "$gateway" =~ $IPpattern ]]
		then
			echo "Please check Gateway format: $gateway =~ [0~255].[0~255].[0~255].[0~255]"
			command=""
			continue
		fi
	fi
	
	# Execute the Command
	$MSCmd
	
	echo -e "Script Run Successfully!\nCommand: $MSCmd"
	command=""
done