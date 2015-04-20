#!/bin/bash

i=0;
t1=$(date +%s)
for (( j = 0; j < 10000; j++ )); do
    if [[ $i -ge 100 ]]; then
        #statements

        t2=$(date +%s)
        let "diff=t2-t1"
        echo 'processed ', $diff , 's';

        if [[ $diff -lt  1  ]]  ; then
            let "to_sleep=1-diff"
            echo 'wait ', $to_sleep , 's';
            sleep $to_sleep
        fi
        let "i=0";
        let "t1=$(date +%s)"
    fi

    let "i+=1"
    echo 'j: ', $j
    echo '  i: ', $i
done

