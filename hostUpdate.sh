wget http://googleips-google.stor.sinaapp.com/hosts -O /tmp/hosts
Begin=`sed -n '/#+BEGIN/=' /etc/hosts | tail -n1`
End=`sed -n '/# Google CN End/=' /etc/hosts | tail -n1`
FileEnd=`sed -n '$=' /etc/hosts`

if [ ! $Begin ]; then
	echo "No find former hosts"
elif [ $End ];then
	echo "delete former host list"
	sed -i "${Begin}, ${End}d" /etc/hosts
else
	echo 'delete host list Begin to FileEnd'
	sed -i "${Begin},${FileEnd}d" /etc/hosts
fi
cat /tmp/hosts >> /etc/hosts
echo "update hosts over"