#!/bin/bash
clear

rm -rf $HOME/bench.log
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo | sed 's/^[ \t]*//;s/[ \t]*$//' )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo | sed 's/^[ \t]*//;s/[ \t]*$//' )
tram=$( free -m | awk 'NR==2 {print $2}' )
vram=$( free -m | awk 'NR==4 {print $2}' )
up=$( uptime | awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }' | sed 's/^[ \t]*//;s/[ \t]*$//' )
	# Output of results
echo -e "--------------Selamat Datang Di Server IP - $MYIP-------------------"
echo -e "System Info"
echo -e "-----------"
echo -e "\e[032;1mCPU model:\e[0m $cname"
echo -e "\e[032;1mNumber of cores:\e[0m $cores"
echo -e "\e[032;1mCPU frequency:\e[0m $freq MHz"
echo -e "\e[032;1mTotal amount of ram:\e[0m $tram MB"
echo -e "\e[032;1mTotal amount of swap:\e[0m $vram MB"
echo -e "\e[032;1mSystem uptime:\e[0m $up"
echo -e "\e[032;1mScript By:\e[0m AdityaWg | www.kerdunet.info"
echo -e ""
echo -e "Apa Yang Ingin Anda Lakukan ?"
PS3='Silahkan ketik angka pilihan anda lalu enter: '
options=("Buat Akun SSH & OVPN" "Buat Akun Trial SSH & OVPN" "Generate Akun SSH & OVPN" "Perbarui Masa Aktif Akun" "Hapus Akun SSH & OVPN" "Ganti Password Akun SSH & OVPN" "Lihat Semua Akun SSH & OVPN" "Lihat Semua Akun Yang Expired" "Kunci Akun Yang Sudah Expired" "Hapus Akun Yang Sudah Expired" "Monitor Akun Yang Multi Login" "Tendang Akun Yang Multi Login" "Nyalakan Autokill" "Matikan Autokill" "Ram Status" "Penggunaan Data Oleh User" "Banned Akun SSH & OVPN" "Unbanned Akun SSH & OVPN" "Test Kecepatan Server" "Edit Baner Login" "Nyalakan Auto Reboot VPS 12 Jam Sekali" "Nyalakan Auto Reboot VPS 1 Hari Sekali" "Melihat Log Auto Reboot VPS" "Mematikan Auto Reboot VPS" "Ganti Password VPS" "Restart Server [reboot]" "Restart Webmin [service webmin restart]" "Restart Dropbear [service dropbear restart]" "Restart Squid [service squid restart]" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Buat Akun SSH & OVPN")
	 clear
           usernew
	    break
            ;;
            "Buat Akun Trial SSH & OVPN")
	clear
	    trial
            break
            ;;	
            "Generate Akun SSH & OVPN")
            clear
            gen
            break
            ;;
        "Perbarui Masa Aktif Akun")
	    clear
	     renew
            break
            ;;
        "Hapus Akun SSH & OVPN")
	 clear
	    hapus
            break
            ;;
            "Ganti Password Akun SSH & OVPN")
		clear
		 gantipass
			break			
      ;;
		"Lihat Semua Akun SSH & OVPN")
		clear
		userlist
			break
			;;
		"Lihat Semua Akun Yang Expired")
		clear
			userexp
			break
			;;		
		 "Kunci Akun Yang Sudah Expired")
	    clear
	    lock
	    break
	    ;;
	    "Hapus Akun Yang Sudah Expired")
	clear
	       hapususerexp
	    break
	    ;;
	    "Monitor Akun Yang Multi Login")
       clear
              userlog
                break
	          ;;
		"Tendang Akun Yang Multi Login")
		clear
			tendang
			break
			;;	
			"Nyalakan Autokill")
		clear 
echo "--------------------- MENGAKTIFKAN AUTOKILL ----------------------"
echo "                MODIFIED BY ADITYA (082210988552)                 "
echo ""
read -p "Isikan Maximal User Login (1-2): " MULTILOGIN2
echo "* * * * * root /usr/local/bin/userlimit $MULTILOGIN2" > /etc/cron.d/userlimit1
echo "* * * * * root sleep 10; /usr/local/bin/userlimit $MULTILOGIN2" > /etc/cron.d/userlimit2
echo "* * * * * root sleep 20; /usr/local/bin/userlimit $MULTILOGIN2" > /etc/cron.d/userlimit3
echo "* * * * * root sleep 30; /usr/local/bin/userlimit $MULTILOGIN2" > /etc/cron.d/userlimit4
echo "* * * * * root sleep 40; /usr/local/bin/userlimit $MULTILOGIN2" > /etc/cron.d/userlimit5
echo "* * * * * root sleep 50; /usr/local/bin/userlimit $MULTILOGIN2" > /etc/cron.d/userlimit6
echo "* * * * * root /usr/local/bin/userlimit $MULTILOGIN2" >> /etc/cron.d/userlimit1
echo "* * * * * root sleep 11; /usr/local/bin/userlimit $MULTILOGIN2" >> /etc/cron.d/userlimit2
echo "* * * * * root sleep 21; /usr/local/bin/userlimit $MULTILOGIN2" >> /etc/cron.d/userlimit3
echo "* * * * * root sleep 31; /usr/local/bin/userlimit $MULTILOGIN2" >> /etc/cron.d/userlimit4
echo "* * * * * root sleep 41; /usr/local/bin/userlimit $MULTILOGIN2" >> /etc/cron.d/userlimit5
echo "* * * * * root sleep 51; /usr/local/bin/userlimit $MULTILOGIN2" >> /etc/cron.d/userlimit6
service cron restart
service ssh restart
service dropbear restart
echo "   + AUTO KILL SUDAH DI AKTIFKAN , JANGAN LUPA DINON AKTIFKAN+    "
			break
			;;	
			"Matikan Autokill")
		clear
	rm -rf /etc/cron.d/userlimit1
	rm -rf /etc/cron.d/userlimit2
	rm -rf /etc/cron.d/userlimit3
	rm -rf /etc/cron.d/userlimit4
	rm -rf /etc/cron.d/userlimit5
	rm -rf /etc/cron.d/userlimit6
	service cron restart
	    service ssh restart
	    service dropbear restart
	clear
