#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
nohup /usr/local/bin/node $DIR/vless.js > $DIR/logs/start_node.log 2>&1 &
