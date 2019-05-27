#!/bin/sh

WORKDIR=./CVEs_NIST
LISTDIR=./WORK_CVEs

if [ -e $WORKDIR ]; then
	echo "$WORKDIR is exist."
else
	echo "$WORKDIR is not exist."
	mkdir $WORKDIR
fi


cat $LISTDIR/CVEs_list |while read CVE_NUM
do
	#wget -P wget https://nvd.nist.gov/vuln/detail/$CVE_NUM
	echo "wget https://nvd.nist.gov/vuln/detail/$CVE_NUM"
done
