#!/bin/bash
yum -y install vsftpd                             //安装vsftpd软件
cp /etc/vsftpd/vsftpd.conf{,.bak}                  //备份默认的配置文件
sed -i "/^#anon/s/^#//" /etc/vsftpd/vsftpd.conf      //修改服务配置
chmod 777 /var/ftp/pub                              //调整目录权限
systemctl start vsftpd                              //启动服务
systemctl enable vsftpd                            //设为自动运行
