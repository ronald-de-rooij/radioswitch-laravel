#!/bin/bash
cat $1 > tmp0
cat $2 >> tmp0
echo $1
echo $2
echo $3
awk -F "=" '!a[$1]++' tmp0 > tmp1 && mv tmp1 $3 && rm tmp0