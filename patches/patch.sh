#!/bin/bash
THISDIR=$PWD
ROM=${1}
UNATTENDED=${2}
TOPDIR="$THISDIR/../../../../"
if [[ "$ROM" == "" ]]; then
	echo "ROM not specified, assuming cm!"
	sleep 1
	ROM="cm"
fi
echo $TOPDIR
cd $ROM
for LINE in $(find -name *.patch | sort )
do
	if [[ $UNATTENDED -ne 1 ]]; then
		clear
	fi
	echo "------------------------------------------------------------------------"
	echo "patch = $THISDIR/$LINE"
	echo "------------------------------------------------------------------------"
	PATCH=$THISDIR/$ROM/$LINE
	REPO=$(dirname $LINE)
	echo "repo = $REPO"
	cd $TOPDIR
	cd $REPO
	RESULT=$(patch -p1 --follow-symlinks --no-backup-if-mismatch < $PATCH)
	echo -e "${RESULT}"
	if [[ $(echo $RESULT | grep -c FAILED) -gt 0 ]] ; then
		echo ""
		echo "Fail!"
		if [[ $UNATTENDED -eq 1 ]]; then
			exit 9
		else
			read -p "Patch Failed!" yn
			break;
		fi
	fi
	if [[ $(echo $RESULT | grep -c "saving rejects to file") -gt 0 ]] ; then
		echo ""
		echo "Fail!"
		echo "Fix the patch!"
		if [[ $UNATTENDED -eq 1 ]]; then
			exit 9
		else
			read -p "Patch Rejects!" yn
			break;
		fi
	fi
	if [[ $(echo $RESULT | grep -c "Skip this patch") -gt 0 ]] ; then
		echo ""
		echo "Fail!"
		echo "Fix the patch!"
		if [[ $UNATTENDED -eq 1 ]]; then
			exit 9
		else
			read -p "Patch Skipped!" yn
			break;
		fi
	fi
	cd $THISDIR
done

cd $ROM
for LINE in $(find -name *.apply | sort )
do
	if [[ $UNATTENDED -ne 1 ]]; then
		clear
	fi
	echo "------------------------------------------------------------------------"
	echo "patch = $THISDIR/$LINE"
	echo "------------------------------------------------------------------------"
	PATCH=$THISDIR/$ROM/$LINE
	REPO=$(dirname $LINE)
	echo "repo = $REPO"
	cd $TOPDIR
	cd $REPO
	RESULT=$(git apply --whitespace=nowarn -v $PATCH 2>&1)
	echo -e "${RESULT}"
	if [[ $(echo $RESULT | grep -c error:) -gt 0 ]] ; then
		echo ""
		echo "Fail!"
		echo "Fix the patch!"
		if [[ $UNATTENDED -eq 1 ]]; then
			exit 9
		else
			read -p "Patch Error!" yn
			break;
		fi
	fi
	cd $THISDIR
done
cd $THISDIR
if [[ "$ROM" != "common" ]];then
	./patch.sh common
fi
