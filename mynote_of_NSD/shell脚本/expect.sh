#!/bin/bash
expect << EOF
spawn ssh 192.168.4.50
expect "?"        {send "yes\n"}
expect "password" {send "123456\n"}
expect "#"        {send "touch /root/桌面/haha.txt\n"}
expect "#"        {send "exit\n"}                    
EOF 
##expect结尾的指令不执行,需要打一条无用的指令
