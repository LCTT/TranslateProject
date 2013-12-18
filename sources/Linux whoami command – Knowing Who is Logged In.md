(翻译中 by runningwater)
Linux whoami command – Knowing Who is Logged In
================================================================================
Generally, on your console you will find a **username is printed** on the command prompt. But in some shell such as **csh**, by default you will not see your username there. So this command particularly is used with the shell which don’t print the username on their shell.

### How do I run whoami ###

To run this command, just type whoami. For this sample we are using chs shell.

    % whoami

![](http://linoxide.com/wp-content/uploads/2013/12/csh.png)

### Whoami options ###

This command only have two options. **–help** and **–version**.

    % whoamin –help

![](http://linoxide.com/wp-content/uploads/2013/12/whoami_help.png)

This options will output the same information with **man whoami**

    % whoami –version

![](http://linoxide.com/wp-content/uploads/2013/12/whoami_version.png)

While **–version** will show you the version of whoami in your system

### Similarity ###

Whoami command has the same output with command **id -un**. It also print the username of current user.

    % id -un

![](http://linoxide.com/wp-content/uploads/2013/12/id-un.png)

### Conclusion ###

Whoami command is also used when you are doing su activity (switch user). This command can confirm you that you are logged in using a correct user. Whoami is different with who command. Who command display all logged in user while whoami not. When you are switching user, whoami will reports the current user which the owner of the session, while who command will report you the original user before you are switching user.

![](http://linoxide.com/wp-content/uploads/2013/12/whoami_vs_who.png)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-whoami-command/

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出