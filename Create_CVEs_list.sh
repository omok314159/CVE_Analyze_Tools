#!/bin/sh

MONTHDIR="./Monthly_CVEs"
WORKDIR=./WORK_CVEs

if [ -e $WORKDIR ]; then
	echo "$WORKDIR is exist."
else
	echo "$WORKDIR is not exist."
	mkdir $WORKDIR
fi


ls $MONTHDIR/CVE.* |while read CVE_MONTH
do
	row=0
	row=`grep -e "Modified entries" -n $CVE_MONTH| sed -e 's/:.*//g'`

	head -$row $CVE_MONTH > $CVE_MONTH.tmp
	cat $CVE_MONTH.tmp |grep "HREF="
done
cat $MONTHDIR/*.tmp |grep HREF|awk -F ">" '{print $2}'|awk -F "<" '{print "CVE-"$1}' |grep "201[5-9]" > $WORKDIR/CVEs_list
