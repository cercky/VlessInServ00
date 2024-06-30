安装说明


1、将文件拷贝到serv00服务器的用户目录，例如 /home/you_user_name/serv 目录下

2、给install.sh执行权限

3、运行install.sh 会在计划任务里添加3条记录

      1、系统重启后执行一次watchdog脚本
      
      2、系统重启后记录日志
      
      3、每1分钟执行一次watchdog脚本，监测Vless和自动登录ssh脚本是否执行
      

查询：
   可以在系统中使用ps -x |grep vless查看程序是否运行。

自定义：

      1、修改vless/vless.js文件中的port和uuid。
      
      2、修改autossh.sh中登录serv00服务器的信息。

      3、端口需要在serv00的web管理端上打开对应端口，否则无法正常工作。
