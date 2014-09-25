Translating by GOLinux!
How to use CloudFlare as a ddclient provider under Ubuntu
================================================================================
DDclient is a Perl client used to update dynamic DNS entries for accounts on Dynamic DNS Network Service Provider. It was originally written by Paul Burry and is now mostly by wimpunk. It has the capability to update more than just dyndns and it can fetch your WAN-ipaddress in a few different ways.

CloudFlare, however, has a little known feature that will allow you to update your DNS records via API or a command line script called ddclient. This will give you the same result, and it's also free.

Unfortunately, ddclient does not work with CloudFlare out of the box. There is a patch available and here is how to hack it up on Debian or Ubuntu, also works in Raspbian with Raspberry Pi.

### Requirements ###

Make sure you have a domain name that you own and Sign up to CloudFlare ,add your domain name. Follow the instructions, the default values it gives should be fine.You'll be letting CloudFlare host your domain so you need to adjust the settings at your registrar.If you'd like to use a subdomain, add an ‘A' record for it. Any IP address will do for now.

### Install ddclient on ubuntu ###

Open the terminal and run the following command

    sudo apt-get install ddclient

Now you need to install the patch using the following commands

    sudo apt-get install curl sendmail libjson-any-perl libio-socket-ssl-perl

    curl -O http://blog.peter-r.co.uk/uploads/ddclient-3.8.0-cloudflare-22-6-2014.patch

    sudo patch /usr/sbin/ddclient < ddclient-3.8.0-cloudflare-22-6-2014.patch

The above commands completes the ddclient and patch

### Configuring ddclient ###

You need to edit the ddclient.conf file using the following command

    sudo vi /etc/ddclient.conf

Add the following information

    ##
    ### CloudFlare (cloudflare.com)
    ###
    ssl=yes
    use=web, web=dyndns
    protocol=cloudflare, \
    server=www.cloudflare.com, \
    zone=domain.com, \
    login=you@email.com, \
    password=api-key \
    host.domain.com

    Comment out:

    #daemon=300

Your api-key comes from the cloudflare account page

ssl=yes might already be in that file

use=web, web=dyndns will use dyndns to check IP (useful for NAT)

You're done. Log in to https://www.cloudflare.com and check that the IP listed for your domain matches http://checkip.dyndns.com

To verify your settings using the following command

    sudo ddclient -daemon=0 -debug -verbose -noquiet

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/how-to-use-cloudflare-as-a-ddclient-provider-under-ubuntu.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
