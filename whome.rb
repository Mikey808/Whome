#!/usr/bin/env ruby

#--------------------------------------#
# WhoMe                                #
# Script to get ip and then do whois   #
# whome-v2.rb                          # 
# Auth: Mikey808                       #
#--------------------------------------#

require 'net/http'
require 'whois'

@ip = Net::HTTP.get(URI("https://api.ipify.org"))
@whois = Whois.whois(@ip).to_s
# Some fields only show in specific countries
@filter = "NetRange:", 
          "inetnum", 
          "netname:", 
          "NetName:",
          "descr:", 
          "country", 
          "address", 
          "OrgName:", 
          "City:", 
          "StateProv:", 
          "Country:"

puts "IP: #{@ip}"
puts " "

@whois.each_line do |line|
  if line.start_with?(*@filter)
    puts line
  end
end
