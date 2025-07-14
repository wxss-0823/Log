NEO_ESC=`echo -ne "\033"`
COMMAND_CACHE=(cmd Ethernet a 192.168.10.123)

# Default parameter
name="Ethernet"
addr="127.0.0.1"
mask="255.255.255.0"
gateway=""
workMode="a"
command=""
cmdCacheIndex=0

# Print Preview Information
cat <<- EOF
===================================
Automatically IP added Script 
===================================
EOF
echo 'Print "help" for more information.'

# Main Loop
while true
do
	read -p "Script> " command

	# Exit Main Loop
	if [ "$command" == "q" ]
	then
		echo "Exit auto config IP script."
		break
	fi
	
	# Print Help Information
	# if echo "$command" | grep -qwi "help"
	if [ "$command" == "help" ]
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
	    Subnet Mask : [0~255].[0~255].[0~255].[0~255]
	    Gateway     : [0~255].[0~255].[0~255].[0~255]
		
	Lite Mode:
	    Enter "lite" to entry Lite Mode.
	    Command will use default parameters.
	    Only need to enter Work Mode & IPv4 address.
	e.g. 
	    cmd Ethernet a 127.0.0.1 255.255.255.0
	EOF
	command=""
	continue
	fi
	
	# Command String Process
	operationArray=(${command})
	arrayLen=${#operationArray[@]}
	
	# Lite Mode
	if [ "${operationArray[0]}" == "lite" ]
	then
		echo "Please Enter Work Mode & IPv4 Address."
		
		# Lite Mode Main Loop
		while true
		do
			read -p "LiteMode> " liteCmd
			liteOperationArray=(${liteCmd})
			liteArrayLen=${#liteOperationArray[@]}
			if [ $liteArrayLen == 1 ]
			then
				case ${liteOperationArray[0]} in
					"help")
						cat <<- EOF
						cmd [name] [work mode] [addr] *[mask] *[gateway] 

						Required parameter:
							Work mode	: Add[a], Delete[d] or Set[s]
							IP address	: Ethernet IPv4
						Optional parameter: 
							Subnet Mask : [0~255].[0~255].[0~255].[0~255]
							Gateway     : [0~255].[0~255].[0~255].[0~255]
							
						Lite Mode:
							Enter "lite" to entry Lite Mode.
							Command will use default parameters.
							Only need to enter Work Mode & IPv4 address.
						e.g. 
							cmd Ethernet a 127.0.0.1 255.255.255.0
						EOF
						liteCmd=""
						continue
						;;
					"q")
						echo "Exit lite mode."
						break
						;;
					*)
						echo "Please Enter Correct Control Command."
						echo '"help" or "q"'
						liteCmd=""
						continue
				esac
			elif [ $liteArrayLen == 2 ]
			then
				workMode=${liteOperationArray[0]}
				addr=${liteOperationArray[1]}
				
				liteGeneralCmd="netsh interface ipv4 mode address Ethernet $addr"
				case $workMode in
					"a")
						liteCmd=${liteGeneralCmd/mode/add}
						workInfo="Added"
						;;
					"d")
						liteCmd=${liteGeneralCmd/mode/delete}
						workInfo="Deleted"
						;;
					*)
						echo "Please check the work mode format."
				esac
			elif [ $liteArrayLen == 0 ]
			then
				continue
			else
				echo -e "Please Enter Correct Command Format.\n[work mode] [IPv4 address]"
			fi
			
			# Regular Expression Match IP address
			IPpattern="^([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])$"
		
			# Check IPv4 Address & Subnet Mask Format
			if ! [[ "$addr" =~ $IPpattern ]]
			then
				echo "Please check IPv4 address format: $addr =~ [0~255].[0~255].[0~255].[0~255]"
				liteCmd=""
				continue
			fi
		
			# Execute the Command
			result=`$liteCmd`
			if [ "$result" == "" ]
			then
				echo "IP Address $workInfo Successfully!"
				liteCmd=""
			else
				echo -e "Ternimal Info: $result\nCommand: $MSCmd"
			fi

		done
		liteCmd=""
		continue
	elif [ $arrayLen -lt 4 -a $arrayLen -gt 0 ]
	then
		echo "Make sure to enter all the required parameter."
		command=""
		continue
	elif [ $arrayLen == 0 ]
	then
		continue
	elif [ "${operationArray[0]}" == "cmd" ]
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
	MSGeneralCmd="netsh interface ipv4 mode address $name"
	MSCmdSuffix=" $addr $mask $gateway"
	SetMode=" staic"
	case $workMode in
		"a")
			MSCmd=${MSGeneralCmd/mode/add}$MSCmdSuffix
			workInfo="Added"
			;;
		"d")
			MSCmd=${MSGeneralCmd/mode/delete}$MSCmdSuffix
			workInfo="Deleted"
			;;
		"s")
			MSCmd=${MSGeneralCmd/mode/set}$SetMode$MSCmdSuffix
			workInfo="Set"
			;;
		*)
			echo -e "Please input correct work mode prompt.\nWork mode: Add[a], Delete[d] or Set[s]"
			command=""
			continue
	esac
	
	# Regular Expression Match IP address
	IPpattern="^([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])$"
	
	# Check IPv4 Address & Subnet Mask Format
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
	result=`$MSCmd`
	if [ "$result" == "" ]
	then
		echo "IP Address $workInfo Successfully!"
		command=""
	else
		echo -e "Ternimal Info: $result\nCommand: $MSCmd"
	fi

done