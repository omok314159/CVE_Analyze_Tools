#!/bin/sh

MONTHDIR="./Monthly_CVEs"
WORKDIR=./WORK_CVEs

if [ -e $WORKDIR ]; then
	echo "$WORKDIR is exist."
else
	echo "$WORKDIR is not exist."
	mkdir $WORKDIR
fi


cat $MONTHDIR/CVE.* |grep HREF|awk -F ">" '{print $2}'|awk -F "<" '{print "CVE-"$1}' |grep "CVE-201[5-9]"|sort|uniq > $WORKDIR/CVEs_list
