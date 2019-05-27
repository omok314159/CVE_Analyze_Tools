#!/bin/sh

NISTDIR=./CVEs_NIST
WORKDIR=./CPEs

if [ -e $WORKDIR ]; then
	echo "$WORKDIR is exist."
else
	echo "$WORKDIR is not exist."
	mkdir $WORKDIR
fi

cat Product_lists |awk '{print "grep \""$1"\" -l -r CVEs_NIST > ./CPEs/"$1}' > run_product_lists.sh

sh run_product_lists.sh
