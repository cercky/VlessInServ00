#!/bin/bash

#set corntab
chmod +x *.sh
{  
    crontab -l 2>/dev/null  
    echo ""  
    echo "@reboot /home/$USER/serv/watchdog.sh >/dev/null 2>&1"  
    echo "@reboot echo \"\$(date +\" %Y-%m-%d %H:%M:%S\")  ||  system reboot\" >> /home/$USER/serv/logs/rebootinfo.log"  
    echo "* * * * * /home/$USER/serv/watchdog.sh >/dev/null 2>&1"
    echo "15 8 * * 1 /home/$USER/serv/autossh.ssh >/dev/null 2>&1"
} | crontab -
