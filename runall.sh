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
			if [[ $obj == *.d ]];
			then 
				continue
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
			echo ""
		done
		cd ..
	done
	exit
fi	

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
