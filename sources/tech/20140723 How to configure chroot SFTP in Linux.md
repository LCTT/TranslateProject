Translating by GOLinux... 
How to configure chroot SFTP in Linux
================================================================================
There are **some scenario** where system admin wants only few users should be  allowed to transfer files to Linux boxes not ssh. We can achieve this by setting up **SFTP** in chroot environment.

### Background of SFTP & chroot : ###

**SFTP** stands for **SSH File Transfer protocol or Secure File Transfer Protocol**. SFTP provides file access, file transfer, and file management functionalities over any reliable data stream. When we configure SFTP in chroot environment , then only allowed users will be limited to their **home directory** , or we can say allowed users will be in jail like environment where they can’t even change their directory.

In article we will configure **Chroot SFTP in RHEL 6.X** & **CentOS 6.X**. We have one user ‘**Jack**’ , this users will be allowed to transfer files on linux box but no ssh access.

### Step:1  Create a group ###

    [root@localhost ~]# groupadd  sftp_users

### Step:2 Assign the secondary group(sftp_users) to the user. ###

If the users doesn’t exist on system , use below command :

    [root@localhost ~]# useradd  -G sftp_users  -s /sbin/nologin  jack
    [root@localhost ~]# passwd jack

For **already existing users** , use below usermod command :

    [root@localhost ~]# usermod –G sftp_users  -s /sbin/nologin  jack

**Note** : if you want to change the **default home directory** of users , then use ‘**-d**’ option in useradd and usermod  command and set the **correct permissions**.

### Step:3 Now edit the config file “/etc/ssh/sshd_config” ###

    # vi /etc/ssh/sshd_config
    #comment out the below line and add a line like below
    #Subsystem sftp /usr/libexec/openssh/sftp-server
    Subsystem sftp internal-sftp
    
    # add Below lines  at the end of file
    Match Group sftp_users
      X11Forwarding no
      AllowTcpForwarding no
      ChrootDirectory %h                      
      ForceCommand internal-sftp

#### Where : ####

- **Match Group sftp_users** – This indicates that the following lines will be matched only for users who belong to group sftp_users
- **ChrootDirectory %h** – This is the path(default user's home directory) that will be used for chroot after the user is authenticated. So, for Jack, this will be /home/jack.
- **ForceCommand internal-sftp** – This forces the execution of the internal-sftp and ignores any command that are mentioned in the ~/.ssh/rc file.

Restart the ssh service

    # service sshd restart

### Step:4 Set the Permissions : ###

    [root@localhost ~]# chmod 755 /home/jack
    [root@localhost ~]# chown root /home/jack
    [root@localhost ~]# chgrp -R sftp_users /home/jack

If You want that jack user should be allowed to upload files , then create a upload folder with the below permissions ,

    [root@localhost jack]# mkdir /home/jack/upload
    [root@localhost jack]# chown jack. /home/jack upload/

### Step:5  Now try to access the system & do testing ###

Try to access the system via ssh 

![](http://www.linuxtechi.com/wp-content/uploads/2014/07/ssh-try.png)

As You can see below jack user is logged in  via SFTP and can't change the directory becuase of chroot environment.

![](http://www.linuxtechi.com/wp-content/uploads/2014/07/sftp-login.png)

Now do the **uploading and downloading** testing as shown below:

![](http://www.linuxtechi.com/wp-content/uploads/2014/07/sftp-upload-download.png)

As we can see above , both uploading & downloading working fine for jack user.

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/configure-chroot-sftp-in-linux/

原文作者：[Pradeep Kumar][a]

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
