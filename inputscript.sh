






#!/usr/bin/bash

# Author: Owolabi Agbabiaka
#Date:1/sep/2025


#set -e #EXIT_IMMEDIATELY_WHEN_ANY_LINE_FAILS
#set -x #DEBUGG MODE
UN=`uname` #YOU CAN USE `uname` or $(uname) both works
O=`hostname`
echo "Unathorized user should keep off!, the server is $O, my UID id $(id -u) and your login time says $(date)"
echo #for linebreak
echo "you're Logging in as: $UN"
echo "Kindly input your credentials for identification purpose."
echo #for linebreak
read namecred
if [ $namecred != 'Owolabi Agbabiaka' ] 
then
	echo "sorry, can't grant you access"
else
	echo "Welcome $namecred"
fi
 #this below will make and write into a file
touch index.html
for i in {1..10}; do
	echo "Heading $i" >> index.html
done
i=1
for day in Mon Tue Wed Thur Fri; do
	echo " Day $((i++)) is : $day" >> weeks.txt
	

done
#ping one remote host 
 ping -c1 google.co4m &> /dev/null
 if [ $? -eq 0 ]
 then 
	 echo "Request response is:OK"
 else
	 echo " Request response is:NOT OK"
 fi
#ping muiltiple remote host from an external fill
slug="./sluglink"
for link in $(cat $slug); do		
 ping -c1 $link &>> /dev/null
  if [ $? -eq 0 ]
 then
         echo "Request to $link is:OK"
 else 
         echo " Request to $link is:NOT OK"
 fi
done

#date 
#C=$(cal)
#echo $C

