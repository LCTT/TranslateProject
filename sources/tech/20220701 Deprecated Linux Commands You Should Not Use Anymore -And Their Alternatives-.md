[#]: subject: "Deprecated Linux Commands You Should Not Use Anymore (And Their Alternatives)"
[#]: via: "https://itsfoss.com/deprecated-linux-commands/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Deprecated Linux Commands You Should Not Use Anymore (And Their Alternatives)
======
Believe it or not, you might be using a deprecated Linux command.

Or at least try to use it.

It’s not really your fault. You are either habitual of using those commands or learned them through old, obsolete tutorials on the web.

This is especially true for networking commands as several of them have been replaced or going to be replaced with newer commands.

In this article, I am going to list a few such Linux commands. You may still find a few of them in your distribution. It’s possible that your distribution is still providing it for backward compatibility or has created a new implementation underneath or plans to remove it in the newer versions.

But it’s good to know them as an informed Linux user. Here we go!

![deprecated linux commands][1]

### scp – potentially deprecated

The scp command, short for secure copy, uses the SSH protocol to copy files between two Linux machines. Its biggest USP is that it strongly follows the normal cp command syntax.

This is why scp is hugely popular among Linux users. You know the cp command for copying files from one location to another in the local machine. You use a similar syntax for copying files between machines.

However, the [scp command seems to be problematic][2]. The SCP protocol is decades old,[hasn’t been updated and has many security vulnerabilities][3], complained OpenSSH.

This is why distributions are advocating to deprecate it for another command like rsync or create a new version of scp that uses sftp protocol underneath. Red Hat and Fedora have already created a [new implementation of scp][4].

For other distributions, the use of scp remains debatable. Considering the looming uncertainty, it will be wise to start moving to rsync.

**Suggested alternative: rsync and sftp commands.**

### egrep and fgrep – Replaced by grep flags

[grep, egrep and fgrep][5]. They all sound similar, right? Because they are similar to each other.

The grep is the first and oldest of the lot and it was created decades ago.

egrep and fgrep commands were created a little later to extend the functionality of the grep command.

* The egrep command allows the use of extended regex.
* The fgrep command works on fixed strings instead of regex (default grep behavior).

But why have separate commands when they can be options under the original commands.

And that’s exactly what happened. The grep command was modified to add new options that provided the same functionalities as egrep (with grep -E) and fgrep (with grep -F).

But the legacy of egrep and fgrep continues even today, unfortunately. Many tutorials, websites and books still mention them. Distributions still include these commands.

**Suggested alternative: grep -E for egrep and grep -F for fgrep.**

### netstat – Use other tools for network statistics

The netstat command was an excellent tool for network analytics, both high level and low level.

You could use it to monitor TCP/UDP packets, sockets, see network interfaces and more.

It was part of the [net-tools package][6]. Since the net-tools package was deprecated around 2010, distributions stopped adding netstat command.

**Suggested alternative: Use ss command.**

### ifconfig – It will be missed

Truly. This was the go-to command for [checking the IP address in Linux systems][7] and other information about the network interfaces.

You’ll still see it mentioned in old forum posts and tutorials. The command got deprecated with the net-tools command.

It’s functionalities are now found in the ip command. In fact, many of the popular networking Linux commands that were part of the net-tools package were deprecated.

### arp, route, iptunnel, nameif – They all went down with net-tools

If you read an old Linux book from before 2010, you’ll find the arp, route and other such networking commands that do not exist in your Linux system anymore. You cannot even install them.

Most of them are now replaced by various options of the ip command:

* arp – replaced by ip n
* iptunnel – replaced by ip tunnel
* nameif – replaced by ip link
* route – replaced by ip route

### iwconfig – Does it still exist?

![iwconfig][8]

Though not part of the net-tools package, iwconfig was similar to ifconfig command but just for the wireless interface.

I can still see it in Ubuntu 22.04 but I have been reading about its deprecation for some time now. It’s been [removed from Red Hat][9] and many other distributions.

**Suggested alternative: Use the iw command.**

### iptables – Being replaced by its own developer

The iptables command is the go-to command when you are configuring the routes for NAT and packet filtering for firewalls.

It is still in practice by many Linux users. However, its origin project, [netfilter][10], has created a replacement command called nftables.

Why? because “iptables framework has become a little convoluted with iptables, ip6tables, arptables, and ebtables all providing different but similar functions.”

And thus a new tool to combine them all under nftables. You can read this [comparison of iptables and nftables command][11].

You’ll still find iptables in almost all Linux distributions. But considering that its own developers have created its replacement, it would be wise to start moving to the new tool.

**Suggested alternative: Use the nftables command.**

### Conclusion

I am not saying to drop the still available but soon-to-be deprecated Linux commands right away. You have learned them through effort and they are part of your muscle memory now.

But since they might be going away soon (or have already gone), it’s better to keep yourself future-proof and look into your custom scripts and notes and update them when you have enough free time.

Since we are discussing replacement commands, let me share an interesting article I wrote last month. It’s about [modern alternatives to the popular legacy Linux commands][12]. bat for cat, duf for du and df and more.

Now it’s your turn.

Tell me which of the above-mentioned old Linux commands you are still using?

Or which ones you have already ditched and moved to their replacements?

The comment section is all yours.

--------------------------------------------------------------------------------

via: https://itsfoss.com/deprecated-linux-commands/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/07/deprecated-linux-commands.png
[2]: https://lwn.net/Articles/835962/
[3]: https://www.openssh.com/txt/release-8.0
[4]: https://www.redhat.com/en/blog/openssh-scp-deprecation-rhel-9-what-you-need-know
[5]: https://linuxhandbook.com/grep-egrep-fgrep/
[6]: https://wiki.linuxfoundation.org/networking/net-tools
[7]: https://itsfoss.com/check-ip-address-ubuntu/
[8]: https://itsfoss.com/wp-content/uploads/2022/07/iwconfig.png
[9]: https://access.redhat.com/solutions/1194553
[10]: https://www.netfilter.org/
[11]: https://linuxhandbook.com/iptables-vs-nftables/
[12]: https://itsfoss.com/legacy-linux-commands-alternatives/
