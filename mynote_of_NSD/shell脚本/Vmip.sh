#!/bin/bash
#Author:丁丁历险(Jacob)
#该脚本使用guestmount工具，Centos7.2中安装libguestfs-tools-c可以获得guestmount工具
#脚本在不登陆虚拟机的情况下，修改虚拟机的IP地址信息
#在某些环境下，虚拟机没有IP或IP地址与真实主机不在一个网段
#真实主机在没有virt-mange图形的情况下，远程连接虚拟机很麻烦
#该脚本可以解决类似的问题
read -p "请输入虚拟机名称:" name
if virsh domstate $name|grep -q running ;then
       echo "修改虚拟机网卡数据,需要关闭虚拟机"
       virsh destroy $name
fi
mountpoint="/media/virtimage"
[ ! -d $mountpoint ]&& mkdir $mountpoint
echo "请稍后..."
if mount | grep -q "$mountpoint" ;then
       umount $mountpoint
fi
guestmount  -d $name -i $mountpoint
read -p "请输入需要修改的网卡名称:" dev
read -p "请输入IP地址:" addr
#判断原本网卡配置文件中是否有IP地址，有，就修改该IP，没有，就添加一个新的IP地址
if grep -q"IPADDR"  $mountpoint/etc/sysconfig/network-scripts/ifcfg-$dev;then
   sed -i "/IPADDR/s/=.*/=$addr/"  $mountpoint/etc/sysconfig/network-scripts/ifcfg-$dev
else
   echo "IPADDR=$addr" >>  $mountpoint/etc/sysconfig/network-scripts/ifcfg-$dev
fi
#如果网卡配置文件中有客户配置的IP地址，则脚本提示修改IP完成
awk -F= -v x=$addr '$2==x{print "完成..."}' $mountpoint/etc/sysconfig/network-scripts/ifcfg-$dev
