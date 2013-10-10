Use Python To SSH To Your Machine
================================================================================
It is time for some python programming. I love automating stuff and this time I will show you guys how to connect to your machine via **ssh using python** and run command on it. It is not hard, but at the same time not very easy to do this in python, since there are many modules and libraries to do this task.  Are you curious about the module we will use in this tutorial?

We will use  pxssh class of the pexpect module in Python which is used to to take care of some of the automation needs, like ssh and ftp. Do you want to make your sysadmin lifestyle as easy as possible? Then, why don’t you focus on this tutorial and try to learn as much as possible? Ok ,ok, i got your attention now, so let me give you guys a simple description about pxssh. You can also get information about pxssh by typing help(pxssh) after importing it in a python interactive shell.

**Pxssh Description**

Pxssh is based on pexpect. It’s class extends pexpect.spawn to specialize setting up SSH connections. I use pxssh frequently for making ssh connections in python. Pxssh uses the shell prompt to synchronize output from the remote host. In order to make this more robust it sets the shell prompt to something more unique than just $ or #. This should work on most Borne/Bash or Csh style shells.

You can read more about pxssh [here][1].

Now let the fun begin.

In the first step, we import everything we need and assign machine details to variables like shown in Figure 1.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/ssh1.png)

Figure 1

Then we create a function which will use  pxssh to  create and start a connection with the ssh server.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/ssh2.png)

Figure 2

Study carefully how we use try and except so we can handle errors. Read more about error handling in python here.

What is the next step?

The next step is to create a function which will send the command to the machine after the ssh connection between two machines is established.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/ssh3.png)

Figure 3

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/ssh4.png)

Figure 4

Now close the file and save it.  It is ready to run.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/use-python-ssh-machine/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://pexpect.sourceforge.net/pxssh.html