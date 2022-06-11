#!/bin/bash -x     
echo "start Azure VM Mycassandra"
az vm start -g FREERG -n Mycassandra
az vm run-command invoke -g FREERG -n Mycassandra --command-id RunShellScript --scripts "/usr/local/cassandra/script.sh" | grep "nodetool: Failed to$
if [ "$?" -eq "0" ]; 
then
    echo "cluster not started exit the process"; 
    exit 1;
else
    echo "Master is running now" 
fi