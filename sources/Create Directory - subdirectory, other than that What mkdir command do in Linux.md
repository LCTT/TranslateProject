Create Directory - subdirectory, other than that What mkdir command do in Linux
================================================================================
After knowing about ls command for listing entries inside directory, we are now moving to creating directory in Linux system. On Linux, we can use **mkdir** command. Mkdir is short for “make directory”.

### What is mkdir ###

Mkdir is a command for creating directories in Linux system. This command is a built-in command.

### Run mkdir command ###

You can type **mkdir** directly from your console to use it.

    $ mkdir

By default, running mkdir without any parameter will create directory under the current directory. Here’s a sample of it :

![mkdir command](http://linoxide.com/wp-content/uploads/2014/01/mkdir.png)

From screenshot above, we created directory called **office**. When we run mkdir command, we are in **/home/pungki** directory. So then the new directory, which is office, is **created under /home/pungki** directory. **If we put an exact location** - for example : **/usr/local** - , then Linux will create a directory under **/usr/local** directory.

When Linux found that the directory which suppose to be created is already exist, then Linux will telling us that Linux can’t cretate it.

![mkdir directory exist](http://linoxide.com/wp-content/uploads/2014/01/mkdir_error.png)

Another pre-requisite of creating directory that **you must have access to** the location where the directory want to be created. When you don’t have it then mkdir will report an error.

![mkdir permission denied](http://linoxide.com/wp-content/uploads/2014/01/mkdir_permission_denied.png)

### Create multiple directories ###

We can also create multiple directories at the same time. Let say we want to create directories named **ubuntu, redhat and slackware**. Then the syntax will be like this :

    $ mkdir ubuntu redhat slackware

![create multiple directories](http://linoxide.com/wp-content/uploads/2014/01/mkdir_multiple.png)

### Add directory include its sub-directory ###

When you want to created a include its sub-directory, you will need to use -p parameter. This parameter will create parent directory first, if mkdir cannot find it. Let say we want to create directory named **letter** and directory named **important** under directory letter. Then the syntax will be like this :

    $ mkdir -p letter/important

![mkdir sub-directory](http://linoxide.com/wp-content/uploads/2014/01/mkdir_p.png)

### Set access privilege ###

Using **-m** parameter, we can also set the access privilege for the new directory on-the-fly. Here’s an example.

    $ mkdir -m=r-- letter

The above command will create a directory named letter and give access privilege **read-only** for the **directory owner, directory group owner** and **anybody**.

![mkdir set privilege](http://linoxide.com/wp-content/uploads/2014/01/mkdir_m.png)

### Print message a message for each created directory ###

If we want, we can use **-v** parameter to do this. Here’s an example.

    $ mkdir -v ubuntu redhat slackware

![mkdir verbose](http://linoxide.com/wp-content/uploads/2014/01/mkdir_v.png)

### Conclusion ###

Mkdir command is also one of the basic command that must known for everyone who want to learn Linux. As usual, you can always type **man mkdir** or **mkdir --help** to display mkdir manual page and explore it more detail.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-mkdir-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出