#!/bin/bash 

correct(){
	id=$1

	if [ $id -lt 10 ]
	then
		echo "0"$id;
	else
		echo $id;
	fi
}

next(){
	id=$1;
	id=$[ $id + 1 ]
	echo $(correct $id)
}

prev(){
	id=$1
	id=$[ $id - 1 ]
	echo $(correct $id)
}

if [ $# -lt 3 ]
then
	echo "Usage: shift.sh [-1: prev, 1: next] <start> <end>"
	exit
fi

ss=$2; 
es=$3; 

	
if [ $1 -lt 0 ]
then

	thiss=$(correct $ss)
	cp slide_$thiss.html slide_$thiss_old.html
	for((i=$ss;i<=$es;i++))
	do
		thiss=$(correct $i)
		nexts=$(next $i)
		cp slide_$nexts.html slide_$thiss.html
	done

else
	for((i=$es;i>=$ss;i--))
	do
		thiss=$(correct $i)
		nexts=$(next $i)
		mv slide_$thiss.html slide_$nexts.html
	done
fi


