Daily Ubuntu Tips – Easiest Way To Access Your Files From Windows
================================================================================
Whether you’re a new user or someone with deep knowledge working with Ubuntu and Windows, one thing that’s true is using Samba is the best way to share / access Ubuntu files from Windows. It’s also easy to setup and manage using many other third-party tools.

For new users or newbies who want to learn how to quickly access Ubuntu files from Windows, this brief post is going to show you how. Our goal here is to help new users. We manage to write our tutorials so newbies can read and understand them without too much trouble.

We’re not going to go into too much details here about what Samba is or how to configure Samba to join a domain and all of that. What we’re going to do is just show you how to install and setup Samba in Ubuntu to access your files from Windows.

If you want to learn all about Samba, I suggest you search Google or Wikipedia. To get started, open your terminal / console in Ubuntu and run the commands below to install Samba and other Samba related tools.

sudo apt-get install samba cifs-utils

The above commands will install Samba and other related tools. In previous versions of Ubuntu, you may have to replace cifs-utils with **smbfs**. But if the top commands work for you, then you’re good.

Next, using gedit, open the main Samba configuration file and make the following changes. To do that, run the commands below to open Samba config file.

    sudo gedit /etc/samba/smb.conf

When the file opens, look for the line shown below and uncomment (remove the ; before the text) it. It should be like this:

    security = user

![](http://www.liberiangeek.net/wp-content/uploads/2013/10/sambausersubuntu.png)

Next, scroll down in the file and also uncomment the lines as shown below.

    [homes]

Doing this will allow users to access content in their home directories or folders.  For instance, if your uncomment the [homes], user should be able to access their home content by typing the server name followed by their account name.

    \\192.168.0.2\username

Next, run the commands below to add your account to Samba Database. Doing this allows you to use Samba to access shares.

    sudo smbpasswd -a usernmame

Replace username with your account name.

When prompted to create a password, create and confirm it. Finally, restart Samba or restart your computer.

To access your files from Windows, go **Start –> Run** and type the line below. Or open Explorer and type it as in the image below.

    \\ubuntu_machine_IP\username

![](http://www.liberiangeek.net/wp-content/uploads/2013/10/sambausersubuntu1.png)

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/10/daily-ubuntu-tips-easiest-way-access-files-windows/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)