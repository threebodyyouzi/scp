#!/bin/bash
for ip in 192.168.4.{52,53}
do
  nmap -sS -n -p 80 $ip |grep open >>/dev/null
   if [ $? == 0 ];then
        echo "主机$ip is ok"
    else
        ssh $ip "systemctl restart httpd"
   fi
done
