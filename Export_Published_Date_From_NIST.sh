#!/bin/sh

CVEDIR="./CVEs_NIST"
WORKDIR="./WORK_CVEs"

if [ -e $WORKDIR ]; then
	echo "$WORKDIR is exist."
else
	echo "$WORKDIR is not exist."
	mkdir $WORKDIR
fi

cat /dev/null > $WORKDIR/Export_Published_dates_tmp.sh

echo "cd $CVEDIR" > $WORKDIR/Export_Published_dates_tmp.sh

ls $CVEDIR |awk '{print "../check_published_date_from_nist.sh "$1}'  >> $WORKDIR/Export_Published_dates_tmp.sh

chmod 655 $WORKDIR/Export_Published_dates_tmp.sh

sh $WORKDIR/Export_Published_dates_tmp.sh > $WORKDIR/CVEs_Date.csv
