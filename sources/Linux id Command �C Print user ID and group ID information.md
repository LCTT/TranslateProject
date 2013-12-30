Translating---------------------geekpi



Linux id Command – Print user ID and group ID information
================================================================================
To log in into a computer, we need a username. Username is an identity to recognized by a computer. Based on it, computer will apply a set of rules to a someone that log in with that username. On Linux system we can use **id** command.

### What is id command ###

**id** command is command which can print real and effective User ID (UID) and Group ID (GID). An UID is a single identity for a user. While Group ID (GID) can consist more than one UID.

### How to use it ###

By default, **id** command is installed on most of Linux system. To use it, just type id on your console. Typing id without no options will result as below. The result will use the active user.

    $ id

![Default id output](http://linoxide.com/wp-content/uploads/2013/12/id_default.png)

#### Here’s how to read the output : ####

- User **pungki** has **UID** number = **1000**, **GID** number = **1000**
- User **pungki is a member** of the following groups :

    **pungki** with GID = **1000**
    **adm** with GID = **4**
    **cdrom** with GID = **24**
    **sudo** with GID = **27**
    **dip** with GID = **30**
    **plugdev** with GID = **46**
    **lpadmin** with GID = **108**
    **sambashare** with GID = **124**

### Using id with options ###

There are some options that can applied to id command. Here’s some options that may useful on day-to-day basis.

#### Print user name, UID an all the group to which the user belongs ####

To do this, we can use **-a** option

    $ id -a

![-a option](http://linoxide.com/wp-content/uploads/2013/12/id_a.png)

#### Output all different group IDs (effective, real and supplementary) ####

We can use **-G** option to do fulfill this.

    $ id -G

![-G option](http://linoxide.com/wp-content/uploads/2013/12/id_G.png)

The result will only show the GID numbers. You can compare it with **/etc/group** file. Here’s a sample of **/etc/grou**p content :

    root:x:0:
    daemon:x:1:
    bin:x:2:
    sys:x:3:
    adm:x:4:pungki
    fax:x:21:
    voice:x:22:
    cdrom:x:24:pungki
    floppy:x:25:
    tape:x:26:
    sudo:x:27:pungki
    audio:x:29:pulse
    dip:x:30:pungki
    www-data:x:33:
    backup:x:34:
    operator:x:37:
    sasl:x:45:
    plugdev:x:46:pungki
    ssl-cert:x:107:
    lpadmin:x:108:pungki
    saned:x:123:
    sambashare:x:124:pungki
    winbindd_priv:x:125:

#### Output only the effective group ID ####

Use **-g** option to output only the effective group ID

    $ id -g

![-g option](http://linoxide.com/wp-content/uploads/2013/12/id_g1.png)

#### Print the specific user information ####

We can output a specific user information related UID and GID. Just put the user name after id command.

    $ id leni

![leni user](http://linoxide.com/wp-content/uploads/2013/12/id_leni.png)

Above command will print UID and GID of user named **leni**.

### Conclusion ###

This id command is useful for us when we want to know about UID and GID of a user. Some applications may need UID / GID to be run. id make us easier to find UID and GID of a user without seeing and searching it inside /etc/group file. As usual you can go to id manual page by typing **man id** from your console to explore more detail.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-id-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出