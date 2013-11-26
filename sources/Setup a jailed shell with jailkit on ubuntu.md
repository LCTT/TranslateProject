Setup a jailed shell with jailkit on ubuntu
================================================================================
### Jailed Shell and Jailkit ###

A jailed shell is a kind of limited shell that provides the user with a very real looking shell but does not allow him to mess with/view/modify any parts of the real file systems. The file system inside the shell is different from the actual file system of the underlying system. Such a functionality is achived through chroot and finds many kinds of applications. For example to setup a linux shell for users to just "play with". Or run some program with full functionality but in a limited environment and so on. 

In this tutorial we are going to talk about setting up a jailed shell quickly with jailkit on ubuntu. Jailkit is helper program that allows to quickly setup a jailed shell, jail users inside it, and configure programs to run from the jailed environment.

Jailkit can be downloaded from [http://olivier.sessink.nl/jailkit/][1]

We have already discussed about installing jailkit on ubuntu so check out that post.

### Setup jailed shell ###

#### 1. Setup the jail environment ####

There needs to be a directory where the whole jail environment will be setup. Lets do it in /opt/jail. This can be whatever.

    $ sudo mkdir /opt/jail

Root should own this directory. So chown it out.

    $ sudo chown root:root /opt/jail

#### 2. Setup the programs to make available inside the jail ####

All the programs that need to be available in the jail need to be copied inside it using the jk_init command.

Example

    $ sudo jk_init -v /jail basicshell 
    $ sudo jk_init -v /jail editors 
    $ sudo jk_init -v /jail extendedshell 
    $ sudo jk_init -v /jail netutils 
    $ sudo jk_init -v /jail ssh 
    $ sudo jk_init -v /jail sftp
    $ sudo jk_init -v /jail jk_lsh

Or at one go

    $ sudo jk_init -v /opt/jail netutils basicshell jk_lsh openvpn ssh sftp

The names like basicshell , editors , netutils are groups that contain multiple programs. Each group is a set of executable files, libraries etc to be copied into the shell. For example, the section **basicshell** provides many programs like bash, ls, cat, chmod, mkdir, cp, cpio, date, dd, echo, egrep etc in the jail.

For a complete list of sections that can be setup, have a look at /etc/jailkit/jk_init.ini.

    jk_lsh (Jailkit limited shell) - is an important section, and must be added.

#### 3. Create the user who will be jailed ####

Need a user to put inside the jail. Lets create one 

    $ sudo adduser robber
    Adding user `robber' ...
    Adding new group `robber' (1005) ...
    Adding new user `robber' (1006) with group `robber' ...
    Creating home directory `/home/robber' ...
    Copying files from `/etc/skel' ...
    Enter new UNIX password: 
    Retype new UNIX password: 
    passwd: password updated successfully
    Changing the user information for robber
    Enter the new value, or press ENTER for the default
            Full Name []: 
            Room Number []: 
            Work Phone []: 
            Home Phone []: 
            Other []: 
    Is the information correct? [Y/n] y

Note that this is a normal user who is created in the actual filesystem and not inside the jail.
In the next step this user shall be imprisoned inside the jail.

At this point if you take a look at /etc/passwd you get to see an entry at the end that looks like this

    robber:x:1006:1005:,,,:/home/robber:/bin/bash

This is our new user and the last part /bin/bash indicates that the user has a normal shell access on the system, if he logs in.

#### 4. Jail the user ####

Now its time to put the user inside the jail.

    $ sudo jk_jailuser -m -j /opt/jail/ robber

By doing this the user robber has now been jailed.

Now if you take a look at /etc/passwd the last entry would look like this

    robber:x:1006:1005:,,,:/opt/jail/./home/robber:/usr/sbin/jk_chrootsh

Note that the last 2 parts that indicate the home user and the shell type have changed. The home directory of the user is now inside the jail environment at /opt/jail. The shell of the user is now a special program called jk_chrootsh that will provide the jailed shell.

It is this particular shell called jk_chrootsh that takes the user inside the jail, everytime he logs onto the system.

The jail setup by now is nearly done. But if you try to connect to id from ssh, it will fail like this :

    $ ssh robber@localhost
    robber@localhost's password: 
    Welcome to Ubuntu 12.04 LTS (GNU/Linux 3.2.0-25-generic x86_64)
    
     * Documentation:  https://help.ubuntu.com/
    
    13 packages can be updated.
    0 updates are security updates.
    
    *** /dev/sda7 will be checked for errors at next reboot ***
    *** /dev/sda8 will be checked for errors at next reboot ***
    
    Last login: Sat Jun 23 12:45:13 2012 from localhost
    Connection to localhost closed.
    $

The connection shall close. This happens because the user actually has a limited shell.

#### 5. Give bash shell to user inside the jail ####

The next important thing to do is to give the user a proper bash shell, but inside the jail.
Open the following file

    /opt/jail/etc/passwd

Its the password file inside the jail. It would look somewhat like this 

    root:x:0:0:root:/root:/bin/bash
    robber:x:1006:1005:,,,:/home/robber:/usr/sbin/jk_lsh

Change the /usr/sbin/jk_lsh to /bin/bash

    root:x:0:0:root:/root:/bin/bash
    robber:x:1006:1005:,,,:/home/robber:/bin/bash

Save the file and exit.

#### 6. Login to the jail ####

So now its time to login into the jail again

    $ ssh robber@localhost
    robber@localhost's password: 
    Welcome to Ubuntu 12.04 LTS (GNU/Linux 3.2.0-25-generic x86_64)
    
     * Documentation:  https://help.ubuntu.com/
    
    13 packages can be updated.
    0 updates are security updates.
    
    *** /dev/sda7 will be checked for errors at next reboot ***
    *** /dev/sda8 will be checked for errors at next reboot ***
    
    Last login: Sat Jun 23 12:46:01 2012 from localhost
    bash: groups: command not found
    I have no name!@desktop:~$

The jail says 'I have no name!' , ha ha. Now we have a fully functional bash shell but inside the jail.

Now check the environment by moving around. The root / of the jailed environment is /opt/jail of the real file system. But its only we who knows that, not the jailed user.

    I have no name!@desktop:~$ cd /
    I have no name!@desktop:/$ ls
    bin  dev  etc  home  lib  lib64  run  usr  var
    I have no name!@desktop:/$

Also only the commands that were copied via jk_cp sections will be available in this jail.

If the login fails, then check /var/log/auth.log for error messages.

Now try running some network command like wget or anything similar.

    $ wget http://www.google.com/

If you get an error like this :

    $ wget http://www.google.com/
    --2012-06-23 12:56:43--  http://www.google.com/
    Resolving www.google.com (www.google.com)... failed: Name or service not known.
    wget: unable to resolve host address `www.google.com'

Fix it by running the following 2 commands :

    $ sudo jk_cp -v -j /opt/jail /lib/x86_64-linux-gnu/libnss_files.so.2
    $ sudo jk_cp -v -j /opt/jail /lib/x86_64-linux-gnu/libnss_dns.so.2

The exact location of the libnss_files.so and libnss_dns.so can vary so check.

### Running programs or services in the jail ###

Now the setup is complete. Jails are useful to run programs or services in a restricted/secure environments. To launch a program or daemon inside the jail use the **jk_chrootlaunch** command.

    $ sudo jk_chrootlaunch -j /opt/jail -u robber -x /some/command/in/jail

The jk_chrootlaunch utility can be used to launch a particular process inside the jail environment with privileges of the specified user. If the daemon fails to start, check /var/log/syslog for error messages.

To run the program inside the jail, the program must first be fully copied inside the jail using the jk_cp command.

    jk_cp - a utility to copy files including permissions and libraries into a jail

For further reading about various jailkit commands, check the documentation at [http://olivier.sessink.nl/jailkit/][1]

--------------------------------------------------------------------------------

via: http://www.binarytides.com/setup-jailed-shell-jailkit-ubuntu/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://olivier.sessink.nl/jailkit/
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