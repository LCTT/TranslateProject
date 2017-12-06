translating by lujun9972
Using sudo to delegate permissions in Linux
======
I recently wrote a short Bash program to copy MP3 files from a USB thumb drive on one network host to another network host. The files are copied to a specific directory on the server that I run for a volunteer organization, from where the files can be downloaded and played.

My program does a few other things, such as changing the name of the files before they are copied so they are automatically sorted by date on the webpage. It also deletes all the files on the USB drive after verifying that the transfer completed correctly. This nice little program has a few options, such as -h to display help, -t for test mode, and a couple of others.

My program, as wonderful as it is, must run as root to perform its primary functions. Unfortunately, this organization has only a few people who have any interest in administering our audio and computer systems, which puts me in the position of finding semi-technical people and training them to log into the computer used to perform the transfer and run this little program.

It is not that I cannot run the program myself, but for various reasons, including travel and illness, I am not always there. Even when I am present, as the "lazy sysadmin," I like to have others do my work for me. So, I write scripts to automate those tasks and use sudo to anoint a couple of users to run the scripts. Many Linux commands require the user to be root in order to run. This protects the system against accidental damage, such as that caused by my own stupidity, and intentional damage by a user with malicious intent.

### Do that sudo that you do so well

The sudo program is a handy tool that allows me as a sysadmin with root access to delegate responsibility for all or a few administrative tasks to other users of the computer. It allows me to perform that delegation without compromising the root password, thus maintaining a high level of security on the host.

Let's assume, for example, that I have given regular user, "ruser," access to my Bash program, "myprog," which must be run as root to perform parts of its functions. First, the user logs in as ruser with their own password, then uses the following command to run myprog.

```
        sudo myprog
```

I find it helpful to have the log of each command run by sudo for training. I can see who did what and whether they entered the command correctly.

I have done this to delegate authority to myself and one other user to run a single program; however, sudo can be used to do so much more. It can allow the sysadmin to delegate authority for managing network functions or specific services to a single person or to a group of trusted users. It allows these functions to be delegated while protecting the security of the root password.

### Configuring the sudoers file

As a sysadmin, I can use the /etc/sudoers file to allow users or groups of users access to a single command, defined groups of commands, or all commands. This flexibility is key to both the power and the simplicity of using sudo for delegation.

I found the sudoers file very confusing at first, so below I have copied and deconstructed the entire sudoers file from the host on which I am using it. Hopefully it won't be quite so obscure for you by the time you get through this analysis. Incidentally, I've found that the default configuration files in Red Hat-based distributions tend to have lots of comments and examples to provide guidance, which makes things easier, with less online searching required.

Do not use your standard editor to modify the sudoers file. Use the visudo command because it is designed to enable any changes as soon as the file is saved and you exit the editor. It is possible to use editors besides Vi in the same way as visudo.

Let's start analyzing this file at the beginning with a couple types of aliases.

### Host aliases

The host aliases section is used to create groups of hosts on which commands or command aliases can be used to provide access. The basic idea is that this single file will be maintained for all hosts in an organization and copied to /etc of each host. Some hosts, such as servers, can thus be configured as a group to give some users access to specific commands, such as the ability to start and stop services like HTTPD, DNS, and networking; to mount filesystems; and so on.

IP addresses can be used instead of host names in the host aliases.

```
## Sudoers allows particular users to run various commands as
## the root user, without needing the root password.
##
## Examples are provided at the bottom of the file for collections
## of related commands, which can then be delegated out to particular
## users or groups.
## 
## This file must be edited with the 'visudo' command.

## Host Aliases
## Groups of machines. You may prefer to use hostnames (perhaps using 
## wildcards for entire domains) or IP addresses instead.
# Host_Alias     FILESERVERS = fs1, fs2
# Host_Alias     MAILSERVERS = smtp, smtp2

## User Aliases
## These aren't often necessary, as you can use regular groups
## (ie, from files, LDAP, NIS, etc) in this file - just use %groupname 
## rather than USERALIAS
# User_Alias ADMINS = jsmith, mikem
User_Alias AUDIO = dboth, ruser

## Command Aliases
## These are groups of related commands...

## Networking
# Cmnd_Alias NETWORKING = /sbin/route, /sbin/ifconfig,
 /bin/ping, /sbin/dhclient, /usr/bin/net, /sbin/iptables, 
/usr/bin/rfcomm, /usr/bin/wvdial, /sbin/iwconfig, /sbin/mii-tool

## Installation and management of software
# Cmnd_Alias SOFTWARE = /bin/rpm, /usr/bin/up2date, /usr/bin/yum

## Services
# Cmnd_Alias SERVICES = /sbin/service, /sbin/chkconfig

## Updating the locate database
# Cmnd_Alias LOCATE = /usr/bin/updatedb

## Storage
# Cmnd_Alias STORAGE = /sbin/fdisk, /sbin/sfdisk, /sbin/parted, /sbin/partprobe, /bin/mount, /bin/umount

## Delegating permissions
# Cmnd_Alias DELEGATING = /usr/sbin/visudo, /bin/chown, /bin/chmod, /bin/chgrp 

## Processes
# Cmnd_Alias PROCESSES = /bin/nice, /bin/kill, /usr/bin/kill, /usr/bin/killall

## Drivers
# Cmnd_Alias DRIVERS = /sbin/modprobe

# Defaults specification

#
# Refuse to run if unable to disable echo on the tty.
#
Defaults   !visiblepw

Defaults    env_reset
Defaults    env_keep =  "COLORS DISPLAY HOSTNAME HISTSIZE KDEDIR LS_COLORS"
Defaults    env_keep += "MAIL PS1 PS2 QTDIR USERNAME LANG LC_ADDRESS LC_CTYPE"
Defaults    env_keep += "LC_COLLATE LC_IDENTIFICATION LC_MEASUREMENT LC_MESSAGES"
Defaults    env_keep += "LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE"
Defaults    env_keep += "LC_TIME LC_ALL LANGUAGE LINGUAS _XKB_CHARSET XAUTHORITY"

Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin

## Next comes the main part: which users can run what software on 
## which machines (the sudoers file can be shared between multiple
## systems).
## Syntax:
##
##      user    MACHINE=COMMANDS
##
## The COMMANDS section may have other options added to it.
##
## Allow root to run any commands anywhere 
root    ALL=(ALL)       ALL

## Allows members of the 'sys' group to run networking, software, 
## service management apps and more.
# %sys ALL = NETWORKING, SOFTWARE, SERVICES, STORAGE, DELEGATING, PROCESSES, LOCATE, DRIVERS

## Allows people in group wheel to run all commands
%wheel  ALL=(ALL)       ALL

## Same thing without a password
# %wheel        ALL=(ALL)       NOPASSWD: ALL

## Allows members of the users group to mount and unmount the 
## cdrom as root
# %users  ALL=/sbin/mount /mnt/cdrom, /sbin/umount /mnt/cdrom

## Allows members of the users group to shutdown this system
# %users  localhost=/sbin/shutdown -h now

## Read drop-in files from /etc/sudoers.d (the # here does not mean a comment)
#includedir /etc/sudoers.d

################################################################################
# Added by David Both, 11/04/2017 to provide limited access to myprog          #
################################################################################
#
AUDIO   guest1=/usr/local/bin/myprog
```

