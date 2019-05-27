#!/bin/sh

DATE=""

DATE=`cat $1|grep "vuln-published-on"|awk -F ">" '{print $2}' |awk -F "<" '{print $1}'`

echo "$1,$DATE"
