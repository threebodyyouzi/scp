#!/bin/bash
function myping {
  ping -c1 -i 0.2 -w 1 176.19.4.$i &>/dev/null
if [ $? -eq 0 ];then
   echo "176.19.4.$1 is up"
else
   echo "176.19.4.$1 is down"
fi
}
for i in {1..254}
do
myping $i & 
done 

for n in {1..254}
do
wait %$n
done
