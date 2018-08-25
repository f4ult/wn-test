#!/bin/bash

echo 'upstream backend_hosts {' > $BACKEND_HOSTS_FILE
for i in $(seq 1 $WORKERS) ; do
    echo '    server proj_web_'$i';' >> $BACKEND_HOSTS_FILE
done
echo '}' >> $BACKEND_HOSTS_FILE

