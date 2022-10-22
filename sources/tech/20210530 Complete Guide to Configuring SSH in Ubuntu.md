[#]: subject: (Complete Guide to Configuring SSH in Ubuntu)
[#]: via: (https://itsfoss.com/set-up-ssh-ubuntu/)
[#]: author: (Chris Patrick Carias Stas https://itsfoss.com/author/chris/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Complete Guide to Configuring SSH in Ubuntu
======

SSH has become the default method of accessing a remote Linux server these days.

SSH stands for Secure Shell and it’s a powerful, efficient, and popular network protocol used to establish communication between two computers in a remote fashion. And let’s not forget the secure part of its name; SSH encrypts all traffic to prevent attacks like hijacking and eavesdropping while offering different authentication methods and a myriad of configuration options.

In this beginner’s guide, you’ll learn:

  * The basic concept of SSH
  * Setting up SSH server (on the system you want to access remotely)
  * Connecting to remote server via SSH from the client machine (your personal computer)



### The absolute basics of SSH

Before you see any configuration process, it will be better to go through the absolute basic concept of SSH.

The SSH protocol is based on server-client architecture. The “server” allows the “client” to be connected over a communication channel. This channel is encrypted and the exchange is governed by the use of public and private SSH keys.

![Image credit: SSH][1]

[OpenSSH][2] is one of the most popular open source tools that provides the SSH functionality on Linux, BSD and Windows.

For a successful SSH set up, you need to:

  * Have SSH server components on the machine that acts as the server. This is provided by **openssh-server** package.
  * Have SSH client component on the machine from where you want to connect to the remote server machine. This is provided by **openssh-client** package and most Linux and BSD distributions come preinstalled with it.



It is important to keep a distinction between the server and client. You might not want your personal computer to act as SSH server unless you have good reasons where you want others to connect to your system via SSH.

Generally, you have a dedicated system working as the server. For example, a [Raspberry Pi running Ubuntu server][3]. You [enable SSH on the Raspberry Pi][4] so that you could control and manage the device from your main personal computer using SSH in a terminal.

With that information, let’s see how you can set up a SSH server on Ubuntu.

### Configuring SSH Server on Ubuntu

Setting up SSH is not complicated and just needs a few steps to do it.

#### Prerequisites

  * A user with **sudo** privileges on the server machine
  * Internet connection to download the required packages
  * At least another system in your network. It can be another computer on your LAN, a remote server via Internet, or a virtual machine hosted in your computer.



_**Again, the SSH server installation should be done on the system that you want to act as server and to which you want to connect remotely via SSH.**_

#### Step 1: Install required packages

Let’s start by opening a terminal window to enter the necessary commands.

Remember to [update your Ubuntu system][5] before installing new packages or software with to make sure that you are running the latest versions.

```
sudo apt update && sudo apt upgrade
```

The package you need to run SSH Server is provided by openssh-server component from OpenSSH:

```
sudo apt install openssh-server
```

![][6]

#### Step 2: Checking the status of the server

Once the downloading and installation of the package is done the SSH service should be already running, but to be sure we will check it with:

```
service ssh status
```

You may also use the systemd commands:

```
sudo systemctl status ssh
```

You should see something like this, with the word Active highlighted. Hit `q` to return to the command prompt.

![][7]

If in your case the service is not running you will have to activate like this:

```
sudo systemctl enable --now ssh
```

#### Step 3: Allowing SSH through the firewall

Ubuntu comes with a firewall utility called [UFW][8] (UncomplicatedFirewall) which is an interface for **iptables** that in turn manages the network’s rules. If the firewall is active, it may prevent the connection to your SSH Server.

To configure UFW so that it allows the wanted access, you need to run the following command:

```
sudo ufw allow ssh
```

The status of UFW can be checked running `sudo ufw status`.

At this time our SSH Server is up and running, just waiting for a connection from a client.

### Connecting to the remote system from your local machine

Your local Linux system should already have SSH client installed. If not, you may always install it using the following command on Ubuntu:

```
sudo apt install openssh-client
```

To connect to your Ubuntu system you need to know the IP address of the computer and use the `ssh` command, like this:

```
ssh [email protected]
```

Change **username** to your actual user in the system and **address** to the IP address of your Ubuntu machine.

If you don’t [know the IP address of your computer][9] you can type `ip a` in the terminal of the server and check the output. You should have something like this:

![Using “ip a” to find the IP address][10]

As can be seen here my IP address is **192.168.1.111**. Let’s try connecting using the **[[email protected]][11]** format.

```
ssh [email protected]
```

The first time you connect to a SSH server, it will ask for permission to add the host. Type `yes` and hit Enter to continue.

![First time connecting to the server][12]

Immediately SSH tells you that the host was permanently added and then asks for the password assigned to the username. Type in the password and hit Enter one more time.

![Host added, now type in the password][13]

And voila! You will be logged into your Ubuntu system remotely!

![Connected!][14]

Now you can work in your remote system’s terminal as normal.

#### Closing the SSH connection

To close the connection you just need to type `exit` and it will close it at once, without asking for confirmation.

![Closing the connection with “exit”][15]

### Stopping and Disabling SSH in Ubuntu

If you want to stop SSH service you will need this command:

```
sudo systemctl stop ssh
```

This will stop the service until you restart it or until the system is rebooted. To restart it, type:

```
sudo systemctl start ssh
```

Now, if you want to disable it from starting during system boot, use this:

```
sudo systemctl disable ssh
```

This won’t stop the service from running during the current session, just from loading during startup. If you want to let it start again during system boot, type:

```
sudo systemctl enable ssh
```

#### Other SSH clients

The tool `ssh` is included in most *nix systems, from Linux to macOS, but those are not the only options in existence, here are a couple of clients that can be used from other operating systems:

  * [PuTTY][16] is a free SSH client for Windows and it’s open source. It’s full of features and very easy to use. If you are connecting to your Ubuntu machine from a Windows station, PuTTY is a great option.
  * [JuiceSSH][17] is an amazing tool for Android users. If you are on the go and need a mobile client to connect to your Ubuntu system, I amply recommend giving JuiceSSH a go. It’s been around for almost 10 years and it’s free to use.
  * And finally, [Termius][18] is available for Linux, Windows, macOS, iOS, and Android. It has a free tier version and also several premium options. If you are running a lot of servers and working with teams sharing connections then Termius is a good option for you.



#### Wrapping Up

With these instructions, you can set up SSH as a server service in our Ubuntu systems to be able to connect remotely and securely to your computer in order to work with the command line and perform any required task.

Our other website, Linux Handbook, has various informational articles on SSH. From here, I recommend reading the following:

  * [Getting started with SSH on Linux][19]
  * [Using SSH Config file to manage multiple SSH connections][20]
  * [Adding public key to SSH server for password less authentication][21]
  * [SSH hardening tips][22] to secure your SSH server



If you find it overwhelming, [Linux Handbook has a premium video course that explains SSH for beginners][23] along with hands-on labs to follow. This will give you a more streamlined knowledge of the topic.

Happy remote working!

--------------------------------------------------------------------------------

via: https://itsfoss.com/set-up-ssh-ubuntu/

作者：[Chris Patrick Carias Stas][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/chris/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/ssh-diagram.png?resize=800%2C259&ssl=1
[2]: https://www.openssh.com/
[3]: https://itsfoss.com/install-ubuntu-server-raspberry-pi/
[4]: https://itsfoss.com/ssh-into-raspberry/
[5]: https://itsfoss.com/update-ubuntu/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/ssh-0001.png?resize=800%2C253&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/ssh-0002.png?resize=800%2C263&ssl=1
[8]: https://itsfoss.com/set-up-firewall-gufw/
[9]: https://itsfoss.com/check-ip-address-ubuntu/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/ssh-find-ip.png?resize=800%2C341&ssl=1
[11]: https://itsfoss.com/cdn-cgi/l/email-protection
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/ssh-0004.png?resize=800%2C87&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/ssh-0005.png?resize=800%2C57&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/ssh-0006.png?resize=800%2C322&ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/ssh-0007.png?resize=800%2C87&ssl=1
[16]: https://www.putty.org/
[17]: https://juicessh.com/
[18]: https://termius.com/
[19]: https://linuxhandbook.com/ssh-basics/
[20]: https://linuxhandbook.com/ssh-config-file/
[21]: https://linuxhandbook.com/add-ssh-public-key-to-server/
[22]: https://linuxhandbook.com/ssh-hardening-tips/
[23]: https://linuxhandbook.com/sshcourse/
