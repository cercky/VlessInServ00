#!/bin/bash  
  
export TZ=Asia/Shanghai  
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"  
  
# 获取今天的日期（格式为YYYY-MM-DD）  
TODAY=$(date +"%Y-%m-%d")  
  
# 完整的日志文件路径（包括日期）  
LOG_FILE="$DIR/logs/vless_${TODAY}.log"  
  
# 如果日志文件不存在，则创建它  
if [ ! -f "$LOG_FILE" ]; then  
    touch "$LOG_FILE"  
    chmod 640 "$LOG_FILE"  
fi  
  
# 检查并处理旧的日志文件（这里简化处理，只保留最近7天的日志）  
find "$DIR/logs/" -maxdepth 1 -type f -name "vless_*.log" -mtime +6 -exec rm {} \;  
  
# 检查是否已经有一个正在运行的VLESS实例  
PID=$(ps -x | grep "[v]less.js"| awk '{print $1}')  
  
if [ -z "$PID" ]; then  
    echo "PID NOT FOUND, NOW STARTING VLESS"  
    echo "$(date +"%Y/%m/%d %H:%M:%S") || VLESS OFFLINE" >> "$LOG_FILE"  
    bash "$DIR/vless/start.sh" &  
else  
    echo "PID FOUND, PROGRAM ALREADY RUNNING"  
    echo "$(date +"%Y/%m/%d %H:%M:%S") || VLESS ONLINE" >> "$LOG_FILE"  
fi  

