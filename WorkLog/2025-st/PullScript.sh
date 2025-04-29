getDir() {
	for file in `ls $1`
	do
		# echo "cd $1"
		cd $1
		if test -f $file
		then
			echo "file: $file"
		elif test -d $file
		then 
			echo "dir: $file"
			# echo "cd: $file"
			cd $file
			echo "pwd: `pwd`" 

			echo "git pull origin master"
			git pull origin master

			echo "RETURN[OK]"
			echo -e "\n"
		fi
	done
}

path="D:\Users\ProjectFiles"
getDir $path