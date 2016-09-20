#!/bin/bash
THISDIR=$PWD
ROM=${1}
UNATTENDED=${2}
TOPDIR="$THISDIR/../../../../"
echo $TOPDIR
if [[ "$ROM" == "" ]]; then
	echo "ROM not specified, assuming cm!"
	sleep 1
	ROM="cm"
fi
cd $ROM
for LINE in $(echo $(find -name *.patch); echo $(find -name *.apply))
do
	if [[ $UNATTENDED -ne 1 ]]; then
		clear
	fi
	echo "clearing = $LINE"
  	REPO=$(dirname $LINE)
	echo "repo = $TOPDIR$REPO"
	cd $TOPDIR
	cd $REPO
	git add .
	git stash
	find -name *.orig | while read LINE; do rm $LINE; done
	find -name *.rej | while read LINE; do rm $LINE; done
	git clean -f
	git stash clear
	cd $THISDIR
done
if [[ "$ROM" !=  "common" ]]; then
	./clearpatches.sh common
fi
