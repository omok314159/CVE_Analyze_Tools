#!/bin/sh

WORKDIR=./CVEs_MITRE
LISTDIR=./WORK_CVEs

if [ -e $WORKDIR ]; then
	echo "$WORKDIR is exist."
else
	echo "$WORKDIR is not exist."
	mkdir $WORKDIR
fi


cat $LISTDIR/CVEs_list |while read CVE_NUM
do
	#wget -P $WORKDIR https://cve.mitre.org/cgi-bin/cvename.cgi?name=$CVE_NUM
	echo "wget https://cve.mitre.org/cgi-bin/cvename.cgi?name=$CVE_NUM"
done
