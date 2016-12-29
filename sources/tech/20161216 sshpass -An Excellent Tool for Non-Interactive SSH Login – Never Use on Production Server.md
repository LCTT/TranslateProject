sshpass: An Excellent Tool for Non-Interactive SSH Login – Never Use on Production Server
============================================================

In most cases, Linux system administrators login to remote Linux servers using SSH either by supplying a password, or [passwordless SSH login][1], or keybased SSH authentication.

What if you want to supply a password along with username to SSH prompt itself? this is where sshpass comes to rescue.

sshpass is a simple and lightweight command line tool that enables us to provide password (non-interactive password authentication) to the command prompt itself, so that automated shell scripts can be executed to take backups via [cron scheduler][2].

ssh uses straight TTY access to make sure that the password is actually supplied by an interactive keyboard user. Sshpass runs ssh in a devoted tty, mislead it into believing that it is receiving the password from an interactive user.

Important: Using sshpass considered to be least secure, as it reveals the password to all system users on the command line with simple “ps” command. I highly recommend using [SSH Passwordless authentication][3].

### Install sshpass on Linux Systems

In RedHat/CentOS based systems, first you need to [enable Epel repository][4] on your system to install it using [yum command][5] as shown.

```
# yum install sshpass
# dnf install sshpass    [On Fedora 22+ versions]
```

On Debian/Ubuntu and its derivatives, you can install it using [apt-get command][6] as shown.

```
$ sudo apt-get install sshpass
```

Alternatively, you can install from source to have latest version of sshpass, first download the source code and then extract contents of the tar file and install it like so:

```
$ wget http://sourceforge.net/projects/sshpass/files/latest/download -O sshpass.tar.gz
$ tar -xvf sshpass.tar.gz
$ cd sshpass-1.06
$ ./configure
# sudo make install 
```

### How to Use sshpass in Linux

sshpass is used together with ssh, you can view all the sshpass usage options with full descriptions by issuing the command below:

```
$ sshpass -h
```
sshpass Help
```
Usage: sshpass [-f|-d|-p|-e] [-hV] command parameters
-f filename   Take password to use from file
-d number     Use number as file descriptor for getting password
-p password   Provide password as argument (security unwise)
-e            Password is passed as env-var "SSHPASS"
With no parameters - password will be taken from stdin
-h            Show help (this screen)
-V            Print version information
At most one of -f, -d, -p or -e should be used
```

As I mentioned before, sshpass is more reliable and useful for scripting purposes, consider the example commands below.

Login to remote Linux ssh server (10.42.0.1) with the username and password and [check the file-system disk usage][7] of remote system as shown.

```
$ sshpass -p 'my_pass_here' ssh aaronkilik@10.42.0.1 'df -h' 
```

Important: Here, the password is provided on the command line which is practically unsecure and using this option is not recommended.

[
 ![sshpass - Linux Remote Login via SSH](http://www.tecmint.com/wp-content/uploads/2016/12/sshpass-Linux-Remote-Login.png) 
][8]

sshpass – Linux Remote Login via SSH

However, to prevent showing password on the screen, you can use the `-e` flag and enter the password as a value of the SSHPASS environment variable as below:

```
$ export SSHPASS='my_pass_here'
$ echo $SSHPASS
$ sshpass -e ssh aaronkilik@10.42.0.1 'df -h' 
```
[
 ![sshpass - Hide Password in Prompt](http://www.tecmint.com/wp-content/uploads/2016/12/sshpass-Hide-Password-in-Prompt.png) 
][9]

sshpass – Hide Password in Prompt

Note: In the example above, SSHPASS environment variable is for temporary purpose only and will be removed during reboot.

To permanently set the SSHPASS environment variable, open the /etc/profile file and type the export statement at the beginning of the file:

```
export SSHPASS='my_pass_here'
```

Save the file and exit, then run the command below to effect the changes:

```
$ source /etc/profile 
```

On the other hand, you can also use the `-f` flag and put the password in a file. This way, you can read the password from the file as follows:

```
$ sshpass -f password_filename ssh aaronkilik@10.42.0.1 'df -h'
```
[
 ![sshpass - Supply Password File to Login](http://www.tecmint.com/wp-content/uploads/2016/12/sshpass-Provide-Password-File.png) 
][10]

sshpass – Supply Password File to Login

You can also use sshpass to [transfer files using scp][11] or [backup/sync files over rsync][12] using SSH as shown:

```
------- Transfer Files Using SCP ------- 
$ scp -r /var/www/html/example.com --rsh="sshpass -p 'my_pass_here' ssh -l aaronkilik" 10.42.0.1:/var/www/html
------- Backup or Sync Files Using Rsync -------
$ rsync --rsh="sshpass -p 'my_pass_here' ssh -l aaronkilik" 10.42.0.1:/data/backup/ /backup/
```

For more usage, I suggest you to read through the sshpass man page, type:

```
$ man sshpass
```

In this article, we explained sshpass a simple tool that enables non-interactive password authentication. Although, this tools may be helpful, it is highly recommended to use ssh’s more secure public key authentication mechanism.

Please, do leave a question or comment via the feedback section below for any further discussions.

--------------------------------------------------------------------------------

作者简介：Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

-----------

via: http://www.tecmint.com/sshpass-non-interactive-ssh-login-shell-script-ssh-password/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
[2]:http://www.tecmint.com/11-cron-scheduling-task-examples-in-linux/
[3]:http://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
[4]:http://www.tecmint.com/how-to-enable-epel-repository-for-rhel-centos-6-5/
[5]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[6]:http://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/
[7]:http://www.tecmint.com/how-to-check-disk-space-in-linux/
[8]:http://www.tecmint.com/wp-content/uploads/2016/12/sshpass-Linux-Remote-Login.png
[9]:http://www.tecmint.com/wp-content/uploads/2016/12/sshpass-Hide-Password-in-Prompt.png
[10]:http://www.tecmint.com/wp-content/uploads/2016/12/sshpass-Provide-Password-File.png
[11]:http://www.tecmint.com/scp-commands-examples/
[12]:http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/
