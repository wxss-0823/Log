function PrintTitleInfo() {
	# Print Preview Information
	cat <<- EOF
	===================================
	Automatically IP added Script 
	===================================
	EOF
	echo 'Print "help" for more information.'
}

function PrintHelpInfo() {
	# Print help info
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
}

function IPPatternCheck() {
	# First parameter is IP
	# Second parameter is pattern
	if ! [[ "$1" =~ $2 ]]; then
		echo "Please check IPv4 address format: $1 =~ [0~255].[0~255].[0~255].[0~255]"
		return 1
	fi
	return 0
}

function ExecuteCmd() {
	# First parameter is command string
	returnInfo=`$*`
	if [ "$returnInfo" == "" ]; then
		echo "IP Address $addr is $workInfo Successfully!"
	else
		echo -e "Ternimal Info: $returnInfo\nCommand: $*"
	fi
}

function LiteModeMainLoop() {
	# Lite Mode Main Loop
	while true
	do
		read -p "LiteMode> " liteCmd
		liteOperationArray=(${liteCmd})
		liteArrayLen=${#liteOperationArray[@]}
		
		# Input Message Process
		case $liteArrayLen in
			# Pass
			0)
				continue
				;;
			# Help or Quit
			1)
				case ${liteOperationArray[0]} in
					# Lite Mode Print Help Info
					"help")
						PrintHelpInfo
						liteCmd=""
						continue
						;;
					# Exit Lite Mode Main Loop
					"q")
						echo "Exit lite mode."
						break
						;;
					# Error Handle
					*)
						echo "Please Enter Correct Control Command."
						echo '"help" or "q"'
						liteCmd=""
						continue
				esac
				;;
			# Add or Delete IP
			2)
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
						echo "Please check the work mode format.\n[a] or [d]"
						liteCmd=""
						continue
				esac
				;;
			*)
				echo -e "Please Enter Correct Command Format.\n[work mode] [IPv4 address]"
				liteCmd=""
				continue
		esac
		
		# Input Message check
		# IP Address Check
		IPPatternCheck $addr $IPpatter
		if [ $? == 1 ]; then
			# Not Match
			liteCmd=""
			continue
		fi
		
		# Execute the Command
		ExecuteCmd $liteCmd
	done
}

function ScriptPromptChecked() {
	# First parameter is the first command element
	if [ "$1" != "cmd" ]; then
		echo 'Please enter script prompt "cmd" at first.'
		return 1
	fi
	
	return 0
}

function WorkModeChecked() {
	# First parameter is work mode

	# Check Work Mode Input Format
	MSGeneralCmd="netsh interface ipv4 mode address $name"
	MSCmdSuffix=" $addr $mask $gateway"
	SetMode=" staic"
	
	case $1 in
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
			return 1
	esac

	return 0
}

function SubnetGatewayPatternChecked() {
	# First parameter is subnet address or gateway
	# Second parameter is IP pattern
	if [ "$1" != "" ] && $(! [[ "$1" =~ $2 ]]); then
		echo "Please check $3 format: $1 =~ [0~255].[0~255].[0~255].[0~255]"
		return 1
	fi
	
	return 0
}

# Default parameter
name="Ethernet"
workMode="a"
addr="127.0.0.1"
mask="255.255.255.0"
gateway=""
command=""

# Regular Expression Match IP address
IPpattern="^([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9]{2}|2[0-4][0-9]|25[0-5])$"

# Print Title Info
PrintTitleInfo

# Main Loop
while true
do
	read -p "Script> " command

	# Command String Process
	operationArray=(${command})
	arrayLen=${#operationArray[@]}
	
	# Mode Select
	case $arrayLen in
		# Pass
		0)
			continue
			;;
		# Lite Mode
		1)
			case $command in
				# Print Help Information
				"help")
					# if echo "$command" | grep -qwi "help"
					# -qwi will cause multi space line
					# -q: silence mode; If successful, $? return 0
					# -w: match string; Ignore case
					# -i: match by word
					PrintHelpInfo
					command=""
					continue
					;;
				# Lite Mode
				"lite")
					echo "Please Enter Work Mode & IPv4 Address."
					LiteModeMainLoop
					;;	
				# Exit Main Loop
				"q")
					echo "Exit auto config IP script."
					break
					;;
				*)
					echo "Please check the input command."
					echo '"help"[Print Help Info], "lite"[Entry Lite Mode] or "q"[Quit]'
					command=""
					continue
			esac
			;;
		2|3)
			echo "Make sure to enter all the required parameter."
			command=""
			continue
			;;
		4|5|6)
			# Parameter assignment
			name=${operationArray[1]}
			workMode=${operationArray[2]}
			addr=${operationArray[3]}
			mask=${operationArray[4]}
			gateway=${operationArray[5]}
			
			# Command Initialize
			workInfo=""
			MSCmd=""
			
			# Check Script Prompt "cmd"
			ScriptPromptChecked ${operationArray[0]}
			if [ $? == 1 ]; then
				# Not "cmd"
				command=""
				continue
			fi
			
			# Check Work Mode Input Format
			WorkModeChecked $workMode
			if [ $?  == 1 ]; then
				# Error Occur
				command=""
				continue
			fi
			
			# Check IP Pattern
			IPPatternCheck $addr $IPpattern
			if [ $? == 1 ]; then
				# Not Match
				command=""
				continue
			fi
			
			# Check Subnet Mask Address Pattern
			SubnetGatewayPatternChecked $mask $IPpattern "Subnet Mask Address"
			if [ $? == 1  ]; then
				# Not Match
				command=""
				continue
			fi
			
			# Check Gateway Pattern
			SubnetGatewayPatternChecked $gateway $IPpattern "Gateway"
			if [ $? == 1 ]; then
				# Not Match
				command=""
				continue
			fi
			
			# Execute the Command
			ExecuteCmd $MSCmd
			;;
		# Error Handle
		*)
			echo "The number of the input parameters exceeds the limit 6."
			echo -e "Please input correct command format.\ncmd [name] [work mode] [addr] *[mask] *[gateway]"
			command=""
			continue	
	esac
done