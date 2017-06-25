#!/bin/bash
echo $$
trap 'ls -l /home' sighup sigint
trap date sigquit

while true
do
    sleep 9
done
