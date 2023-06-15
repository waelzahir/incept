#!/bin/bash
cmd=$@

if [ ! -z "$cmd" ]
then
    exec "$@"
    exit 0
fi
cd data
while :
do
	name=backup.$(date +%s)
	tar -czf $name --absolute-names /database
	sleep 600
done
