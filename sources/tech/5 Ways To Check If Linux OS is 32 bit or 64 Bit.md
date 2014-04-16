crowner 验尸中
5 Ways To Check If Linux OS is 32 bit or 64 Bit
================================================================================
Sometimes Linux newbies get confused while downloading a software because the download page offers them both 32 bit and 64 bit versions of the same software. It is important to know whether your Linux OS is 32-bit or 64-bit, as this information is required while doing various tasks. In this article, we will discuss five different ways to check if your Linux OS is 32-bit or 64-Bit.

### Check If Linux is 32-bit or 64-Bit ###

Please note that the methods mentioned in this article are tested on Ubuntu 13.10.

#### 1. Execute the ‘uname -a’ command ####

One of the most common way to check if your Linux OS is 32 bit or 64 Bit is by running the [uname command][1].

For example, on my system, it displayed the following information:

    $ uname -a
     Linux ubuntu 3.11.0-12-generic #19-Ubuntu SMP Wed Oct 9 16:12:00 UTC 2013 i686 athlon i686 GNU/Linux

The highlighted **i686** (or i386 in some cases) signifies that the operating system is 32 bit, but if **x86_64** appears, then it means that the OS is 64 bit.

#### 2. Execute the ‘uname -m’ command ####

A similar but slightly different way is to run the ‘uname -m’ command.

For example, on my system, it displayed the following information:

    $ uname -m
     i686

Which means that my Ubuntu Linux is 32-bit. If it would have been 64 bit, the output would have been x86_64.

#### 3. Using the file command ####

Although it’s a kind of hack, but still it can be used to solve the purpose. In this case, you have run the file command with **/sbin/init** as an argument.

Here is an example :

    $ file /sbin/init
     /sbin/init: ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.24, BuildID[sha1]=0xc0d86a25a7abb14cad4a65a1f7d03605bcbd41f6, stripped

The highlighted 32-bit signifies a 32-bit OS, and vice-versa.

#### 4. Using the arch command ####

Another alternative is to use the arch command, which prints the machine hardware name.

Here is an example:

    $ arch
     i686

So you can see that the output was i686, which signifies a 32-bit OS. For a 64-bit OS, the output would have been x86_64.

#### 5. Through system settings ####

If you are using Ubuntu 12.04 or higher, you can easily check your OS architecture by going to All **Settings -> Details**.

![details](http://mylinuxbook.com/wp-content/uploads/2014/04/details.png)

So you can see that the OS type (32-bit) is clearly mentioned here.

Do you know other ways to check if Linux OS is 32 bit or 64 Bit? Share your ideas in comments

--------------------------------------------------------------------------------

via: http://mylinuxbook.com/5-ways-to-check-if-linux-is-32-bit-or-64-bit/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://mylinuxbook.com/linux-uname-command/