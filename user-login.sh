#!/bin/bash

if [[ $USER != 'root' ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

MYIP=$(wget -qO- ipv4.icanhazip.com)


data=( `ps aux | grep -i dropbear | awk '{print $2}'`);
echo "-----------------------------------"
echo "Checking Dropbear login" | lolcat;
echo "-----------------------------------"
for PID in "${data[@]}"
do
	#echo "check $PID";
	NUM=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | wc -l`;
	username=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | awk '{print $10}'`;
	IP=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | awk '{print $12}'`;
	if [ $NUM -eq 1 ]; then
		echo "$PID - $username - $IP";
	fi
done

echo "";

data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);
echo "-----------------------------------"
echo "Checking OpenSSH login" | lolcat;
echo "-----------------------------------"
for PID in "${data[@]}"
do
	#echo "check $PID";
	NUM=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | wc -l`;
	username=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | awk '{print $9}'`;
	IP=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | awk '{print $11}'`;
	if [ $NUM -eq 1 ]; then
		echo "$PID - $username - $IP";
	fi
done

#echo "";

#echo "-----------------------------------"
#echo "Checking OpenVPN login" | lolcat;
#echo "-----------------------------------"
#tail -f /etc/openvpn/server-vpn.log

echo "";

echo "-----------------------------------"
echo "Checking PPTP login" | lolcat;
echo "-----------------------------------"
last | grep ppp | grep still

echo "";

#Melihat Riwayat Login User
echo "-----------------------------------"
echo "Checking PPTP Login History" | lolcat;
echo "-----------------------------------"
last | grep ppp

echo "";
echo "----------------------------------------------------------------"
echo " Kalau ada Multi Login Kill Aja " | lolcat
echo " Tetap Multi Login Ganti Passnya baru Kill Lagi " | lolcat
echo " Caranya pake Kill nomor PID " | lolcat
echo "----------------------------------------------------------------"

	echo " DEVELOPED BY YUSUF ARDIANSYAH n ELANG OVERDOSIS "| lolcat
echo "----------------------------------------------------------------"
echo ""


