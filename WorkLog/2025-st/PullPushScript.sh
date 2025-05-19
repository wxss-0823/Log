function getPullDir() {
	for file in `ls $1`
	do
		# echo "cd $1"
		cd $1
		if test -d $file
		then 
			echo "=================================================="
			echo "dir: $file"
			# echo "cd: $file"
			cd $file
			echo "pwd: `pwd`" 

			echo "git pull origin master"
			git pull origin master

			echo "RETURN[OK]"
			echo "=================================================="
			echo -e "\n"
		fi
	done

	return 0
}

function getPushApp () {
	for dir in `ls $1`
	do
		cd $1
		if test -d $dir
		then
			curdir=$1$dir
			cd $curdir
			echo "=================================================="
			echo "pwd: `pwd`"
			for file in `ls $curdir`
			do
				if [ "$file" == "$2" ]; then
					"./"$file
					echo "RETURN[OK]"
					echo "=================================================="
					echo -e "\n"
				fi

			done
		fi
	done

	return 0
}


function chooseOperation () {
	attemptTimes=5
	errorflag=0
	echo "-----------------------------------------------------------------"
	echo "Please choose the operation: 1 -> getPullDir; 2 -> getPushApp"
	read -p "Print q/quit/exit to exit: " mode
	echo "-----------------------------------------------------------------"
	for i in `seq $attemptTimes`
	do
		if [ $i -gt 1 -a $errorflag -ne 1 ]; then
			read -p "Please choose the next operation:" mode
		fi

		errorflag=0

		if [ $mode == 1 ]; then
			getPullDir $homepath
			echo "--------------------------------------------------"
		elif [ $mode == 2 ]; then
			getPushApp $homepath $filename
			echo "--------------------------------------------------"
		elif [ "$mode" == "q" -o "$mode" == "quit" -o "$mode" == "exit" ]; then
			echo -e "\n"
			echo "--------------------------------------------------"
			echo "Exit the script."

			break

		else
			read -p "Please input the correct value([1] or [2]): " mode
			errorflag=1
		fi
	done

	if [ $i -eq $attemptTimes ]; then
		echo "Attempt Times over $attemptTimes, force exit."
	fi

	echo "Run Successfully, exit code [0]."
	echo "--------------------------------------------------"

	return 0
}

homepath="D:/Users/ProjectFiles/"
filename="GitPush.exe"

chooseOperation