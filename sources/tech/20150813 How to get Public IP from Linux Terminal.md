How to get Public IP from Linux Terminal?
================================================================================
![](http://www.blackmoreops.com/wp-content/uploads/2015/06/256x256xHow-to-get-Public-IP-from-Linux-Terminal-blackMORE-Ops.png.pagespeed.ic.GKEAEd4UNr.png)

Public addresses are assigned by InterNIC and consist of class-based network IDs or blocks of CIDR-based addresses (called CIDR blocks) that are guaranteed to be globally unique to the Internet. How to get Public IP from Linux Terminal - blackMORE OpsWhen the public addresses are assigned, routes are programmed into the routers of the Internet so that traffic to the assigned public addresses can reach their locations. Traffic to destination public addresses are reachable on the Internet. For example, when an organization is assigned a CIDR block in the form of a network ID and subnet mask, that [network ID, subnet mask] pair also exists as a route in the routers of the Internet. IP packets destined to an address within the CIDR block are routed to the proper destination. In this post I will show several ways to find your public IP address from Linux terminal. This though seems like a waste for normal users, but when you are in a terminal of a headless Linux server(i.e. no GUI or you’re connected as a user with minimal tools). Either way, being able to getHow to get Public IP from Linux Terminal public IP from Linux terminal can be useful in many cases or it could be one of those things that might just come in handy someday.

There’s two main commands we use, curl and wget. You can use them interchangeably.

### Curl output in plain text format: ###

    curl icanhazip.com
    curl ifconfig.me
    curl curlmyip.com
    curl ip.appspot.com
    curl ipinfo.io/ip
    curl ipecho.net/plain
    curl www.trackip.net/i

### curl output in JSON format: ###

    curl ipinfo.io/json
    curl ifconfig.me/all.json
    curl www.trackip.net/ip?json (bit ugly)

### curl output in XML format: ###

    curl ifconfig.me/all.xml

### curl all IP details – The motherload ###

    curl ifconfig.me/all

### Using DYNDNS (Useful when you’re using DYNDNS service) ###

    curl -s 'http://checkip.dyndns.org' | sed 's/.*Current IP Address: \([0-9\.]*\).*/\1/g' 
    curl -s http://checkip.dyndns.org/ | grep -o "[[:digit:].]\+"

### Using wget instead of curl ###

    wget http://ipecho.net/plain -O - -q ; echo
    wget http://observebox.com/ip -O - -q ; echo

### Using host and dig command (cause we can) ###

You can also use host and dig command assuming they are available or installed

    host -t a dartsclink.com | sed 's/.*has address //'
    dig +short myip.opendns.com @resolver1.opendns.com

### Sample bash script: ###

    #!/bin/bash
    
    PUBLIC_IP=`wget http://ipecho.net/plain -O - -q ; echo`
    echo $PUBLIC_IP

Quite a few to pick from.

I was actually writing a small script to track all the IP changes of my router each day and save those into a file. I found these nifty commands and sites to use while doing some online research. Hope they help someone else someday too. Thanks for reading, please Share and RT.

--------------------------------------------------------------------------------

via: http://www.blackmoreops.com/2015/06/14/how-to-get-public-ip-from-linux-terminal/

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出