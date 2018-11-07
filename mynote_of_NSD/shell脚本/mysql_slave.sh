#!/bin/bash
mysql -uroot -p123qqq...A -e "change master to master_host='192.168.4.51',master_user='repluser',master_password='123qqq...A',master_log_file='db51.000001',master_log_pos=154;"
mysql -uroot -p123qqq...A -e "start slave;"
