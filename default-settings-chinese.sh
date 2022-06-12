#!/bin/sh

uci -q batch <<-EOF
	set system.@system[0].timezone='CST-8'
	set system.@system[0].zonename='Asia/Shanghai'

	delete system.ntp.server
	add_list system.ntp.server='ntp.ntsc.ac.cn'
	add_list system.ntp.server='cn.ntp.org.cn'
	add_list system.ntp.server='cn.pool.ntp.org'
	add_list system.ntp.server='pool.ntp.org'
	
	
EOF
uci commit system

sed -i 's,downloads.openwrt.org,mirrors.tencent.com/lede,g' /etc/opkg/distfeeds.conf

exit 0
