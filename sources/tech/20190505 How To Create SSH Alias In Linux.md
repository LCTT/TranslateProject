[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Create SSH Alias In Linux)
[#]: via: (https://www.ostechnix.com/how-to-create-ssh-alias-in-linux/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

How To Create SSH Alias In Linux
======

![How To Create SSH Alias In Linux][1]

If you frequently access a lot of different remote systems via SSH, this trick will save you some time. You can create SSH alias to frequently-accessed systems via SSH. This way you need not to remember all the different usernames, hostnames, ssh port numbers and IP addresses etc. Additionally, It avoids the need to repetitively type the same username/hostname, ip address, port no whenever you SSH into a Linux server(s).

### Create SSH Alias In Linux

Before I know this trick, usually, I connect to a remote system over SSH using anyone of the following ways.

Using IP address:

```
$ ssh 192.168.225.22
```

Or using port number, username and IP address:

```
$ ssh -p 22 sk@server.example.com
```

Or using port number, username and hostname:

```
$ ssh -p 22 sk@server.example.com
```

Here,

  * **22** is the port number,
  * **sk** is the username of the remote system,
  * **192.168.225.22** is the IP of my remote system,
  * **server.example.com** is the hostname of remote system.



I believe most of the newbie Linux users and/or admins would SSH into a remote system this way. However, If you SSH into multiple different systems, remembering all hostnames/ip addresses, usernames is bit difficult unless you write them down in a paper or save them in a text file. No worries! This can be easily solved by creating an alias(or shortcut) for SSH connections.

We can create an alias for SSH commands in two methods.

##### Method 1 – Using SSH Config File

This is my preferred way of creating aliases.

We can use SSH default configuration file to create SSH alias. To do so, edit **~/.ssh/config** file (If this file doesn’t exist, just create one):

```
$ vi ~/.ssh/config
```

Add all of your remote hosts details like below:

```
Host webserver
    HostName 192.168.225.22
    User sk

Host dns
    HostName server.example.com
    User root

Host dhcp
    HostName 192.168.225.25
    User ostechnix
    Port 2233
```

![][2]

Create SSH Alias In Linux Using SSH Config File

Replace the values of **Host** , **Hostname** , **User** and **Port** with your own. Once you added the details of all remote hosts, save and exit the file.

Now you can SSH into the systems with commands:

```
$ ssh webserver

$ ssh dns

$ ssh dhcp
```

It is simple as that.

Have a look at the following screenshot.

![][3]

Access remote system using SSH alias

See? I only used the alias name (i.e **webserver** ) to access my remote system that has IP address **192.168.225.22**.

Please note that this applies for current user only. If you want to make the aliases available for all users (system wide), add the above lines in **/etc/ssh/ssh_config** file.

You can also add plenty of other things in the SSH config file. For example, if you have [**configured SSH Key-based authentication**][4], mention the SSH keyfile location as below.

```
Host ubuntu
    HostName 192.168.225.50
    User senthil
    IdentityFIle ~/.ssh/id_rsa_remotesystem
```

Make sure you have replace the hostname, username and SSH keyfile path with your own.

Now connect to the remote server with command:

```
$ ssh ubuntu
```

This way you can add as many as remote hosts you want to access over SSH and quickly access them using their alias name.

##### Method 2 – Using Bash aliases

This is quick and dirty way to create SSH aliases for faster communication. You can use the [**alias command**][5] to make this task much easier.

Open **~/.bashrc** or **~/.bash_profile** file:

Add aliases for each SSH connections one by one like below.

```
alias webserver='ssh sk@server.example.com'
alias dns='ssh sk@server.example.com'
alias dhcp='ssh sk@server.example.com -p 2233'
alias ubuntu='ssh sk@server.example.com -i ~/.ssh/id_rsa_remotesystem'
```

Again make sure you have replaced the host, hostname, port number and ip address with your own. Save the file and exit.

Then, apply the changes using command:

```
$ source ~/.bashrc
```

Or,

```
$ source ~/.bash_profile
```

In this method, you don’t even need to use “ssh alias-name” command. Instead, just use alias name only like below.

```
$ webserver
$ dns
$ dhcp
$ ubuntu
```

![][6]

These two methods are very simple, yet useful and much more convenient for those who often SSH into multiple different systems. Use any one of the aforementioned methods that suits for you to quickly access your remote Linux systems over SSH.

* * *

**Suggested read:**

  * [**Allow Or Deny SSH Access To A Particular User Or Group In Linux**][7]
  * [**How To SSH Into A Particular Directory On Linux**][8]
  * [**How To Stop SSH Session From Disconnecting In Linux**][9]
  * [**4 Ways To Keep A Command Running After You Log Out Of The SSH Session**][10]
  * [**SSLH – Share A Same Port For HTTPS And SSH**][11]



* * *

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-create-ssh-alias-in-linux/

作者：[sk][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/04/ssh-alias-720x340.png
[2]: http://www.ostechnix.com/wp-content/uploads/2019/04/Create-SSH-Alias-In-Linux.png
[3]: http://www.ostechnix.com/wp-content/uploads/2019/04/create-ssh-alias.png
[4]: https://www.ostechnix.com/configure-ssh-key-based-authentication-linux/
[5]: https://www.ostechnix.com/the-alias-and-unalias-commands-explained-with-examples/
[6]: http://www.ostechnix.com/wp-content/uploads/2019/04/create-ssh-alias-1.png
[7]: https://www.ostechnix.com/allow-deny-ssh-access-particular-user-group-linux/
[8]: https://www.ostechnix.com/how-to-ssh-into-a-particular-directory-on-linux/
[9]: https://www.ostechnix.com/how-to-stop-ssh-session-from-disconnecting-in-linux/
[10]: https://www.ostechnix.com/4-ways-keep-command-running-log-ssh-session/
[11]: https://www.ostechnix.com/sslh-share-port-https-ssh/
