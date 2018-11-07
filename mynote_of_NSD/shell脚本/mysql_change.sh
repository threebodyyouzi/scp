#!/bin/bash
for ip in 192.168.4.{51..53}
do
expect<<EOF
spawn ssh $ip
expect "}#" {send "password=$(awk '/temporary password/{print $NF}' /var/log/mysqld.log)\r"}
expect "}#" {send "mysqladmin -uroot -p$password password'123qqq...A'\r"}
EOF
done
