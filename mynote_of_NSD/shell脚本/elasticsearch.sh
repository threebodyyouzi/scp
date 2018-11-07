#!/bin/bash

name=hostname
sed -i "s/^#cluster.name.*$/cluster.name: myelk/" /etc/elasticsearch/elasticsearch.yml
sed -i "s/^#node.name.*$/node.name: $name/" /etc/elasticsearch/elasticsearch.yml
sed -i "s/^#network.host.*$/network.host: 0.0.0.0/" /etc/elasticsearch/elasticsearch.yml
sed -i "s/^#discovery.zen.ping.*$/discovery.zen.ping.unicast.hosts: ['se1', 'se2','se3','se4','se5']/" /etc/elasticsearch/elasticsearch.yml
systemctl restart elasticsearch
systemctl enable elasticsearch
