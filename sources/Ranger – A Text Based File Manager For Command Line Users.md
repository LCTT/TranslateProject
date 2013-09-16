Ranger – A Text Based File Manager For Command Line Users
=========================================================

Graphical file managers are an integral part of everybody’s day-to-day computer work. Most of the users are happy using the default file manager and aren’t much bothered about exploring alternative file managers. But, when it comes to CLI file managers, users may well be interested in trying various available file managers before settling down with the best — that suits their needs. In this article, we will discuss/review Ranger – a command line based file manager.


![img](http://mylinuxbook.com/wp-content/uploads/2013/09/ranger-main.png "ranger-main")
NOTE – All the examples and instructions presented in this article are tested on Ubuntu 13.04.

##Ranger – The Command Line File Manager

Ranger is an ncurses based command line file manager that has a simple and minimalistic user interface. It uses basic vi key bindings for navigation and is capable of previewing files and opening them with default programs.

###How To Use It

Just type the command ranger on command line to execute this utility. Here is a snapshot of ranger when executed on my system from the directory /home/himanshu.

![img](http://mylinuxbook.com/wp-content/uploads/2013/09/ranger-1.png "ranger-1")

You can see that ranger displays directories, sub-directories and their contents in separate columns. For example, the left most column in the window shown above represents the three directories present in the /home directory of my system. Out of these three, the himanshu directory is currently selected.

The second column represents the subdirectories of the himanshu directory. Out of these, the subdirectory Pictures is currently selected. Similarly, the third column represents all the files present in the Pictures directory.

NOTE – You can use the left/right arrow keys to select a specific column and then use up/down arrow keys to navigate within that column.

Ranger uses default programs to display different types of files. For example, when I navigated to the third column shown the earlier screen-shot and pressed enter after selecting the file workspace_switcher.png, here is what showed up :

![img](http://mylinuxbook.com/wp-content/uploads/2013/09/ranger-2.png "ranger-2")

So you can see that ranger opened the file in an image viewer. Another feature of this file manager is that the files can be previewed within the file manager as soon as they are selected.

Here is an example screen-shot :

![img](http://mylinuxbook.com/wp-content/uploads/2013/09/ranger-3.png "ranger-3")

So you can see that as soon as the file CMS was selected, a preview of its contents was displayed on right hand side of the window.  If it is desired to read the complete file, just hit the right arrow and the file will be opened in vi/vim editor. Quit the vi/vim editor using :q to come back to file manager.

NOTE – Preview of Images requires some dependencies to be fulfilled. For more information on this, read the Dependencies section [here][1].

Here are some tips regarding the usage of ranger :

- Select a file, press y to copy it and then navigate into the destination folder and then press p to paste.
- Type **:delete** to delete the currently selected file.
- Use ? to open the man page of ranger from within the file manager and press q to come back to the file manager.
- Being ncurses based, the up-down scroll can be easily done through mouse.

###Download/Install

Here are some important links related to ranger file manager :

- [Home Page][2]
- [Download][3]

I downloaded and installed this utility through command line through apt-get. Ubuntu users can also use Ubuntu Software Centre to download and install this utility. The version used for this review was 1.5.4-1.

Download and installation completed smoothly without any problems.

**Pros**

- Easy navigation
- Minimalistic UI
- Control using vi/vim style commands

**Cons**

- Good only for basic file management operations
- Preview features requires dependencies to be fulfilled

**Conclusion**

Ranger is a fine utility that does what is promises to do. I would recommend this utility to those users who work on servers (containing no GUI). If you spend a lot of time on command line and are looking for a good command line file manager, Ranger could be a good option.. If your expectations aren’t too high, ranger should not disappoint you.

via: http://mylinuxbook.com/ranger-command-line-file-manager/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://ranger.nongnu.org/
[2]:http://ranger.nongnu.org/index.html
[3]:http://ranger.nongnu.org/download.html

