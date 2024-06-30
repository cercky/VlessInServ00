#!/bin/bash  

export TZ=Asia/Shanghai
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" 
PASSWORD='youpassword'  
REMOTE_USER='username'  
REMOTE_HOST='xx.serv00.com'  
REMOTE_COMMAND='"exit"' 

sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -tt "$REMOTE_USER@$REMOTE_HOST" $REMOTE_COMMAND  

if [ $? -eq 0 ]; then  
    echo "$(date +"%Y/%m/%d %H:%M:%S")   ||  AUTO LOGIN SSH SUCCESS" >>$DIR/logs/SSH_$(date +"%Y-%m-%d").log  
else  
    echo "$(date +"%Y/%m/%d %H:%M:%S")   ||  AUTO LOGIN SSH FAIL" >>$DIR/logs/SSH_$(date +"%Y-%m-%d").log  
fi
