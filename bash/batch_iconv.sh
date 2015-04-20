#!/bin/bash
# 
for x in $(find ./my_path/ -d 1 -type f -name "*.csv")
do
    #echo $x;

    #_utf8.csv
    if [[ ${x: -9:9} ==  '_utf8.csv' ]]; then
        echo " escape *_utf8.csv file";
        continue;
    fi

    y=`echo $x|sed -e 's/\.csv//' `;
    y=${y}_utf8.csv
    if [[ -f ${y} ]]; then
        echo " done already";
        continue
    fi
    
    `iconv -f gbk -t utf-8 $x >$y`
    echo $y;

done


