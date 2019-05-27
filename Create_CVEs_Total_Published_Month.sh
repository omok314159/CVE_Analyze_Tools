#!/bin/sh

WORKDIR=./WORK_CVEs

if [ -e $WORKDIR ]; then
	echo "$WORKDIR is exist."
else
	echo "$WORKDIR is not exist."
	mkdir $WORKDIR
fi

cat /dev/null > $WORKDIR/Published_Month.tmp

cat $WORKDIR/CVEs_Date.csv |awk -F "," '{print $2}'|awk -F "/" '{print $3"/"$1}' > $WORKDIR/Published_Month.tmp

i=2015
cat /dev/null > $WORKDIR/CVE_Published_dates.csv

while [ $i -lt 2020 ]; do
	j=1
	while [ $j -lt 10 ]; do
		echo "$i/0$j, `cat $WORKDIR/Published_Month.tmp |grep "$i/0$j" |wc -l`" >> $WORKDIR/CVE_Published_dates.csv
		j=`expr $j + 1`
	done
	while [ $j -lt 10 ]; do
		echo "$i/$j, `cat $WORKDIR/Published_Month.tmp |grep "$i/$j" |wc -l`" >> $WORKDIR/CVE_Published_dates.csv
		j=`expr $j + 1`
	done
	i=`expr $i + 1`
done
