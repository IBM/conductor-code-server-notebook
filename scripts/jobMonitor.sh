#!/bin/bash

source ./scripts/common.inc

sleep 10

# Need to determine the port Code Server is running on, but for now it is hard coded
# Might be best to write a port to a file in the start script and read it here

if [ "$NOTEBOOK_SSL_ENABLED" == true ]; then
    HTTP_PREFIX="https"
else
    HTTP_PREFIX="http"
fi
URL=${HTTP_PREFIX}://$EGOSC_INSTANCE_HOST:8080
echo "UPDATE_INFO '$URL'"
echo "UPDATE_STATE 'READY'"
echo "END"
exit 0
