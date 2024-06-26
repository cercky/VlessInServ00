#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"  
EXEC=/usr/home/$USER/.npm-global/bin/pm2


if ! $EXEC list |grep VLESS|grep online ; then  
    echo "$(date +"%Y/%m/%d %H:%M:%S")   ||  VLESS OFFLINE" >>$DIR/logs/$(date +"%Y-%m-%d").log
    $EXEC delete VLESS  
    $EXEC start "$DIR/vless/app.js" --name VLESS
else  
    echo "$(date +"%Y/%m/%d %H:%M:%S")   ||  VLESS ONLINE" >>$DIR/logs/$(date +"%Y-%m-%d").log
fi
if ! $EXEC list |grep AutoSSH|grep online ; then
    echo "$(date +"%Y/%m/%d %H:%M:%S")   ||  AUSSH OFFLINE" >>$DIR/logs/$(date +"%Y-%m-%d").log
    $EXEC delete AutoSSH  
    $EXEC start "$DIR/autossh.sh" --name AutoSSH
else
    echo "$(date +"%Y/%m/%d %H:%M:%S")   ||  AUSSH ONLINE" >>$DIR/logs/$(date +"%Y-%m-%d").log
fi
