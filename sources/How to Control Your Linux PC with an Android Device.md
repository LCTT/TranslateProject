How to Control Your Linux PC with an Android Device
================================================================================
**The following tutorial will teach all Linux users how to install SSH on their systems, in order to access their computers remotely from an Android tablet of smartphone.**

![](http://i1-news.softpedia-static.com/images/news2/How-to-Control-Your-Linux-PC-with-an-Android-Device-396004-2.jpg)

These days we all have a tablet or phablet device, and we often find ourselves later at night watching a movie or TV show, listening to music, or reading a good book. You can call this article a tutorial for the lazy, for people who are too tired at night to start some process(es) on their computer, move, delete, copy or rename some files, or even to shutdown their PC.

Yes, there are all sorts of remote desktop solutions out there, but many costs a fortune or are badly implemented and don't work as expected, forcing you to go to the PC after all and do the stuff you want to do.

For this tutorial we will use a simple, secure and effective protocol called SSH (Secure Shell), which can be easily installed from your default software repositories (openssh in Arch Linux, or openssh-server in Ubuntu).

### Configuring the SSH server ###

After installation, you will need to do basic configuration for the SSH server. For this, you need to edit the /etc/ssh/sshd_config file with a text editor.

1. Add the following line (where yourusername will be replaced with your actual username on your Linux box) at the end of the file:

AllowUsers yourusername

2. Uncomment the "#PermitRootLogin yes" line and add "no" instead of "yes" making it look like this:

PermitRootLogin no

2. For security reasons, you need to modify the 22 port, which is used by default on SSH connections, to a higher port, such as 55441 in our example below (but don't use 55441, be original, find another five or four digit number). To do this, uncomment and edit the "#Port 22" line to look like this:

    Port 55441

### Starting the SSH server ###

On Ubuntu, the SSH service can be started using the following command:

    sudo /etc/init.d/ssh start

...and every time you make modifications to the aforementioned configuration file, you can restart it using the following command:

    sudo /etc/init.d/ssh restart

On Arch Linux you can start the SSH service using the following command:

    sudo systemctl start sshd

### Configuring the SSH client on your Android device ###

One of the best SSH clients for Android appears to be JuiceSSH, which is free, but those who find it poor in functionality, can pay a small amount of money for more advanced features, such as Amazon AWS/EC2 integration, team collaboration, and much more.

Once the software is installed, open it and you will be asked to add an encryption password, which will keep your connections safe, encrypted with AES-256 so no one can access them in case your device is stolen.

![](http://i1-news.softpedia-static.com/images/extra/LINUX/large/sshlinuxandroid-large_001.jpg)

Now, add a new connection by choosing a name, the IP address of your computer, the port set above, and an identity, which needs to be created...

![](http://i1-news.softpedia-static.com/images/extra/LINUX/large/sshlinuxandroid-large_002.jpg)

![](http://i1-news.softpedia-static.com/images/extra/LINUX/large/sshlinuxandroid-large_003.jpg)

...and here's my Arch Linux box, as viewed from the JuiceSSH client on my Android tablet. Do not hesitate to comment below if you run into problems during this tutorial.

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Control-Your-Linux-PC-with-an-Android-Device-396004.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出