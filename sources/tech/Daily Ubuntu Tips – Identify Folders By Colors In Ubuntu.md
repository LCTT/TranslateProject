Daily Ubuntu Tips – Identify Folders By Colors In Ubuntu
================================================================================
Here’s a brief tip that will show you how to identify folders by colors in Ubuntu 14.04 or previous with this nifty tool. This tool which is called **Folder Color**, allows users to change the color of folders in Nautilus so they could easily indentify and distinguish them from others.

It is designed to work with Nautilus can be used with other Icon themes in Ubuntu. It’s nice tool to install. It’s light weight and doesn’t interface with your system’s performance.

Installing it is easy and this brief tutorial is going to show you how.

For example, if you want to color important files folder red, or travel documents yellow, you can change them easily with Folder Color.

Here’s how to install this tool.

In Ubuntu, press **Ctrl – Alt – T** on your keyboard to open the terminal console. When it opens, run the commands below to add the below PPA archive.

    sudo add-apt-repository ppa:costales/folder-color

Next, run the commands below to update your system and install Folder Color.

    sudo apt-get update && sudo apt-get install folder-color

That’s it. Now all you have to do is log out and log back in or restart Nautilus. Then go to Nautilus, right-click on the folder you wish to change and select the color. There are pre-defined colors to choose from which isn’t as many as you may want, but enough for the average users.

If you wish to uninstall it, run the commands below to remove the PPA archive.

    sudo add-apt-repository -r ppa:costales/folder-color

Finally, run the commands below to remove Folder Color

    sudo apt-get update && sudo apt-get remove folder-color

Enjoy!

![](http://www.liberiangeek.net/wp-content/uploads/2014/04/foldercolorubuntu.png)

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/04/daily-ubuntu-tips-identify-folders-by-colors-in-ubuntu/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:
[16]:
[17]:
[18]:
[19]:
[20]: