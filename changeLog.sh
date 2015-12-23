#!/bin/bash

level=$1
base="log4j.threshold="
levels=(ALL DEBUG ERROR FATAL INFO OFF TRACE TRACE_INT WARN)
logFile="/etc/hadoop/conf/log4j.properties"

if [ -z $level ]
then
	echo "Missing argument. Use: changeLevelLog.sh <level>"
else
	continuar=false

	for l in "${levels[@]}"
	do	
		if [[ $level == $l ]]
		then
			continuar=true
			break
		fi
	done

	if $continuar
	then
		old="$(grep $base $logFile)"
		echo "Old value: $old"
		new=$base$level
		echo "Changing for: $new"
		sudo sed "s/$old/$new/" $logFile > temp_logFile.txt

		sudo mv -f temp_logFile.txt $logFile

		check="$(grep $base $logFile)"
		echo "New value: $check"
	else
		echo "Incorrect argument, it must be one of the following: ALL, DEBUG, ERROR, FATAL, INFO, OFF, TRACE, TRACE_INT, WARN"
	fi
fi