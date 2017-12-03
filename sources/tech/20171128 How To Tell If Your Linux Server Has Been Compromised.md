How To Tell If Your Linux Server Has Been Compromised
--------------

A server being compromised or hacked for the purpose of this guide is an unauthorized person or bot logging into the server in order to use it for their own, usually negative ends.

Disclaimer: If your server has been compromised by a state organization like the NSA or a serious criminal group then you will not notice any problems and the following techniques will not register their presence.

However, the majority of compromised servers are carried out by bots i.e. automated attack programs, in-experienced attackers e.g. “script kiddies”, or dumb criminals.

These sorts of attackers will abuse the server for all it’s worth whilst they have access to it and take few precautions to hide what they are doing.

### Symptoms of a compromised server

When a server has been compromised by an in-experienced or automated attacker they will usually do something with it that consumes 100% of a resource. This resource will usually be either the CPU for something like crypt-currency mining or email spamming, or bandwidth for launching a DOS attack.

This means that the first indication that something is amiss is that the server is “going slow”. This could manifest in the website serving pages much slower than usual, or email taking many minutes to deliver or send.

So what should you look for?

### Check 1 - Who’s currently logged in?

The first thing you should look for is who is currently logged into the server. It is not uncommon to find the attacker actually logged into the server and working on it.

The shell command to do this is w. Running w gives the following output:

```
 08:32:55 up 98 days,  5:43,  2 users,  load average: 0.05, 0.03, 0.00
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
root     pts/0    113.174.161.1    08:26    0.00s  0.03s  0.02s ssh root@coopeaa12
root     pts/1    78.31.109.1      08:26    0.00s  0.01s  0.00s w

```

One of those IP’s is a UK IP and the second is Vietnamese. That’s probably not a good thing.

Stop and take a breath, don’t panic and simply kill their SSH connection. Unless you can stop then re-entering the server they will do so quickly and quite likely kick you off and stop you getting back in.

Please see the What should I do if I’ve been compromised section at the end of this guide no how to proceed if you do find evidence of compromise.

The whois command can be run on IP addresses and will tell you what all the information about the organization that the IP is registered to, including the country.

### Check 2 - Who has logged in?

Linux servers keep a record of which users logged in, from what IP, when and for how long. This information is accessed with the last command.

The output looks like this:

```
root     pts/1        78.31.109.1      Thu Nov 30 08:26   still logged in
root     pts/0        113.174.161.1    Thu Nov 30 08:26   still logged in
root     pts/1        78.31.109.1      Thu Nov 30 08:24 - 08:26  (00:01)
root     pts/0        113.174.161.1    Wed Nov 29 12:34 - 12:52  (00:18)
root     pts/0        14.176.196.1     Mon Nov 27 13:32 - 13:53  (00:21)

```

There is a mix of my UK IP’s and some Vietnamese ones, with the top two still logged in. If you see any IP’s that are not authorized then refer to the final section.

The login history is contained in a text file at ~/.bash_history and is therefore easily removable. Often, attackers will simply delete this file to try to cover their tracks. Consequently, if you run last and only see your current login, this is a Bad Sign.

If there is no login history be very, very suspicious and continue looking for indications of compromise.

### Check 3 - Review the command history

This level of attacker will frequently take no precautions to leave no command history so running the history command will show you everything they have done. Be on the lookout for wget or curl commands to download out-of-repo software such as spam bots or crypto miners.

The command history is contained in the ~/.bash_history file so some attackers will delete this file to cover what they have done. Just as with the login history, if you run history and don’t see anything then the history file has been deleted. Again this is a Bad Sign and you should review the server very carefully.

### Check 4 - What’s using all the CPU?

The sorts of attackers that you will encounter usually don’t take too many precautions to hide what they are doing. So they will run processes that consume all the CPU. This generally makes it pretty easy to spot them. Simply run top and look at the highest process.

This will also show people exploiting your server without having logged in. This could be, for example, someone using an unprotected form-mail script to relay spam.

If you don’t recognize the top process then either Google its name or investigate what it’s doing with losf or strace.

To use these tools first copy its PID from top and run:

```
strace -p PID

```

This will display all the system calls the process is making. It’s a lot of information but looking through it will give you a good idea what’s going on.

```
lsof  -p PID

```

This program will list the open files that the process has. Again, this will give you a good idea what it’s doing by showing you what files it is accessing.

### Check 5 - Review the all the system processes

If an unauthorized process is not consuming enough CPU to get listed noticeably on top it will still get displayed in a full process listing with ps. My proffered command is ps auxf for providing the most information clearly.

You should be looking for any processes that you don’t recognize. The more times you run ps on your servers (which is a good habit to get into) the more obvious an alien process will stand out.

### Check 6 - Review network usage by process

The command iftop functions like top to show a ranked list of processes that are sending and receiving network data along with their source and destination. A process like a DOS attack or spam bot will immediately show itself at the top of the list.

### Check 7 - What processes are listening for network connections?

Often an attacker will install a program that doesn’t do anything except listen on the network port for instructions. This does not consume CPU or bandwidth whilst it is waiting so can get overlooked in the top type commands.

The commands lsof and netstat will both list all networked processes. I use them with the following options:

```
lsof -i

```

```
netstat -plunt

```

You should look for any process that is listed as in the LISTEN or ESTABLISHED status as these processes are either waiting for a connection (LISTEN) or have a connection open (ESTABLISHED). If you don’t recognize these processes use strace or lsof to try to see what they are doing.

### What should I do if I’ve been compromised?

The first thing to do is not to panic, especially if the attacker is currently logged in. You need to be able to take back control of the machine before the attacker is aware that you know about them. If they realize you know about them they may well lock you out of your server and start destroying any assets out of spite.

If you are not very technical then simply shut down the server. Either from the server itself with shutdown -h now or systemctl poweroff. Or log into your hosting provider’s control panel and shut down the server. Once it’s powered off you can work on the needed firewall rules and consult with your provider in your own time.

If you’re feeling a bit more confident and your hosting provider has an upstream firewall then create and enable the following two rules in this order:

1.  Allow SSH traffic from only your IP address.

2.  Block everything else, not just SSH but every protocol on every port.

This will immediately kill their SSH session and give only you access to the server.

If you don’t have access to an upstream firewall then you will have to create and enable these firewall rules on the server itself and then, when they are in place kill the attacker’s ssh session with the kill command.

A final method, where available, is to log into the server via an out-of-band connection such as the serial console and stop networking with systemctl stop network.service. This will completely stop any network access so you can now enable the firewall rules in your own time.

Once you have regained control of the server do not trust it.

Do not attempt to fix things up and continue using the server. You can never be sure what the attacker did and so you can never sure the server is secure.

The only sensible course of action is to copy off all the data that you need and start again from a fresh install.

--------------------------------------------------------------------------------

via: https://bash-prompt.net/guides/server-hacked/

作者：[ ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://bash-prompt.net
