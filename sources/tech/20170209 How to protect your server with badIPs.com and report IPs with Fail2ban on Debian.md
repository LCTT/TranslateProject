How to protect your server with badIPs.com and report IPs with Fail2ban on Debian
============================================================

### On this page

1.  [Use the badIPs list][4]
    1.  [Define your security level and category][1]
2.  [Let's create the script][5]
3.  [Report IP addresses to badIPs with Fail2ban][6]
    1.  [Fail2ban >= 0.8.12][2]
    2.  [Fail2ban < 0.8.12][3]
4.  [Statistics of your IP reporting][7]

This tutorial documents the process of using the badips abuse tracker in conjunction with Fail2ban to protect your server or computer. I've tested it on a Debian 8 Jessie and Debian 7 Wheezy system.

**What is badIPs?**

BadIps is a listing of IP that are reported as bad in combinaison with [fail2ban][8].

This tutorial contains two parts, the first one will deal with the use of the list and the second will deal with the injection of data.

### 
Use the badIPs list

### Define your security level and category

You can get the IP address list by simply using the REST API.

When you GET this URL : [https://www.badips.com/get/categories][9]
You’ll see all the different categories that are present on the service.

*   Second step, determine witch score is made for you.
    Here a quote from badips that should help (personnaly I took score = 3):
*   If you'd like to compile a statistic or use the data for some experiment etc. you may start with score 0.
*   If you'd like to firewall your private server or website, go with scores from 2\. Maybe combined with your own results, even if they do not have a score above 0 or 1.
*   If you're about to protect a webshop or high traffic, money-earning e-commerce server, we recommend to use values from 3 or 4\. Maybe as well combined with your own results (key / sync).
*   If you're paranoid, take 5.

So now that you get your two variables, let's make your link by concatening them and grab your link.

http://www.badips.com/get/list/{{SERVICE}}/{{LEVEL}}

Note: Like me, you can take all the services. Change the name of the service to "any" in this case.

The resulting URL is:

https://www.badips.com/get/list/any/3

### Let's create the script

Alright, when that’s done, we’ll create a simple script.

1.  Put our list in a tempory file.
2.  (only once) create a chain in iptables.
3.  Flush all the data linked to our chain (old entries).
4.  We’ll link each IP to our new chain.
5.  When it’s done, block all INPUT / OUTPUT / FORWARD that’s linked to our chain.
6.  Remove our temp file.

Nowe we'll create the script for that:

cd /home/<user>/
vi myBlacklist.sh

Enter the following content into that file.

```
#!/bin/sh
# based on this version http://www.timokorthals.de/?p=334
# adapted by Stéphane T.

_ipt=/sbin/iptables    # Location of iptables (might be correct)
_input=badips.db       # Name of database (will be downloaded with this name)
_pub_if=eth0           # Device which is connected to the internet (ex. $ifconfig for that)
_droplist=droplist     # Name of chain in iptables (Only change this if you have already a chain with this name)
_level=3               # Blog level: not so bad/false report (0) over confirmed bad (3) to quite aggressive (5) (see www.badips.com for that)
_service=any           # Logged service (see www.badips.com for that)

# Get the bad IPs
wget -qO- http://www.badips.com/get/list/${_service}/$_level > $_input || { echo "$0: Unable to download ip list."; exit 1; }

### Setup our black list ###
# First flush it
$_ipt --flush $_droplist

# Create a new chain
# Decomment the next line on the first run
# $_ipt -N $_droplist

# Filter out comments and blank lines
# store each ip in $ip
for ip in `cat $_input`
do
# Append everything to $_droplist
$_ipt -A $_droplist -i ${_pub_if} -s $ip -j LOG --log-prefix "Drop Bad IP List "
$_ipt -A $_droplist -i ${_pub_if} -s $ip -j DROP
done

# Finally, insert or append our black list
$_ipt -I INPUT -j $_droplist
$_ipt -I OUTPUT -j $_droplist
$_ipt -I FORWARD -j $_droplist

# Delete your temp file
rm $_input
exit 0
```

When that’s done, you should create a cronjob that will update our blacklist.

For this, I used crontab and I run the script every day on 11:30PM (just before my delayed backup).

crontab -e

```
23 30 * * * /home/<user>/myBlacklist.sh #Block BAD IPS
```

Don’t forget to chmod your script:

chmod + x myBlacklist.sh

Now that’s done, your server/computer should be a little bit safer.

You can also run the script manually like this:

cd /home/<user>/
./myBlacklist.sh

It should take some time… so don’t break the script. In fact, the value of it lies in the last lines.

### Report IP addresses to badIPs with Fail2ban

In the second part of this tutorial, I will show you how to report bd IP addresses bach to the badips.com website by using Fail2ban.

### Fail2ban >= 0.8.12

The reporting is made with Fail2ban. Depending on your Fail2ban version you must use the first or second section of this chapter.If you have fail2ban in version 0.8.12.

If you have fail2ban version 0.8.12 or later.

fail2ban-server --version

In each category that you’ll report, simply add an action.

```
[ssh]
 enabled = true
 action = iptables-multiport
          badips[category=ssh]
 port = ssh
 filter = sshd
 logpath = /var/log/auth.log
 maxretry= 6
```

As you can see, the category is SSH, take a look here ([https://www.badips.com/get/categories][11]) to find the correct category.

### Fail2ban < 0.8.12

If the version is less recent than 0.8.12, you’ll have a to create an action. This can be downloaded here: [https://www.badips.com/asset/fail2ban/badips.conf][12].

wget https://www.badips.com/asset/fail2ban/badips.conf -O /etc/fail2ban/action.d/badips.conf

With the badips.conf from above, you can either activate per category as above or you can enable it globally:

cd /etc/fail2ban/
vi jail.conf

```
[DEFAULT]

...

banaction = iptables-multiport
            badips
```

Now restart fail2ban - it should start reporting from now on.

service fail2ban restart

### Statistics of your IP reporting

Last step – not really useful… You can create a key.
This one is usefull if you want to see your data.
Just copy / paste this and a JSON response will appear on your console.

wget https://www.badips.com/get/key -qO -

```
{
  "err":"",
  "suc":"new key 5f72253b673eb49fc64dd34439531b5cca05327f has been set.",
  "key":"5f72253b673eb49fc64dd34439531b5cca05327f"
}
```

Then go on [badips][13] website, enter your “key” and click “statistics”.

Here we go… all your stats by category.

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/protect-your-server-computer-with-badips-and-fail2ban/

作者：[Stephane T][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/protect-your-server-computer-with-badips-and-fail2ban/
[1]:https://www.howtoforge.com/tutorial/protect-your-server-computer-with-badips-and-fail2ban/#define-your-security-level-and-category
[2]:https://www.howtoforge.com/tutorial/protect-your-server-computer-with-badips-and-fail2ban/#failban-gt-
[3]:https://www.howtoforge.com/tutorial/protect-your-server-computer-with-badips-and-fail2ban/#failban-ltnbsp
[4]:https://www.howtoforge.com/tutorial/protect-your-server-computer-with-badips-and-fail2ban/#use-the-badips-list
[5]:https://www.howtoforge.com/tutorial/protect-your-server-computer-with-badips-and-fail2ban/#lets-create-the-script
[6]:https://www.howtoforge.com/tutorial/protect-your-server-computer-with-badips-and-fail2ban/#report-ip-addresses-to-badips-with-failban
[7]:https://www.howtoforge.com/tutorial/protect-your-server-computer-with-badips-and-fail2ban/#statistics-of-your-ip-reporting
[8]:http://www.fail2ban.org/
[9]:https://www.badips.com/get/categories
[10]:http://www.timokorthals.de/?p=334
[11]:https://www.badips.com/get/categories
[12]:https://www.badips.com/asset/fail2ban/badips.conf
[13]:https://www.badips.com/
