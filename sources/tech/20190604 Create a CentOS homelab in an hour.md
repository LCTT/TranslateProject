[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create a CentOS homelab in an hour)
[#]: via: (https://opensource.com/article/19/6/create-centos-homelab-hour)
[#]: author: (Bob Murphy https://opensource.com/users/murph)

Create a CentOS homelab in an hour
======
Set up a self-sustained set of basic Linux servers with nothing more
than a system with virtualization software, a CentOS ISO, and about an
hour of your time.
![metrics and data shown on a computer screen][1]

When working on new Linux skills (or, as I was, studying for a Linux certification), it is helpful to have a few virtual machines (VMs) available on your laptop so you can do some learning on the go.

But what happens if you are working somewhere without a good internet connection and you want to work on a web server? What about using other software that you don't already have installed? If you were depending on downloading it from the distribution's repositories, you may be out of luck. With a bit of preparation, you can set up a [homelab][2] that will allow you to install anything you need wherever you are, with or without a network connection.

The requirements are:

  * A downloaded ISO file of the Linux distribution you intend to use (for example, CentOS, Red Hat, etc.)
  * A host computer with virtualization. I use [Fedora][3] with [KVM][4] and [virt-manager][5], but any Linux will work similarly. You could even use Windows or Mac with virtualization, with some difference in implementation
  * About an hour of time



### 1\. Create a VM for your repo host

Use virt-manager to create a VM with modest specs; 1GB RAM, one CPU, and 16GB of disk space are plenty.

Install [CentOS 7][6] on the VM.

![Installing a CentOS homelab][7]

Select your language and continue.

Click _Installation Destination_ , select your local disk, mark the _Automatically Configure Partitioning_ checkbox, and click *Done *in the upper-left corner.

Under _Software Selection_ , select _Infrastructure Server_ , mark the _FTP Server_ checkbox, and click _Done_.

![Installing a CentOS homelab][8]

Select _Network and Host Name_ , enable Ethernet in the upper-right, then click _Done_ in the upper-left corner.

Click _Begin Installation_ to start installing the OS.

You must create a root password, then you can create a user with a password as it installs.

### 2\. Start the FTP service

The next step is to start and set the FTP service to run and allow it through the firewall.

Log in with your root password, then start the FTP server:


```
`systemctl start vsftpd`
```

Enable it to work on every start:


```
`systemctl enable vsftpd`
```

Set the port as allowed through the firewall:


```
`firewall-cmd --add-service=ftp --perm`
```

Enable this change immediately:


```
`firewall-cmd --reload`
```

Get your IP address:


```
`ip a`
```

(it's probably **eth0** ). You'll need it in a minute.

### 3\. Copy the files for your local repository

Mount the CD you installed from to your VM through your virtualization software.

Create a directory for the CD to be mounted to temporarily:


```
`mkdir /root/temp`
```

Mount the install CD:


```
`mount /dev/cdrom /root/temp`
```

Copy all the files to the FTP server directory:


```
`rsync -avhP /root/temp/ /var/ftp/pub/`
```

### 4\. Point the server to the local repository

Red Hat-based systems use files that end in **.repo** to identify where to get updates and new software. Those files can be found at


```
`cd /etc/yum.repos.d`
```

You need to get rid of the repo files that point your server to look to the CentOS repositories on the internet. I prefer to copy them to root's home directory to get them out of the way:


```
`mv * ~`
```

Then create a new repo file to point to your server. Use your favorite text editor to create a file named **network.repo** with the following lines (substituting the IP address you got in step 2 for _< your IP>_), then save it:


```
[network]
name=network
baseurl=<ftp://192.168.122.\><your ip>/pub
gpgcheck=0
```

When that's done, we can test it out with the following:


```
`yum clean all; yum install ftp`
```

If your FTP client installs as expected from the "network" repository, your local repo is set up!

![Installing a CentOS homelab][9]

### 5\. Install a new VM with the repository you set up

Go back to the virtual machine manager, and create another VM—but this time, select _Network Install_ with a URL of:


```
`ftp://192.168.122.<your IP>/pub`
```

If you're using a different host OS or virtualization manager, install your VM similarly as before, and skip to the next section.

### 6\. Set the new VM to use your existing network repository

You can copy the repo file from your existing server to use here.

As in the first server example, enter:


```
cd /etc/yum.repos.d
mv * ~
```

Then:


```
`scp root@192.168.122.<your IP>:/etc/yum.repos.d/network.repo /etc/yum.repos.d`
```

Now you should be ready to work with your new VM and get all your software from your local repository.

Test this again:


```
`yum clean all; yum install screen`
```

This will install your software from your local repo server.

This setup, which gives you independence from the network with the ability to install software, can create a much more dependable environment for expanding your skills on the road.

* * *

_Bob Murphy will present this topic as well as an introduction to[GNU Screen][10] at [Southeast Linux Fest][11], June 15-16 in Charlotte, N.C._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/create-centos-homelab-hour

作者：[Bob Murphy][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/murph
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
[2]: https://opensource.com/article/19/3/home-lab
[3]: https://getfedora.org/
[4]: https://en.wikipedia.org/wiki/Kernel-based_Virtual_Machine
[5]: https://virt-manager.org/
[6]: https://www.centos.org/download/
[7]: https://opensource.com/sites/default/files/uploads/homelab-3b_0.png (Installing a CentOS homelab)
[8]: https://opensource.com/sites/default/files/uploads/homelab-5b.png (Installing a CentOS homelab)
[9]: https://opensource.com/sites/default/files/uploads/homelab-14b.png (Installing a CentOS homelab)
[10]: https://opensource.com/article/17/3/introduction-gnu-screen
[11]: https://southeastlinuxfest.org/
