Translating---------geekpi

How to block unwanted IP addresses on Linux efficiently
================================================================================
You may want to block IP addresses on your Linux box under various circumstances. For example, as an end user you may want to protect yourself from known spyware or tracker IP addresses. Or when you are running P2P software, you may want to filter out connections from networks associated with anti-P2P activity. If you are a sysadmin, you may want to ban access from spam IP addresses to your production mail server. Or you may wish to block web server access from certain countries for some reason. In many cases, however, your IP address block list can grow quickly to tens of thousands of IP addresses or IP address blocks. How can you deal with it?

### Problems of Netfilter/IPtables ###

In Linux, banning an IP address can be done very easily with netfilter/iptables framework:

    $ sudo iptables -A INPUT -s 1.1.1.1 -p TCP -j DROP 

If you want to ban a whole IP address block, you can also do it as easily:

    $ sudo iptables -A INPUT -s 1.1.2.0/24 -p TCP -j DROP 

However, what if you have 1,000 independent IP addresses with no common CIDR prefix that you want to ban? You would have 1,000 iptables rules! Clearly this does not scale.

    $ sudo iptables -A INPUT -s 1.1.1.1 -p TCP -j DROP
    $ sudo iptables -A INPUT -s 2.2.2.2 -p TCP -j DROP
    $ sudo iptables -A INPUT -s 3.3.3.3 -p TCP -j DROP
    . . . . 

### What are IP Sets? ###

That is when [IP sets][1] come in handy. IP sets are a kernel feature which allows multiple (independent) IP addresses, MAC addresses or even port numbers to be encoded and stored efficiently within bitmap/hash kernel data structures. Once an IP set is created, you can create an iptables rule which matches against the set.

You should immediately see the benefit of using IP sets, which is that you can match against multiple IP addresses in an IP set by using a single iptables rule! You can construct IP sets using combinations of multiple IP addresses and port numbers, and can dynamically update iptables rules with IP sets without any performance impact.

### Install IPset Tool on Linux ###

To create and manage IP sets, you need to use a userspace tool called ipset.

To install ipset on Debian, Ubuntu or Linux Mint:

    $ sudo apt-get install ipset

To install ipset on Fedora or CentOS/RHEL 7:

    $ sudo yum install ipset 

### Ban IP Addresses using IPset Command ###

Let me walk you through on how to use ipset command using simple examples.

First, let's create a new IP set named banthis (name can be arbitrary):

    $ sudo ipset create banthis hash:net

The second argument (hash:net) in the above is required, and represents the type of a set being created. There are [multiple types][2] of IP sets. An IP set of hash:net type uses a hash to store multiple CIDR blocks. If you want to store individual IP addresses in a set, you can use hash:ip type instead.

Once you have created an IP set, you can check up on the set with:

    $ sudo ipset list 

![](https://farm8.staticflickr.com/7483/15380353464_825dbc45c2_z.jpg)

This shows a list of available IP sets, along with detailed information of each set including set membership. By default, each IP set can contain up to 65536 elements (CIDR blocks in this case). You can increase this limit by appending "maxelem N" option.

    $ sudo ipset create banthis hash:net maxelem 1000000 

Now let's add IP address blocks to the set:

    $ sudo ipset add banthis 1.1.1.1/32
    $ sudo ipset add banthis 1.1.2.0/24
    $ sudo ipset add banthis 1.1.3.0/24
    $ sudo ipset add banthis 1.1.4.10/24 

You will see that the set membership has been changed.

    $ sudo ipset list 

![](https://farm8.staticflickr.com/7518/15380353474_4d6b9dbf63_z.jpg)

Now it is time to create an iptables rule using this IP set. The key here is to use "-m set --match-set <name>" option.

Let's create an iptables rule which prevents all those IP blocks in the set from accessing a web server at port 80. This can be achieved by:

    $ sudo iptables -I INPUT -m set --match-set banthis src -p tcp --destination-port 80 -j DROP 

If you want, you can save a specific IP set to a file, and then later restore it from the file:

    $ sudo ipset save banthis -f banthis.txt
    $ sudo ipset destroy banthis
    $ sudo ipset restore -f banthis.txt 

In the above, I tried removing an existing IP set using destroy option to see if I can restore the IP set. 

### Automate IP Address Banning ###

By now you should see how powerful the concept of IP sets is. Still maintaining a up-to-date IP blacklist can be a cumbersome and time-consuming process. In fact, there are free or paid services out there which maintain these IP blacklists for you. As a bonus, let's see how we can automatically translate available IP blacklists into IP sets.

Let me grab free IP lists from [iblocklist.com][3] which publish various IP block lists for free or for a fee. Free versions are available in P2P format.

Here I am going to use an open-source python tool called iblocklist2ipset which converts P2P versions of iblocklist into IP sets.

First, you need to have pip installed (see [this guideline][4] to install pip). 

Then install iblocklist2ipset as follows.

    $ sudo pip install iblocklist2ipset

On some distros like Fedora, you may need to run:

    $ sudo python-pip install iblocklist2ipset 

Now go to [iblocklist.com][5], and grab any P2P list URL (e.g., "level1" list).

![](https://farm8.staticflickr.com/7523/15976824856_80632f35e1_z.jpg)

Then paste the URL into the following command.

    $ iblocklist2ipset generate \
    --ipset banthis "http://list.iblocklist.com/?list=ydxerpxkpcfqjaybcssw&fileformat=p2p&archiveformat=gz" \
    > banthis.txt 

After you run the above command, you will get a file named bandthis.txt created. If you check its content, you will see something like:

    create banthis hash:net family inet hashsize 131072 maxelem 237302
    add banthis 1.2.4.0/24
    add banthis 1.2.8.0/24
    add banthis 1.9.75.8/32
    add banthis 1.9.96.105/32
    add banthis 1.9.102.251/32
    add banthis 1.9.189.65/32
    add banthis 1.16.0.0/14

You can simply load this file with ipset command:

    $ sudo ipset restore -f banthis.txt

Now check the automatically created IP set with:

    $ sudo ipset list banthis 

As of this writing, the "level1" block list contains more than 237,000 IP address blocks. You will see that that many IP address blocks have been added to the IP set.

Finally, go ahead and create a single iptables rule to block them all!

### Summary ###

In this tutorial, I demonstrated how you can block unwanted IP addresses using a powerful tool called ipset. Combine that with a third-party tool like iblocklist2ipset, and you can easily streamline the process of maintaining your IP block list. For those of you who are curious about the speed improvement of ipset, the figure below shows the benchmark result comparing iptables without and with ipset (credit to [daemonkeeper.net][6]).

![](https://farm8.staticflickr.com/7575/15815220998_e1935c94c0_z.jpg)

Tell me how much you like it. :-)

--------------------------------------------------------------------------------

via: http://xmodulo.com/block-unwanted-ip-addresses-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://ipset.netfilter.org/
[2]:http://ipset.netfilter.org/features.html
[3]:https://www.iblocklist.com/lists.php
[4]:http://ask.xmodulo.com/install-pip-linux.html
[5]:https://www.iblocklist.com/lists.php
[6]:http://daemonkeeper.net/781/mass-blocking-ip-addresses-with-ipset/