Daily Computer Tips – Share Files Using The Public Folder In Windows
================================================================================
The Public folder is a useful way to share files on your computer. Whether you’re using a Windows machine or another modern OS, the Public folder offers a convenient way to make other people view files you shared with them.

Files that are put in the public folder are automatically viewable by anyone with access to the same computer or those on your network provided file sharing is enabled.

Stuff in the Public folder are automatically shared with people who have access to your computer using local accounts or network access.

The Public folder is not the only way to share documents with people you want to share with but it’s another way to do it that requires no complicated setup.

### Where is the Public Folder ###

In Windows, the Public folder is at **C:\Users\Public**. By default, you’ll see the following folders in it: Documents, Downloads, Music, Pictures and Videos.

In Ubuntu, the Public folder is in your home folder. Open Nautilus and in your Home folder, you’ll see the Public folder.

### How to access folders put in the Public folder ###

 Again, any file in the Public folder it will automatically be visible to everyone on the local machine. In Ubuntu, all users personal folders are automatically visible to everyone who has an account on the machine. This is a huge problem in Ubuntu.

If you want to prevent everyone from viewing your home folder automatically in Ubuntu, read previous post on [preventing users from browsing your folders in Ubuntu][1].

For users on the same machine with the shared documents using Windows, open File Explorer or Windows Explorer. Go to the **Local Disk ( C: )** and browse to **C:\Users\Public** to view the shared documents.

To access the document remotely over the network, use this UNC path:  **\\Computer_Name\Users\Public**. File sharing must be enabled on the Windows computer before anyone can access files remotely. Read about [file sharing in Windows here][2].

You must also disable or turn off password protected sharing from the Advanced file sharing page.

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/windowspublicfolder_1.png)

With Samba installed in Ubuntu, users can access shared public files in Microsoft Windows from Nautilus. See the screenshot below.

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/windowspublicfolder.png)

Samba must first be installed on the Ubuntu machine and File sharing enabled on the Windows computer before this will work. When everything is setup, use Ubuntu or other OS to view Windows public shares.

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/windowspublicfolder_2.png)

You’ll be able to access the page without password prompts.

The thing to remember when connecting via network sharing is,

- public sharing must be enabled on the Windows machine
- Turn off password protected sharing
- If using Ubuntu, make sure Samba is installed and both machine on the same network

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-computer-tips-share-files-using-public-the-folder-in-windows/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.liberiangeek.net/2013/09/daily-ubuntu-tipsprevent-users-browsing-folders/
[2]:http://www.liberiangeek.net/2013/08/windows-8-and-ubuntu-filesharing-made-easy/