echo "------------+ AUTO KILL SUDAH DI NONAKTIFKAN +--------------"
			break
			;;	
		"Ram Status")
		    clear
		    free -h | grep -v + > /tmp/ramcache
            cat /tmp/ramcache | grep -v "Swap"
            break
              ;;
        "Penggunaan Data Oleh User")
        myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`
        myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`
        ifconfig $myint | grep "RX bytes" | sed -e 's/ *RX [a-z:0-9]*/Received: /g' | sed -e 's/TX [a-z:0-9]*/\nTransfered: /g'
        break
        ;;
		"Banned Akun SSH & OVPN")	
		clear
	    baned
			break
			;;
		"Unbanned Akun SSH & OVPN")
		clear
	    unbaned
			break
			;;
        "Test Kecepatan Server")
	speedtest --share
	break
            ;;
            "Edit Baner Login")
	clear
	echo "----------------------MENGEDIT BANER LOGIN-----------------------"
	echo "               MODIFIED BY ADITYA (082210988552)                 "
	echo ""
	echo "-----------------------------------------------------------------"
	echo -e "1.) Simpan text (CTRL + X, lalu ketik Y dan tekan Enter) "
	echo -e "2.) Membatalkan edit text (CTRL + X, lalu ketik N dan tekan Enter)"
	echo "-----------------------------------------------------------------"
	read -p "Tekan ENTER untuk melanjutkan........................ "
	nano /etc/baner
	service dropbear restart && service ssh restart
	break
	;;
	"Nyalakan Auto Reboot VPS 12 Jam Sekali")
	clear
	echo "----------------------MENYALAKAN AUTO REBOOT OTOMATIS-----------------------"
	echo "               MODIFIED BY ADITYA (082210988552)                 "
	echo "0 */12 * * * root /root/reboot_otomatis.sh" > /etc/cron.d/reboot_otomatis
	echo "Auto Reboot Berhasil Dinyalakan Setiap 12 Jam Sekali"
	break
	;;
	"Nyalakan Auto Reboot VPS 1 Hari Sekali")
	clear
	echo "----------------------MENYALAKAN AUTO REBOOT OTOMATIS-----------------------"
	echo "               MODIFIED BY ADITYA (082210988552)                 "
	echo "0 0 * * * root /root/reboot_otomatis.sh" > /etc/cron.d/reboot_otomatis
	echo "Auto Reboot Berhasil Dinyalakan Setiap 1 Jam Sekali"
	break
	;;
	"Melihat Log Auto Reboot VPS")
	clear
	echo "----------------------MELIHAT LOG AUTOREBOOT VPS-----------------------"
	echo "               MODIFIED BY ADITYA (082210988552)                 "
	cat /root/log-reboot.txt
	break
	;;
	"Mematikan Auto Reboot VPS")
	clear
	echo "----------------------MEMATIKAN AUTOREBOOT VPS-----------------------"
	echo "               MODIFIED BY ADITYA (082210988552)                 "
	rm -f /etc/cron.d/reboot_otomatis
	echo "Auto Reboot Berhasil Dimatikan"
	break
	;;
	    "Ganti Password VPS")
	    read -p "Silahkan isi password baru untuk VPS anda: " pass	
        echo "root:$pass" | chpasswd
	    echo "Password vps anda berhasil diganti menjadi $pass"
	    break
	    ;;
	    "Restart Server [reboot]")
	    reboot
	    break
	    ;;
	    "Restart Webmin [service webmin restart]")
	    service webmin restart
	    break
	    ;;
	    "Restart Dropbear [service dropbear restart]")
	    service dropbear restart
	    break
	    ;;
	    "Restart Squid [service squid3 restart]")
	    service squid3 restart
	    break
	    ;;
	    "Quit")
	    break
	    ;;
        *) echo invalid option;;
    esac
done
