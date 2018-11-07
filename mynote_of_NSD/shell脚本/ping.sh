#!/bin/bash
i=1
while ((i<254))
do
  ping -c1 -i 0.2 -w 1 192.168.1.$i &>/dev/null
if [ $? -eq 0 ];then
   echo "192.168.1.$i" >> /root/桌面/openstack.txt
fi
  let i++
done
