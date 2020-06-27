#!/bin/bash

source ./scripts/common.inc

# This script only works in Docker container
IPID=`ps -elf | grep -i $DATADIR | awk '{print $4}'`

for proc in $IPID; do
    kill -9 $proc
done

if [ -n "$EGO_ACTIVITY_PID" ]; then  
    echo_log_to_file "Stopping the EGO Activity processes $EGO_ACTIVITY_PID and its children" $LOGFILE
	ps -ef | grep $EGO_ACTIVITY_PID | grep -v grep | awk {'print $2'} | xargs kill
    kill $EGO_ACTIVITY_PID
fi    

setfacl -R -m m:rwx $NOTEBOOK_DATA_DIR/home
setfacl -R -m m:rwx $NOTEBOOK_DATA_DIR/tmp

sleep 5