### User aliases

The user alias configuration allows root to sort users into aliased groups so that an entire group can have access to certain root capabilities. This is the section to which I have added the line User_Alias AUDIO = dboth, ruser, which defines the alias AUDIO and assigns two users to that alias.

It is possible, as stated in the sudoers file, to simply use groups defined in the /etc/groups file instead of aliases. If you already have a group defined there that meets your needs, such as "audio," use that group name preceded by a % sign like so: %audio when assigning commands that will be made available to groups later in the sudoers file.

### Command aliases

Further down in the sudoers file is a command aliases section. These aliases are lists of related commands, such as networking commands or commands required to install updates or new RPM packages. These aliases allow the sysadmin to easily permit access to groups of commands.

A number of aliases are already set up in this section that make it easy to delegate access to specific types of commands.

### Environment defaults

The next section sets some default environment variables. The item that is most interesting in this section is the !visiblepw line, which prevents sudo from running if the user environment is set to show the password. This is a security precaution that should not be overridden.

### Command section

The command section is the main part of the sudoers file. Everything you need to do can be done without all the aliases by adding enough entries here. The aliases just make it a whole lot easier.

This section uses the aliases you've already defined to tell sudo who can do what on which hosts. The examples are self-explanatory once you understand the syntax in this section. Let's look at the syntax that we find in the command section.

```
ruser           ALL=(ALL) ALL 
```

This is a generic entry for our user, ruser. The first ALL in the line indicates that this rule applies on all hosts. The second ALL allows ruser to run commands as any other user. By default, commands are run as root user, but ruser can specify on the sudo command line that a program be run as any other user. The last ALL means that ruser can run all commands without restriction. This would effectively make ruser root.

Note that there is an entry for root, as shown below. This allows root to have all-encompassing access to all commands on all hosts.

```
root    ALL=(ALL) ALL 
```

To try this out, I commented out the line and, as root, tried to run chown without sudo. That did work—much to my surprise. Then I used sudo chown and that failed with the message, "Root is not in the sudoers file. This incident will be reported." This means that root can run everything as root, but nothing when using the sudo command. This would prevent root from running commands as other users via the sudo command, but root has plenty of ways around that restriction.

The code below is the one I added to control access to myprog. It specifies that users who are listed in the AUDIO group, as defined near the top of the sudoers file, have access to only one program, myprog, on one host, guest1.

```
AUDIO   guest1=/usr/local/bin/myprog
```

Note that the syntax of the line above specifies only the host on which this access is to be allowed and the program. It does not specify that the user may run the program as any other user.

### Bypassing passwords

You can also use NOPASSWORD to allow the users specified in the group AUDIO to run myprog without the need for entering their passwords. Here's how:

```
AUDIO   guest1=NOPASSWORD : /usr/local/bin/myprog
```

I did not do this for my program, because I believe that users with sudo access must stop and think about what they are doing, and this may help a bit with that. I used the entry for my little program as an example.

### wheel

The wheel specification in the command section of the sudoers file, as shown below, allows all users in the "wheel" group to run all commands on any host. The wheel group is defined in the /etc/group file, and users must be added to the group there for this to work. The % sign preceding the group name means that sudo should look for that group in the /etc/group file.

```
%wheel          ALL = (ALL) ALL 
```

This is a good way to delegate full root access to multiple users without providing the root password. Just adding a user to the wheel group gives them access to full root powers. It also provides a means to monitor their activities via the log entries created by sudo. Some distributions, such as Ubuntu, add users' IDs to the wheel group in /etc/group, which allows them to use the sudo command for all privileged commands.

### Final thoughts

I have used sudo here for a very limited objective—providing one or two users with access to a single command. I accomplished this with two lines (if you ignore my own comments). Delegating authority to perform certain tasks to users who do not have root access is simple and can save you, as a sysadmin, a good deal of time. It also generates log entries that can help detect problems.

The sudoers file offers a plethora of capabilities and options for configuration. Check the man files for sudo and sudoers for the down-and-dirty details.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/12/using-sudo-delegate

作者：[David Both][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dboth
