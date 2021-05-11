[#]: subject: (Send your scans to a Linux machine over your network)
[#]: via: (https://opensource.com/article/21/4/linux-scan-samba)
[#]: author: (Marc Skinner https://opensource.com/users/marc-skinner)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Send your scans to a Linux machine over your network
======
Set up a Samba share to make a scanner easily accessible by a Linux
computer over your network.
![Files in a folder][1]

The free software movement famously got started [because of a poorly designed printer][2]. Decades later, printer and scanner manufacturers continue to reinvent the wheel, ignoring established and universal protocols. As a result, every now and again, you'll stumble onto a printer or scanner that just doesn't seem to work with your operating system.

This happened to me recently with a Canon 3-in-1 scanner (the Canon Maxify MB2720). I was able to solve the scanner's problem with open source. Specifically, I set up a Samba share to make the scanner available on my network.

The [Samba project][3] is a Windows interoperability suite of programs for Linux and Unix. Although it's mostly low-level code that many users never knowingly interact with, the software makes it easy to share files over your local network, regardless of what platforms are used.

I'm using Fedora, so these instructions should work for any RPM-based Linux distribution. Minor modifications may be necessary for other distributions. Here's how I did it.

### Get the Canon tools

Download the required Windows Canon Quick Utility Toolbox software from Canon's website. The software is required because it is the only way to configure the printer's destination folder location and credentials. Once this is done, you do not need to use the tool unless you want to make a change.

Before configuring the printer, you must set up a Samba share on your Linux computer or server. Install Samba with the following command:


```
`$ sudo dnf -y install samba`
```

Create `/etc/smb.conf` file with the following content:


```
[global]
        workgroup = WORKGROUP
        netbios name = MYSERVER
        security = user
        #CORE needed for CANON PRINTER SCAN FOLDER
        min protocol = CORE
        #NTML AUTHV1 needed for CANON PRINTER SCAN FOLDER
        ntlm auth = yes
        passdb backend = tdbsam

        printing = cups
        printcap name = cups
        load printers = no
        cups options = raw

        hosts allow = 127. 192.168.33.
        max smbd processes = 1000

[homes]
        comment = Home Directories
        valid users = %S, %D%w%S
        browseable = No
        writable = yes
        read only = No
        inherit acls = Yes

[SCANS]
        comment = MB2720 SCANS
        path = /mnt/SCANS
        public = yes
        writable = yes
        browseable = yes
        printable = no
        force user = tux
        create mask = 770
```

In the `force user` line near the end, change the username from `tux` to your own username.

Unfortunately, the Canon printer won't work with Server Message Block ([SMB][4]) protocols higher than CORE or NTML authentication v2. For this reason, the Samba share must be configured with the oldest SMB protocol and NTML authentication versions. This is not ideal by any means and has security implications, so I created a separate Samba server dedicated to the scanner use case. My other Samba server, which shares all home networked files, still uses SMB protocol 3 and NTML authentication v2.

Start the Samba server service and enable it for restart:


```
$ sudo systemctl start smb
$ sudo systemctl enable smb
```

### Create a Samba user

Create your Samba user and a password for it:


```
`$ sudo smbpasswd -a tux`
```

Enter your password at the prompt.

Assuming you want to mount your Samba scans on a Linux system, you need to do a few steps.

Create a Samba client credentials file. Mine looks like this:


```
$ sudo cat /root/smb-credentials.txt
username=tux
password=mySTRONGpassword
```

Change the permissions so that it isn't world-readable:


```
`$ sudo chmod 640 /root/smb-credentials.txt`
```

Create a mount point and add it to `/etc/fstab`:


```
`$ sudo mkdir /mnt/MB2720-SCANS`
```

Add the following line into your `/etc/fstab`:


```
`//192.168.33.50/SCANS  /mnt/MB2720-SCANS  cifs vers=3.0,credentials=/root/smb-credentials.txt,gid=1000,uid=1000,_netdev    0 0`
```

This mounts the Samba share scans to the new mount point using [CIFS][5], forcing SMBv3, and using the username and password stored in `/root/smb-credetials.txt`. It also passes the user's group identifier (GID) and the user identifier (UID), giving you full ownership of the Linux mount. The `_netdev` option is required so that the mount point is mounted after networking is fully functional (after a reboot, for instance) because this mount requires networking to be accessed.

### Configure the Canon software

Now that you have created the Samba share, configured it on the server, and configured the share to be mounted on your Linux client, you need to launch the Canon Quick Utility Toolbox to configure the printer. Because Canon doesn't release this toolbox for Linux, this step requires Windows. You can try [running it on WINE][6], but should that fail, you'll have to either borrow a Windows computer from someone or run a [Windows developer virtual machine][7] in [GNOME Boxes][8] or [VirtualBox][9].

Power on the printer, and then start the Canon Quick Utility Toolbox. It should find your printer. If it can't see your printer, you must configure the printer for either LAN or wireless networking first.

In the toolbox, click on **Destination Folder Settings**.

![Canon Quick Utility Toolbox][10]

(Marc Skinner, [CC BY-SA 4.0][11])

Enter the printer administration password—my default password was **canon**.

Click the **Add** button.

![Add destination folder][12]

Fill out the form with a Displayed Name, your Samba share location, and your Samba username and password.

I left the PIN Code blank, but if you want to require a PIN to be entered each time you scan from the printer, you can set one. This would be useful in an office where each user has their own Samba share and PIN to protect their scans.

Click **Connection Test** to validate the form data.

Click the **OK** button.

Click **Register to Printer** to save your configuration back to the printer.

![Register to Printer ][13]

(Marc Skinner, [CC BY-SA 4.0][11])

Everything is set up. Click **Exit**. You're done with Windows now, and probably the toolbox, unless you need to change something.

### Start scanning

You can now scan from the printer and select your Destination Folder from its LCD menu. Scans are saved directly to the Samba share, which you have access to from your Linux computer.

For convenience, create a symbolic link on your Linux desktop or home directory with the following command:


```
`$ sudo ln -sd /mnt/MB2720-SCANS /home/tux/Desktop/MB2720-SCANS`
```

That's all there is to it!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/linux-scan-samba

作者：[Marc Skinner][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/marc-skinner
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_paper_folder.png?itok=eIJWac15 (Files in a folder)
[2]: https://opensource.com/article/18/2/pivotal-moments-history-open-source
[3]: http://samba.org/
[4]: https://en.wikipedia.org/wiki/Server_Message_Block
[5]: https://searchstorage.techtarget.com/definition/Common-Internet-File-System-CIFS
[6]: https://opensource.com/article/21/2/linux-wine
[7]: https://developer.microsoft.com/en-us/windows/downloads/virtual-machines/
[8]: https://opensource.com/article/19/5/getting-started-gnome-boxes-virtualization
[9]: https://www.virtualbox.org/
[10]: https://opensource.com/sites/default/files/uploads/canontoolbox.png (Canon Quick Utility Toolbox)
[11]: https://creativecommons.org/licenses/by-sa/4.0/
[12]: https://opensource.com/sites/default/files/add_destination_folder.png (Add destination folder)
[13]: https://opensource.com/sites/default/files/uploads/canonregistertoprinter.png (Register to Printer )
