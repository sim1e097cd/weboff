# Author: sim_1e097cd

if [ "$#" -gt "0" ]
then 
	if [ $1 == '-off' ] 
	then
		var=$(ls /dev | grep 'video[0-99]')
		list=($var)
		for elem in ${list[*]} 
		do
			mv /dev/$elem /dev/weboff${elem: -1}
		done
		if [ "$#" -gt "1" ]
		then 
			if [ "$2" -gt "0" ] && [ "$2" -lt "1000" ] 
			then
				sleep $2
				for elem in ${list[*]} 
				do
					mv /dev/weboff${elem: -1} /dev/$elem
				done
			else 
				echo 'usage ./weboff -off/-on [seconds]'
			fi
		fi
	elif [ $1 == '-on' ] 
	then
		var=$(ls /dev | grep 'weboff[0-99]')
		list=($var)
		for elem in ${list[*]} 
		do
			mv /dev/$elem /dev/video${elem: -1}
		done
	else
		echo 'usage ./weboff -off/-on [seconds]'
	fi
else
	echo 'usage ./weboff -off/-on [seconds]'
fi
