[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (10 resources every sysadmin should know about)
[#]: via: (https://opensource.com/article/19/7/resources-sysadmin)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/erezhttps://opensource.com/users/sethhttps://opensource.com/users/don-watkinshttps://opensource.com/users/jamesfhttps://opensource.com/users/alanfdoss)

10 resources every sysadmin should know about
======
Work smarter, not harder with these 10 resources that make a sysadmin
look superhuman.
![Person on top of a mountain, arm raise][1]

Everybody knows that sysadmins are impossibly busy people. Consequently, it sometimes seems they are superhuman. The sysadmin's dirty secret, the same one shared by many open source users, is that they don't actually _do_ all of the work it looks like they've done. One of the greatest tools in the sysadmin's kit is their ability to reuse work someone else has already done for them.

A good sysadmin knows where to turn when there's a big job to be done but nobody available to do it. If you're looking to work smarter, not harder, this is for you: a list of the top 10 resources every sysadmin should know about.

### Turnkey Linux

![Turnkey Linux][2]

The [Turnkey Linux][3] project is the app store of systems administration. Turnkey takes popular open source components of infrastructure, installs them on a virtual server, creates an image of the install, and offers them to the world as free downloads. In the days before [containers][4], Turnkey mostly targeted virtualization engines, but with the advent of the cloud, the project also offers cloud "apps."

Whether you use a cloud version or virtual machines, installing infrastructure has never been easier. No matter what a department requests, you can satisfy and close the ticket by simply spinning up a virtual server and dropping Turnkey Linux into it or installing the app on Turnkey's cloud platform. Turnkey provides OVA, ISO, VMDK, QCow2, Xen, and Docker images, so no matter what your infrastructure is based on, you can use Turnkey.

The most exciting thing about Turnkey (aside from how easy it makes to spin up infrastructure) is that it also serves as a working example for new sysadmins. If you've never configured an NFS server, you can run a Turnkey solution to witness a working instance and use it as context for your research on how to make it happen the next time.

If you haven't tried a Turnkey image yet, do yourself a favor and download one for evaluation.

An easy demonstration is the [file sharing][5] package. You can download the image as an ISO and install it into a virtual machine such as [GNOME Boxes][6]. Start the image and run it as a live demo.

![Turnkey Linux][7]

Once the Turnkey server starts, it prompts you to create an administrative password. You can skip the other options until you see a list of IP addresses and ports. You can use whatever protocol best suits your OS, using **root** as the username with the administrative password you created after boot.

### Subnet calculator

If you're a new sysadmin, you might be struggling with the concept of subnets, or the limits placed on routers to direct traffic within a network. Subnets can be confusing, and calculating subnets and masks and the resulting blocks of addresses can be hard. Even for the experienced sysadmin used to configuring routers and who can calculate subnets in their head, it never hurts to double-check the math.

There are many subnet calculators online, but if you're in a text-only SSH session, that's not always convenient. That's where [SubNetCalc][8]** **comes in.

The **subnetcalc** command, available from your distribution's repositories, is an IPv4 and IPv6 subnet calculator for your terminal. The basic command is simple: provide it with the IP address you want to provision along with an estimated bit mask using CIDR notation, and **subnetcalc** displays the ramifications:


```
$ subnetcalc  192.168.6.0/24
Address       = 192.168.6.0
   11000000.10101000.00000110.00000000
Network       = 192.168.6.0 / 24
Netmask       = 255.255.255.0
Broadcast     = 192.168.6.255
Wildcard Mask = 0.0.0.255
Hosts Bits    = 8
Max. Hosts    = 254   (2^8 - 2)
Host Range    = { 192.168.6.1 - 192.168.6.254 }
Properties    =
   - 192.168.6.0 is a NETWORK address
   - Class C
   - Private
```

It also understands IPv6:


```
Address       = fe80::f811:e76e:7218:ff46
                   fe80 = 11111110 10000000
                   0000 = 00000000 00000000
                   0000 = 00000000 00000000
                   0000 = 00000000 00000000
                   f811 = 11101000 00011001
                   e76e = 11100101 01011110
                   7328 = 01110011 00011000
                   ff46 = 11111111 01010110
Network       = fe80:: / 64
Netmask       = ffff:ffff:ffff:ffff::
Wildcard Mask = ::ffff:ffff:ffff:ffff
Hosts Bits    = 64
Max. Hosts    = 18446744073709551615   (2^64 - 1)
Host Range    = { fe80::1 - fe80::ffff:ffff:ffff:ffff }
Properties    =
   - fe80::f811:e74e:7318:ff56 is a HOST address in fe80::/64
   - Link-Local Unicast Properties:
      + Interface ID = f811:e74e:7318:ff56
      + Sol. Node MC = ff02::1:ff18:ff56
```

### Crontab Guru

The Unix [cron][9] subsystem is a timer that runs commands at a specific time on a specific day. It's one of the many ways a sysadmin ensures that important tasks, like backups, reminder emails, and log rotations, happen automatically. Crontabs, the configuration files that control **cron**, were once an arcane sequence of numbers, slashes, and asterisks that somehow translated to a representation of time.

The good news is they've gotten a lot easier to use, with syntax like **@daily** and **@weekly** instead of **0 0 * * */1** or **0 0 * * 7**, respectively. Even better are online crontab composers like [Crontab Guru][10].

![Crontab guru][11]

This website serves one purpose: to de-mystify crontab scheduling. With its simple interface, you can compose what you believe is your desired schedule in cron syntax and get the results back in plain English. No more struggling to remember mnemonics for the order of minute, hour, date, month, weekday (mine was "Mini Horrific Devils Maraud the Weary"). No more giving up and resorting to the comparatively imprecise **@daily**-style shorthand. And most importantly, no more feeling sure that you got the syntax right only to discover later that your cron job isn't set to run until the year 2112. With a good crontab interpreter, you can enter your best guess and get instant feedback.

### A rescue and testing thumb drive

![Kali Linux][12]

Be honest with yourself: the reason you got into the sysadmin racket in the first place was because you like to play with computers. Take your love of digital exploration and put it to good use with occasional pen-test challenges. No matter how careful you've been while setting up your infrastructure, you probably overlooked something, whether it's a configuration that's not as strict as it ought to be or a bug you couldn't have possibly known about. And sometimes it's not you, but shadow IT on your network that exposes a vulnerability. Regardless of the cause, it's your job to find weaknesses, and Kali Linux is the most hyper-focused pen-testing distribution available.

You can [download Kali][13] and install it on a spare machine, a virtual machine, a thumb drive, and even your mobile phone with [NetHunter][14].

Start learning some of its [tools][15], like Metasploit, Wifiphisher, and Wireshark. Kali has excellent training resources available, and there's nothing quite as fun and nerve-racking as trying to break into a network of your own design.

### Samba

![File sharing with Samba][16]

No matter your intentions as a sysadmin using open source, you're going to encounter a mixed environment of platforms that need to share files. Not everyone on your network is going to agree to just SSH copies of files to one another or to work in plain text so they can commit to [Git][17]. In fact, if you don't provide an easy method for users to share information, your users will find a way to do it anyway, and their solution will involve putting company data on whatever free service they encounter online.

When sysadmins need a universal platform for file sharing, they invariably turn to [Samba][18], which humbly bills itself as the standard Windows interoperability suite of programs for Linux and Unix. In fact, Samba is much more than that, partly because of the scope of Active Directory and partly because of the business world's acceptance of Microsoft technology. For instance, there's no need to run separate file share interfaces for the different operating systems on your network, because nearly everything on your network is compatible with SMB/CIFS.

### Cockpit web console

![Cockpit web console][19]

For people unfamiliar with the Linux terminal, it can be difficult to visualize what a server is, much less what it does. That can make it difficult for interns or transitioning Windows admins to help administer Linux servers, and it can make it difficult to justify hardware purchases to management.

Fedora, RHEL, and CentOS ship with the [Cockpit][20] web console, and it's easy to install on Debian, Ubuntu, and many others.

Cockpit lets you monitor and modify properties of servers that otherwise would require SSH access and familiarity with Linux commands. Not only is it open source, but it has a rich API and is easy to extend, so if you need your web console to do more than what Cockpit provides, you can develop your own interfaces to common tasks.

The [server edition of Fedora][21] enables the web console by default, so if you haven't tried Cockpit, you can see it in action with just one install. If you're already running Ubuntu or Debian and want to see Cockpit in action, you can install it with:


```
`$ sudo apt-get install cockpit`
```

### Hex keys and Screwdrivers

There are some things web consoles and terminals just can't fix. Sometimes, you have to go to the source of the problem, and if the source turns out to be bare metal, then every sysadmin will happily tell you that hex keys and screwdrivers are an absolute must.

![Multi-tool carabiner][22]

Any given sysadmin may have their allegiances, but I never go to work without my Leatherman and a few common hex keys. There are also some pretty handy keyrings out there with screwdrivers and other tools built-in, so if you're looking for a gift for your friendly local sysadmin, you can't go wrong with a multi-tool carabiner.

### Telnet and OpenSSL

Those who experienced the old-school internet may remember Telnet as a clunky, unwieldy, but effective interface for public Unix servers for big institutions. The New York Public Library used to make its card catalog available for online searches over Telnet, and many an online [MUD][23] (multi-user dungeon) was accessed over this ancient protocol. Most people call Telnet a dead protocol and a dangerous command because it lacks encryption, and while its use is limited, it's still a great command for probing ports.

As the world moves slowly toward encryption-by-default, though, alternatives arise. Things you used to use Telnet for can be done better with new tools. For instance, the old way of testing an email server was with the **telnet** command, but in many cases OpenSSL can be used instead:


```
$ openssl s_client -starttls smtp -connect email.example.com:587
&gt; ehlo example.com
&gt; auth login
(the user as a base64 string)
(the pass as a base64 string)
&gt; mail from: [noreply@example.com][24]
&gt; rcpt to: [foo@example.com][25]
&gt; data
&gt; Subject: foo bar
Baz Quux Blah.
.
&gt; quit
```

It's a classic email server test done over an encrypted line.

Whether you use Telnet or OpenSSL to probe and test servers, it's important to remember that low-level commands are vital even in the days of fancy frontends.

### Cheat

Having a hard time remembering a command? Normally you might resort to a man page, but some man pages have a hard time getting to the point. It's the reason Chris Allen Lane came up with the idea (and more importantly, the code) for a [**cheat** command][26].

The **cheat** command displays cheatsheets for common tasks in your terminal. It's a man page without the preamble. It cuts to the chase and tells you exactly how to do whatever it is you're trying to do. And if it lacks a common example that you think ought to be included, you can submit an update.


```
$ cheat tar
# To extract an uncompressed archive:
tar -xvf '/path/to/foo.tar'

# To extract a .gz archive:
tar -xzvf '/path/to/foo.tgz'
[...]
```

You can also treat **cheat** as a local cheatsheet system, which is great for all the in-house commands you and your team have invented over the years. You can easily add a local cheatsheet to your own home directory, and **cheat** will find and display it just as if it were a popular system command.

### Emacs

At the end of the day, there's nothing better than sitting back with a fresh [Emacs][27] session and typing that magical key combo: **M-x tetris**. Yes, the popular multi-tool text editor is not just the sysadmin's most worthy tool during work hours; it's the best way to relax.

![Tetris in Emacs][28]

Turn off the pager, close [Mutt][29], and enjoy.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/resources-sysadmin

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/erezhttps://opensource.com/users/sethhttps://opensource.com/users/don-watkinshttps://opensource.com/users/jamesfhttps://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/developer_mountain_cloud_top_strong_win.jpg?itok=axK3EX-q (Person on top of a mountain, arm raise)
[2]: https://opensource.com/sites/default/files/uploads/turnkey-linux.jpg (Turnkey Linux)
[3]: https://www.turnkeylinux.org/
[4]: https://opensource.com/resources/what-are-linux-containers
[5]: https://www.turnkeylinux.org/fileserver
[6]: https://opensource.com/article/19/5/getting-started-gnome-boxes-virtualization
[7]: https://opensource.com/sites/default/files/uploads/turnkey.jpg (Turnkey Linux)
[8]: https://www.uni-due.de/~be0001/subnetcalc/
[9]: https://opensource.com/article/17/11/how-use-cron-linux
[10]: http://crontab.guru
[11]: https://opensource.com/sites/default/files/uploads/crontab-guru.jpg (Crontab guru)
[12]: https://opensource.com/sites/default/files/uploads/kali.jpg (Kali Linux)
[13]: https://www.kali.org/
[14]: https://www.kali.org/kali-linux-nethunter/
[15]: https://tools.kali.org/
[16]: https://opensource.com/sites/default/files/uploads/samba.jpg (File sharing with Samba)
[17]: https://opensource.com/article/19/4/file-sharing-git
[18]: https://www.samba.org
[19]: https://opensource.com/sites/default/files/uploads/cockpit.jpg (Cockpit web console)
[20]: https://cockpit-project.org/
[21]: https://getfedora.org/en/server/
[22]: https://opensource.com/sites/default/files/uploads/multitool.jpg (Multi-tool carabiner)
[23]: https://mudlistings.com/
[24]: mailto:noreply@example.com
[25]: mailto:foo@example.com
[26]: https://github.com/cheat/cheat
[27]: https://opensource.com/life/16/2/intro-to-emacs
[28]: https://opensource.com/sites/default/files/uploads/tetris.jpg (Tetris in Emacs)
[29]: http://www.mutt.org/
