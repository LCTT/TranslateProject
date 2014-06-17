How to Share Files Between Windows, Mac, and Linux PCs on a Network
================================================================================
![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/windows-mac-and-linux-network.jpg)

Home [file sharing][1] used to be a nightmare, even between different versions of Windows — never mind Mac and Linux! These operating systems can now talk to each other and share files without any special software.

We’ll be using the SMB protocol for this. Windows uses SMB for file sharing, while both Macs and popular Linux distributions have built-in support for SMB. Microsoft even [submitted patches][2] to the open-source Samba project to improve it!

### Share a Folder on Windows ###

You’ll need to [enable old-fashioned file sharing on Windows][3], as other operating systems can’t access homegroups. To do this, open the Control Panel and navigate to Network and Sharing > Change advanced sharing settings. Enable “network discovery” and “file and print sharing.”

Tweak the other options here if you’d like to share public folders over the network without requiring a password.

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/enable-file-and-printer-sharing-for-mac-and-linux-on-windows.png)

Locate the folder you want to share in Windows Explorer or File Explorer, right-click it, and select Properties. Click the Sharing tab and use the options here to share a folder and configure its permissions.

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/share-windows-folders-with-mac-and-linux-on-local-network.png)

### Access a Shared Folder from Windows ###

Visit the Network pane in Windows Explorer or File Explorer to view other computers sharing files with you. You’ll see properly configured Mac and Linux computers appear in this list along with nearby Windows PCs. Double-click a computer to view its shared files.

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/access-ubuntu-linux-shared-folder-on-windows.png)

You can also connect directly to a computer if you know its name or IP address. Just type //COMPUTERNAME into Windows Explorer or File Explorer’s location bar and press Enter. Replace COMPUTERNAME with the computer’s local IP address if you want to connect directly to an IP address instead.

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/directly-access-network-share-on-windows.png)

### Share a Folder on Mac OS X ###

You’ll need to enable network file sharing to share folders on your Mac. Open System Preferences by clicking the Apple logo and selecting System Preferences. Click the Sharing icon and enable File Sharing. Click the Options button here and ensure “Share files and folders using SMB” is enabled.

Use the Shared Folders column to choose additional folders to share. Use the Users column to choose which users and groups can access and write to them.

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/share-folder-with-windows-from-mac-os-x.png)

### Access a Shared Folder from Mac OS X ###

Open the Finder, click Go on the menu at the top of the screen, and select Connect to Server. Enter the following address, replacing COMPUTERNAME with the Windows computer’s name: smb://COMPUTERNAME. You can also enter the other computer’s local IP address instead of its name.

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/directly-connect-to-windows-file-share-on-a-mac.png)

You’ll be prompted to authenticate with the appropriate credentials or log in as a guest. After you’ve connected, the computer will appear under the Shared column in the Finder’s sidebar.

To automatically connect to the shared folder each time you log in, open the System Preferences window and navigate to Users and Groups > Login Items. Drag and drop the network share from under the Shared column in Finder to the list of Login Items.

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/windows-shared-folder-on-mac.png)

### Share a Folder on Linux ###

Use your desktop’s file manager to share a folder on Linux. We used the Nautilus file manager on Ubuntu 14.04 here, but the process should be similar with other file managers.

Open the file manager, right-click a folder you want to share, and select Properties. Click the Local Network Share tab and enable sharing for that folder. If this is the first time you’ve enabled sharing, you’ll be prompted to download and install the Samba software — this happens automatically when you provide your password.

Configure your sharing settings after installing the Samba software — be sure to click the Create Share button to start sharing the folder.

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/share-folder-from-ubuntu-linux-with-windows-pc-over-local-network.png)

### Access a Shared Folder from Linux ###

Your Linux deksotp’s file manager probably includes a network browser you can use to locate and access shared folders on the local network.

Click the Browse Network option in the file manager’s sidebar. You can then double-click the Windows Network option, double-click your workgroup (WORKGROUP by default), and double-click a nearby computer to view its shared files.

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/browse-windows-network-shares-on-ubuntu.png)

To connect directly to a computer, select the Connect to Server option in Nautilus instead and enter the path to the remote computer like so: smb://COMPUTERNAME

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/directly-connect-to-windows-shared-folder-on-ubuntu.png)

However you connect, you may need to authenticate with a user account name and password that has access to the files on the remote machine. This depends on whether you enabled guest access and how you set up your folder sharing permissions.

--------------------------------------------------------------------------------

via: http://www.howtogeek.com/191116/how-to-share-files-between-windows-mac-and-linux-pcs-on-a-network/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.howtogeek.com/166407/how-to-easily-share-files-between-nearby-computers/
[2]:http://www.samba.org/samba/news/developers/ms-patch.html
[3]:http://www.howtogeek.com/school/windows-network-sharing/lesson3/