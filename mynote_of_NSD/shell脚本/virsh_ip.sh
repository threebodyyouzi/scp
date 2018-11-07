#!/bin/bash

expect<<EOF
spawn virsh console $1
expect "^]"        {send "\r"}
expect "login:"    {send "root\r"}
expect "Password:" {send "123456\r"}
expect "~]#"       {send "./eip.sh $2\r"}
expect "~]#"       {send "systemctl restart network"}
expect "#"         {send "exit\r"}
EOF
