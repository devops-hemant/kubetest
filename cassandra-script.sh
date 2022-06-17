#!/bin/bash
l=0
n=1
while  [ "$n" != "0" ] && [ "$l" -le "3" ]
do
   sleep  20
   /usr/local/cassandra/bin/nodetool status
   n="$?"
   l=$(( l + 1 ))
done

if [[ "$l" -le "3" ]]
then
    echo "master is running now"
    echo "success" > /tmp/cassandra-status.txt
else
    echo "cluster not started exit the process"
    echo "failed" > /tmp/cassandra-status.txt
    exit 1
fi
