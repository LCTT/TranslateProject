<<<<<<< HEAD
(translating by whatever1992)

=======
crowner的坑
>>>>>>> 6ee657b05c5722935988e91e1fc2bfdb9e6f6c79
Daily Ubuntu Tips – Change Samba Workgroup And Computer Name
================================================================================
Here’s another question new users to Ubuntu asked the most. The answer to the question is simple but when you’re new to anything, it takes time to fully understand it.

Here’s the question we received few days ago;

> How to change samba workgroup name and computer name in Ubuntu?

For most computer Ubuntu users, changing their computer name is the least thing on their list, let alone samba workgroup. A few power users may want to learn how to do this easily with using Ubuntu.

When it comes to changing the computer name in Ubuntu, we’ve written a simple post on that which can be [found here][1]. Follow the this simple guide on [changing your computer name in Ubuntu][1] to accomplish your goal.

There maybe other ways to changing your PC name in Ubuntu but this is the easiest and fastest. For those using Ubuntu server, you can use vi or vim to edit the hostname and hosts files. Using vi or vim maybe difficult for most so only someone with knowledge of using these editors should use it.

To change Samba workgroup in Ubuntu, press **Ctrl – Alt – T** on your keyboard to open the terminal. When it opens, run the commands below to edit Samba’s configure file. 

    sudo gedit /etc/samba/smb.conf

When the file opens, make sure the line starting with workgroup in the [global] section has the word or value you want the workgroup to be. For example, if you want the workgroup to be UBGP, replace WORKGROUP with that and save the file. In most cases, you’ll have to restart the computer for the change to apply.

![](http://www.liberiangeek.net/wp-content/uploads/2013/11/workgroupubuntu.png)

This is how you change your computer name as well as its workgroup in Ubuntu. Remember, if you are doing this to share or access Windows files and folders, you must also install Samba. Without Samba, it would be difficult sharing files with Windows.

To install Samba, run the commands below.

    sudo apt-get install samba

Please come back and check out other future tips about Ubuntu.

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/11/daily-ubuntu-tips-change-samba-workgroup-and-computer-name/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.liberiangeek.net/2013/10/daily-ubuntu-tips-change-computer-name/