#!/bin/bash

while true; do
  sshpass -p 'youpassword' ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -tt youname@youserver.serv00.com "exit" &
  sleep 259200
done
