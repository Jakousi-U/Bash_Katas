#!/bin/bash

filename=$1
configFile=$2

if [ -z $configFile ]; then
	echo "Missing argument. Use: countRows.sh <filename> <configFile>"
else 

	while read tabla
	do
		echo -n "$tabla : "
		select="Select count(*) from $tabla"
		comando="sudo sqoop eval --options-file $configFile --query"
		#echo $comando
		#total="$($comando $select)"
		total="$($comando "$select" | sed 's/[^0-9]//g' | sed '/^\s*$/d')"
		echo "$total"
		# When only want any table with rows
		#if [ $total -gt 0 ]
		#then
		#	break
		#fi
	done < $filename
fi