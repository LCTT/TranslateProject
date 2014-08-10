Translating by GOLinux ...
How to set up a Samba file server to use with Windows clients
================================================================================
According to the [Samba][1] project web site, Samba is an open source/free software suite that provides seamless file and print services to SMB/CIFS clients. Unlike other implementations of the SMB/CIFS networking protocol (such as LM Server for HP-UX, LAN Server for OS/2, or VisionFS), Samba (along with its source code) is freely available (at no cost to the end user), and allows for interoperability between Linux/Unix servers and Windows/Unix/Linux clients. 

For these reasons, Samba is the preferred solution for a file server in networks where different operating systems (other than Linux) coexist - the most common setup being the case of multiple Microsoft Windows clients accessing a Linux server where Samba is installed, which is the situation we are going to deal with in this article.

Please note that on the other hand, if our network consists of only Unix-based clients (such as Linux, AIX, or Solaris, to name a few examples), we can consider using NFS (although Samba is still an option in this case), which has greater reported speeds.

### Installing Samba in Debian and CentOS ###

Before we proceed with the installation, we can use our operating system's package management system to look for information about Samba:

On Debian:

    # aptitude show samba

On CentOS:

    # yum info samba

In the following screenshot we can see the output of 'aptitude show samba' ('yum info samba' yields similar results):

![](https://farm4.staticflickr.com/3868/14837993244_0fa525eb35_z.jpg)

Now let's install Samba (the screenshot below corresponds to the installation on a Debian 7 [Wheezy] server):

On Debian:

    # aptitude install samba

On CentOS:

    # yum install samba

### Adding Users to Samba ###

For versions earlier than 4.x, a local Unix account is required for adding users to Samba:

    # adduser <username> 

![](https://farm6.staticflickr.com/5574/14837266181_fed68bddf2_o.png)

Next, we need to add the user to Samba using the smbpasswd command with the '-a' option, which specifies that the username following should be added to the local smbpasswd file. We will be prompted to enter a password (which does not necessarily have to be the same as the password of the local Unix account):

    # smbpassword -a <username> 

![](https://farm6.staticflickr.com/5555/14653711099_578f8613ca.jpg)

Finally, we will give access to user xmodulo to a directory within our system that will be used as a Samba share for him (and other users as well, if needed). This is done by opening the /etc/samba/smb.conf file with a text editor (such as Vim), navigating to the end of the file, and creating a section (enclose name between square brackets) with a descriptive name, such as [xmodulo]:

    # SAMBA SHARE
    [xmodulo]
    path = /home/xmodulo
    available = yes
    valid users = xmodulo
    read only = no
    browseable = yes
    public = yes
    writeable = yes

We must now restart Samba and -just in case- check the smb.conf file for syntax errors with the testparm command:

    # service samba restart
    # testparm 

![](https://farm6.staticflickr.com/5589/14653655390_becb4f4981_z.jpg)

If there are any errors, they will be reported when testparm ends.

### Mapping the Samba Share as a Network Drive on a Windows 7 PC ###

Right click on Computer, and select "Map network drive":

![](https://farm6.staticflickr.com/5571/14837993154_981b73ea92.jpg)

Type the IP address of the machine where Samba is installed, followed by the name of the share (this is the name that is enclosed between single brackets in the smb.conf file), and make sure that the "Connect using different credentials" checkbox is checked:

![](https://farm4.staticflickr.com/3881/14839997172_d67ec98933_o.png)

nter the username and password that were set with '**smbpasswd -a**' earlier:

![](https://farm6.staticflickr.com/5563/14653711029_ddfea53bd6_o.png)

Go to Computer and check if the network drive has been added correctly:

![](https://farm6.staticflickr.com/5584/14837993124_c664728039_o.png)

As a test, let's create a pdf file from the man page of Samba, and save it in the /home/xmodulo directory:

![](https://farm6.staticflickr.com/5593/14860219723_e8380f0d0f_o.png)

Next, we can verify that the file is accessible from Windows:

![](https://farm4.staticflickr.com/3869/14817386696_74a12dfdcd_o.png)

And we can open it using our default pdf reader:

![](https://farm6.staticflickr.com/5584/14653655350_8a243b1493_z.jpg)

Finally, let's see if we can save a file from Windows in our newly mapped network drive. We will open the change.log file that lists the features of Notepad++:

![](https://farm6.staticflickr.com/5565/14817386676_18c1d7bc60_o.png)

and try to save it in Z:\ as a plain text file (.txt extension); then let's see if the file is visible in Linux:

![](https://farm4.staticflickr.com/3841/14817386656_fb09a95a65_o.png)

### Enabling quotas ###

As a first step, we need to verify whether the current kernel has been compiled with quota support:

    # cat /boot/config-$(uname -r) | grep 

![](https://farm4.staticflickr.com/3867/14837993054_081dc9b0dc_z.jpg)

Each file system has up to five types of quota limits that can be enforced on it: user soft limit, user hard limit, group soft limit, group hard limit, and grace time.

We will now enable quotas for the /home file system by adding the usrquota and grpquota mount options to the existing defaults option in the line that corresponds to the /home filesystem in the /etc/fstab file, and we will remount the file system in order to apply the changes:

![](https://farm6.staticflickr.com/5561/14653806067_b8b0dc2333_z.jpg)

Next, we need to create two files that will serve as the databases for user and group quotas: **aquota.user** and **aquota.group**, respectively, in **/home**. Then, we will generate the table of current disk usage per file system with quotas enabled:

    # quotacheck -cug /home
    # quotacheck -avugm 

![](https://farm6.staticflickr.com/5584/14837265971_654e8f3bc0_o.png)

    # quota -u <username>
    # quota -g <groupname> 

![](https://farm6.staticflickr.com/5582/14653735848_8de88d69c4_o.png)

Finally, the last couple of steps consist of assigning the quotas per user and / or group with the quotatool command (note that this task can also be performed by using edquota, but quotatool is more straightforward and less error-prone).

To set the soft limits to 4 MB and the hard limit to 5 MB for the user called xmodulo, and 10 MB / 15 MB for the xmodulo group:

    # quotatool -u xmodulo -bq 4M -l '5 Mb' /home
    # quotatool -g xmodulo -bq 10M -l '15 Mb' /home 

![](https://farm4.staticflickr.com/3888/14653806037_5438b5034e_z.jpg)

And we can see the results in Windows 7 (3.98 MB free of 4.00 MB):

![](https://farm4.staticflickr.com/3919/14653805967_c2b1551869_o.png)

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/samba-file-server-windows-clients.html

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/gabriel
[1]:http://www.samba.org/
