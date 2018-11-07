#!/bin/bash
case i in
add)
    sed -i 's/\# cluster-enabled/cluster-enabled/g' /etc/redis/63$i.conf
    sed -i 's/\# cluster-config/cluster-config/g' /etc/redis/63$i.conf
    sed -i 's/\# cluster-node/cluster-node/g' /etc/redis/63$i.conf
    ;;
delete)
      sed -i "s/cluster-enabled/\# cluster-enabled/g" /etc/redis/6379.conf
       sed -i "s/cluster-config/\# cluster-config/g" /etc/redis/6379.conf
         sed -i "s/cluster-node-timeout/\# cluster-node-timeout/g" /etc/redis/6379.conf


