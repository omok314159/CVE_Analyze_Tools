#!/bin/sh

i=5
WORKDIR=./Monthly_CVEs

if [ -e $WORKDIR ]; then
	echo "$WORKDIR is exist."
else
	echo "$WORKDIR is not exist."
	mkdir $WORKDIR
fi

while [ $i -lt 10 ]; do
	j=1
	while [ $j -lt 10 ]; do
		wget -P $WORKDIR https://cassandra.cerias.purdue.edu/CVE_changes/CVE.201$i.0$j.html
		j=`expr $j + 1`
	done
	while [ $j -lt 13 ]; do
		wget -P $WORKDIR https://cassandra.cerias.purdue.edu/CVE_changes/CVE.201$i.$j.html
		j=`expr $j + 1`
	done
	i=`expr $i + 1`
done
