#!/bin/sh

CVEDIR="./CVEs_MITRE"
WORKDIR=./WORK_CVEs

if [ -e $WORKDIR ]; then
	echo "$WORKDIR is exist."
else
	echo "$WORKDIR is not exist."
	mkdir $WORKDIR
fi

cat /dev/null > $WORKDIR/Published_dates.txt

ls $CVEDIR/* |while read LINE
do
	cat $LINE |grep "Assigned (" |awk -F ">" '{print $2}'|awk -F "<" '{print $1}'|sed s/"Assigned ("//g |sed s/")"//g|awk -F "" '{print $1$2$3$4"/"$5$6}' >> $WORKDIR/Published_dates.txt
done

i=2015

while [ $i -lt 2020 ]; do
	j=1
	while [ $j -lt 10 ]; do
		echo "$i/0$j, `cat $WORKDIR/Published_dates.txt |grep "$i/0$j" |wc -l`" >> $WORKDIR/CVE_Published_dates.csv
		j=`expr $j + 1`
	done
	while [ $j -lt 10 ]; do
		echo "$i/$j, `cat $WORKDIR/Published_dates.txt |grep "$i/$j" |wc -l`" >> $WORKDIR/CVE_Published_dates.csv
		j=`expr $j + 1`
	done
	i=`expr $i + 1`
done
