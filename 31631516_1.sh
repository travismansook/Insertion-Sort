#! /bin/bash

arr=($@)

if [ $# -eq 0 ]; then
	echo "no argument"
else
	echo "Original array: "${arr[@]}
	index=0
	arr_length=0
	for i in ${arr[@]}; do
		arr_length=$(($arr_length+1))
	done
	for i in ${arr[@]}; do
		index=$(($index+1))
		if [ "$index" -eq "$arr_length" ]; then #this fixes the out of bounds error
			break
		fi	

		temp=${arr[$index]}
		j=$(($index-1))	
		
		while [ "$j" -ge 0 ] && [ ${arr[$j]} -gt "$temp" ]; do
			arr[$(($j+1))]=${arr[$j]}
			j=$(($j-1))
		done
		arr[$(($j+1))]=$temp
	done	
echo "Sorted array: "${arr[@]}
fi



