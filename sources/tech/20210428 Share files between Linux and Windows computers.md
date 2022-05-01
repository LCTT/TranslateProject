[#]: subject: (Share files between Linux and Windows computers)
[#]: via: (https://opensource.com/article/21/4/share-files-linux-windows)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)
[#]: collector: (lujun9972)
[#]: translator: (hanszhao80)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Share files between Linux and Windows computers
======
Set up cross-platform file sharing with Samba.
![Blue folders flying in the clouds above a city skyline][1]

If you work with different operating systems, it's handy to be able to share files between them. This article explains how to set up file access between Linux ([Fedora 33][2]) and Windows 10 using [Samba][3] and [mount.cifs][4].

Samba is the Linux implementation of the [SMB/CIFS][5] protocol, allowing direct access to shared folders and printers over a network. Mount.cifs is part of the Samba suite and allows you to mount the [CIFS][5] filesystem under Linux.

> **Caution**: These instructions are for sharing files within your private local network or in a virtualized host-only network between a Linux host machine and a virtualized Windows guest. Don't consider this article a guideline for your corporate network, as it doesn't implement the necessary cybersecurity considerations.

### Access Linux from Windows

This section explains how to access a user's Linux home directory from Windows File Explorer.

#### 1\. Install and configure Samba

Start on your Linux system by installing Samba:


```
`dnf install samba`
```

Samba is a system daemon, and its configuration file is located in `/etc/samba/smb.conf`. Its default configuration should work. If not, this minimal configuration should do the job:


```
[global]
        workgroup = SAMBA
        server string = %h server (Samba %v)
        invalid users = root
        security = user
[homes]
        comment = Home Directories
        browseable = no
        valid users = %S
        writable = yes
```

You can find a detailed description of the parameters in the [smb.conf][6] section of the project's website.

#### 2\. Modify LinuxSE

If your Linux distribution is protected by [SELinux][7] (as Fedora is), you have to enable Samba to be able to access the user's home directory:


```
`setsebool -P samba_enable_home_dirs on`
```

Check that the value is set by typing:


```
`getsebool samba_enable_home_dirs`
```

Your output should look like this:

![Sebool][8]

(Stephan Avenwedde, [CC BY-SA 4.0][9])

#### 3\. Enable your user

Samba uses a set of users and passwords that have permission to connect. Add your Linux user to the set by typing:


```
`smbpasswd -a <your-user>`
```

You will be prompted for a password. This is a _completely new_ password; it is not the current password for your account. Enter the password you want to use to log in to Samba.

To get a list of allowed user types:


```
`pdbedit -L -v`
```

Remove a user by typing:


```
`smbpasswd -x <user-name>`
```

#### 4\. Start Samba

Because Samba is a system daemon, you can start it on Fedora with:


```
`systemctl start smb`
```

This starts Samba for the current session. If you want Samba to start automatically on system startup, enter:


```
`systemctl enable smb`
```

On some systems, the Samba daemon is registered as `smbd`.

#### 4\. Configure the firewall

By default, Samba is blocked by your firewall. Allow Samba to access the network permanently by configuring the firewall.

You can do it on the command line with:


```
`firewall-cmd --add-service=samba --permanent`
```

Or you do it graphically with the firewall-config tool:

![firewall-config][10]

(Stephan Avenwedde, [CC BY-SA 4.0][9])

#### 5\. Access Samba from Windows

In Windows, open File Explorer. On the address line, type in two backslashes followed by your Linux machine's address (IP address or hostname):

![Accessing Linux machine from Windows][11]

(Stephan Avenwedde, [CC BY-SA 4.0][9])

You will be prompted for your login information. Type in the username and password combination from step 3. You should now be able to access your home directory on your Linux machine:

![Accessing Linux machine from Windows][12]

(Stephan Avenwedde, [CC BY-SA 4.0][9])

### Access Windows from Linux

The following steps explain how to access a shared Windows folder from Linux. To implement them, you need Administrator rights on your Windows user account.

#### 1\. Enable file sharing

Open the** Network and Sharing Center** either by clicking on the

**Windows Button &gt; Settings &gt; Network &amp; Internet**

or by right-clicking the little monitor icon on the bottom-right of your taskbar:

![Open network and sharing center][13]

(Stephan Avenwedde, [CC BY-SA 4.0][9])

In the window that opens, find the connection you want to use and note its profile. I used **Ethernet 3**, which is tagged as a **Public network**.

> **Caution**: Consider changing your local machine's connection profile to **Private** if your PC is frequently connected to public networks.

Remember your network profile and click on **Change advanced sharing settings**:

![Change advanced sharing settings][14]

(Stephan Avenwedde, [CC BY-SA 4.0][9])

Select the profile that corresponds to your connection and turn on **network discovery** and **file and printer sharing**:

![Network sharing settings][15]

(Stephan Avenwedde, [CC BY-SA 4.0][9])

#### 2\. Define a shared folder

Open the context menu by right-clicking on the folder you want to share, navigate to **Give access to**, and select **Specific people...** :

![Give access][16]

(Stephan Avenwedde, [CC BY-SA 4.0][9])

Check whether your current username is on the list. Click on **Share** to tag this folder as shared:

![Tag as shared][17]

(Stephan Avenwedde, [CC BY-SA 4.0][9])

You can display a list of all shared folders by entering `\\localhost` in File Explorer's address line:

![Shared folders][18]

(Stephan Avenwedde, [CC BY-SA 4.0][9])

![Shared folders][19]

(Stephan Avenwedde, [CC BY-SA 4.0][9])

#### 3\. Mount the shared folder under Linux

Go back to your Linux system, open a command shell, and create a new folder where you want to mount the Windows share:


```
`mkdir ~/WindowsShare`
```

Mounting Windows shares is done with mount.cifs, which should be installed by default. To mount your shared folder temporarily, use:


```
`sudo mount.cifs //<address-of-windows-pc>/MySharedFolder ~/WindowsShare/ -o user=<Windows-user>,uid=$UID`
```

In this command:

  * `<address-of-windows-pc>` is the Windows PC's address info (IP or hostname)
  * `<Windows-user>`is the user that is allowed to access the shared folder (from step 2)



You will be prompted for your Windows password. Enter it, and you will be able to access the shared folder on Windows with your normal Linux user.

To unmount the shared folder:


```
`sudo umount ~/WindowsShare/`
```

You can also mount a Windows shared folder on system startup. Follow [these steps][20] to configure your system accordingly.

### Summary

This shows how to establish temporary shared folder access that must be renewed after each boot. It is relatively easy to modify this configuration for permanent access. I often switch back and forth between different systems, so I consider it incredibly practical to set up direct file access.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/share-files-linux-windows

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_cloud21x_cc.png?itok=5UwC92dO (Blue folders flying in the clouds above a city skyline)
[2]: https://getfedora.org/en/workstation/download/
[3]: https://www.samba.org/
[4]: https://linux.die.net/man/8/mount.cifs
[5]: https://en.wikipedia.org/wiki/Server_Message_Block
[6]: https://www.samba.org/samba/docs/current/man-html/smb.conf.5.html
[7]: https://www.redhat.com/en/topics/linux/what-is-selinux
[8]: https://opensource.com/sites/default/files/uploads/sebool.png (Enabling Samba to enable user directory access)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://opensource.com/sites/default/files/uploads/firewall_configuration.png (firewall-config tool)
[11]: https://opensource.com/sites/default/files/uploads/windows_access_shared_1.png (Accessing Linux machine from Windows)
[12]: https://opensource.com/sites/default/files/uploads/windows_acess_shared_2.png (Accessing Linux machine from Windows)
[13]: https://opensource.com/sites/default/files/uploads/open_network_and_sharing_center.png (Open network and sharing center)
[14]: https://opensource.com/sites/default/files/uploads/network_and_sharing_center_2.png (Change advanced sharing settings)
[15]: https://opensource.com/sites/default/files/uploads/network_sharing.png (Network sharing settings)
[16]: https://opensource.com/sites/default/files/pictures/give_access_to.png (Give access)
[17]: https://opensource.com/sites/default/files/pictures/tag_as_shared.png (Tag as shared)
[18]: https://opensource.com/sites/default/files/uploads/show_shared_folder_1.png (Shared folders)
[19]: https://opensource.com/sites/default/files/uploads/show_shared_folder_2.png (Shared folders)
[20]: https://timlehr.com/auto-mount-samba-cifs-shares-via-fstab-on-linux/
