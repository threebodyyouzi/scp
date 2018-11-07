#!/bin/bash
pass=$(awk '/temporary password/{print $NF}' /var/log/mysqld.log|awk 'END{print}')
mysqladmin -uroot -p$pass  password "123qqq...A"
