#!/bin/sh

Dirlist=$(find . -maxdepth 1 -type d -name p\*)

if [ "$1" == "clean" ]; 
then
	for direc in $Dirlist; 
	do
		cd $direc
		files=$(ls)
		for obj in $files;
		do
			if [[ "$2" != "all" ]]; 
			then
				if [[ $obj == *.d ]];
				then 
					continue
				elif [[ $obj == *.sh ]];
				then
					continue
				elif [[ $obj == *.rs ]];
				then
					continue
				fi	
			else
				if [[ $obj == *.d ]];
				then 
					continue
				elif [[ $obj == *.sh ]];
				then
					continue
				fi
			fi
			rm $obj
		done
		cd ..
	done
	exit
elif [ "$1" == "run" ];
then
	for direc in $Dirlist;
	do
		cd $direc
		files=$(find . -executable -type f)
		for obj in $files;
		do
			echo $obj 
			$obj
		done
		cd ..
	done
	exit
elif [ "$1" == "compile" ];
then
	compiler=dmd
	for direc in $Dirlist; 
	do
		cd $direc
		dfiles=$(ls *.d)
		for progs in $dfiles;
		do
			$compiler $progs	
		done
		cd ..
	done
else
	echo "clean run compile"
fi	
