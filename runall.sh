#!/bin/bash

compiler=dmd
Dirlist=$(find . -maxdepth 1 -type d -name p\*)
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
