#!/bin/bash


#install pm2
mkdir -p ~/.npm-global && npm config set prefix '~/.npm-global' && echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.profile && source ~/.profile && npm install -g pm2 && source ~/.profile

#set corntab
chmod +x *.sh
{  
    crontab -l 2>/dev/null  
    echo ""  
    echo "@reboot /usr/home/$USER/serv/watchdog.sh >/dev/null 2>&1"  
    echo "@reboot echo \"\$(date +\" %Y-%m-%d %H:%M:%S\")  ||  system reboot\" >> /home/$USER/serv/logs/rebootinfo.log"  
    echo "*/5 * * * * /usr/home/$USER/serv/watchdog.sh >/dev/null 2>&1"  
} | crontab -
