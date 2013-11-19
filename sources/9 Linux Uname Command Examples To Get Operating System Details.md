9 Linux Uname Command Examples To Get Operating System Details
================================================================================
![](http://linoxide.com/wp-content/uploads/2013/11/linux-uname-command.png)

When you are in console mode, there is no ‘Right click > About’ to give you information about your operating system. In Linux, you can use command **uname** to help you about that. Uname is the short name for **unix name**. Just type **uname** in console.

When you type uname without parameter, it will only show the name of your operating system.

    # uname
    Linux

It may not satisfy what you need. So you may need to use some parameters to make uname show the information you need.

Here’s the list of uname parameters :

### 1. Kernel name ###

To reveal the kernel name, you can use **-s** parameter.

    # uname -s
    Linux

The output will be same with uname without parameter.

### 2. Kernel release ###

If you need to know what kernel release you’re using, just use **-r** parameter

    # uname -r
    2.6.18-371.1.2.el5

### 3. Kernel version ###

Beside kernel information, uname can also fetch the kernel version. Use **-v** parameter for this purpose

    # uname -v
    #1 SMP Tue Oct 22 12:57:43 EDT 2013

### 4. Nodename ###

Parameter -n will give you the node hostname. For example, if your hostname is “dev-machine”, **-n** parameter will print dev-machine as the output of -n parameter

    # uname -n
    dev-machine

For RedHat and CentOS, you can also use **/etc/redhat_release** file :

    # cat /etc/redhat_release
    CentOS release 5.10 (Final)

For non-RedHat based distro, you may use **/etc/issue**. Here’s the example :

    # cat /etc/issue
    Linux Mint Olivia \n \l

### 5. Hardware name ###

If you are wondering what kind of machine you’re using, you can try **-m** parameter. It will show you information about it.

    # uname -m
    i686

i686 is indicates that your system is 32 bit operating system. While x86_64 means your system is a 64 bit system.

### 6. Hardware platform ###

Similar with hardware name, -i parameter will show you hardware platfrom.

    # uname -i
    i386

i386 mean you are running a 32 bit system. If the output is x86_64 it’s mean that you are running 64 bis system.

### 7. Processor type ###

To see processor type, you can use **-p** parameter. If uname is not able to show you that information, it will show you ‘unknown’ in the output.

    # uname -p
    i686

### 8. Operating system ###

Uname can also used to reveal what operating system you are running. Use **-o** parameter to fulfill this purpose.

    # uname -o
    GNU/Linux

### 9. All information ###

There is one parameter that can reveal all information. It’s **-a** parameter. It will show you all information **except omit -i and -p** if they are unknown.

    # uname -a
    Linux dev-machine 2.6.18-371.1.2.el5 #1 SMP Tue Oct 22 12:57:43 EDT 2013 i686 i686 i386 GNU/Linux

That’s the uname command in use. Please stay tuned to see more commands.

Thank you.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/uname-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出