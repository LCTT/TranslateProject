	NearTan领取

Linux pwd command - Know Your Current Working Directory
================================================================================
Where you are inside a deep directory, sometimes you may want to know where exactly you are. With this pwd command, you can do it.

### What is pwd ###

Pwd is a command to print name of current / working directory. When we are “lost” into a deep directory, we can always reveal where we are. 

### How to use it ###

Since pwd command is intended to only print name of current / working directory, pwd does not have a lot of parameter to add. To use it, you just can type :

    $ pwd

And it will print where you are. For a shell like bash, sometimes this information already print after host-name. Take a look at below picture.

![Pwd in bash](http://linoxide.com/wp-content/uploads/2014/01/pwd_bash.png)

As you can see above, the **/lib/udev/rules.d** is printed a hostname. When we type pwd, it will print **/lib/udev/rules.d** again. But when you are using another shell such as **csh**, pwd may help you to tell where are you. Here’s a sample of it.

    % pwd

![Pwd in csh shell](http://linoxide.com/wp-content/uploads/2014/01/pwd_csh.png)

### Print physical directory avoid all symlinks ###

When you are in directory which is a symbolic links to another directory, you will find that pwd will print the alias / symbolic links to it. To print the real directory name, we can use **-P** parameter.

    $ pwd -P

![Physical pwd](http://linoxide.com/wp-content/uploads/2014/01/pwd_P1.png)

![Physicall pwd](http://linoxide.com/wp-content/uploads/2014/01/pwd_P2.png)

![Physical pwd](http://linoxide.com/wp-content/uploads/2014/01/pwd_P3.png)

At the screenshot above, we are change the directory to **PlayOnLinux’s virtual drives**. This directory is located in **/home/pungki** and its a symbolic link to wineprefix directory. When we do pwd command, the shell return **/home/pungki/PlayOnLinux’s virtual drives**. But if we add **-P** parameter, the we will know that the real directory is **/home/pungki/.PlayOnLinux’s/wineprefix**

### Reveal which pwd ###

On bash shell, pwd may already built-in inside it. To know it, we can use this command :

    $ type -a pwd

![pwd type](http://linoxide.com/wp-content/uploads/2014/01/pwd_type.png)

You see that there are **two** pwd’s. When you use pwd, you may use the built-in pwd command on your shell. This pwd will override the original pwd. Here’s a sample.

![Symlink pwd](http://linoxide.com/wp-content/uploads/2014/01/pwd_L.png)

On the screenshot above, we are now inside **/home/pungki./PlayOnLinux/wineprefix**. When we use **/bin/pwd**, it will return the real name of current directory. But when we add **-L** parameter, it will return a symbolic link name of current directory.

This **-L** parameter output the same result if we just type pwd, which use built-in shell pwd.

### Print pwd version ###

To print pwd version, we can use **--version** parameter. But for bash shell, we need to use **/bin/pwd** instead of pwd. Otherwise, it will return an error message.

![pwd version](http://linoxide.com/wp-content/uploads/2014/01/pwd_version.png)

### Conclusion ###

pwd may help you to know where your current directory when your bash don’t print it directly on command prompt. As usual, you can always type **man pwd** to explore pwd usage more detail.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-pwd-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出