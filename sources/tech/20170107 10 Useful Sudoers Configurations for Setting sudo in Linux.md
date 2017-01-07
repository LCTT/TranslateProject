10 Useful Sudoers Configurations for Setting ‘sudo’ in Linux
============================================================

In Linux and other Unix-like operating systems, only the root user can run all commands and perform certain critical operations on the system such as install and update, remove packages, [create users and groups][1], modify important system configuration files and so on.

However, a system administrator who assumes the role of the root user can permit other normal system users with the help of [sudo command][2] and a few configurations to run some commands as well as carry out a number of vital system operations including the ones mentioned above.

Alternatively, the system administrator can share the root user password (which is not a recommended method) so that normal system users have access to the root user account via su command.

sudo allows a permitted user to execute a command as root (or another user), as specified by the security policy:

1.  It reads and parses /etc/sudoers, looks up the invoking user and its permissions,
2.  then prompts the invoking user for a password (normally the user’s password, but it can as well be the target user’s password. Or it can be skipped with NOPASSWD tag),
3.  after that, sudo creates a child process in which it calls setuid() to switch to the target user
4.  next, it executes a shell or the command given as arguments in the child process above.

Below are ten /etc/sudoers file configurations to modify the behavior of sudo command using Defaults entries.

```
$ sudo cat /etc/sudoers
```
/etc/sudoers File
```
#
# This file MUST be edited with the 'visudo' command as root.
#
# Please consider adding local content in /etc/sudoers.d/ instead of
# directly modifying this file.
#
# See the man page for details on how to write a sudoers file.
#
Defaults	env_reset
Defaults	mail_badpass
Defaults	secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
Defaults	logfile="/var/log/sudo.log"
Defaults	lecture="always"
Defaults	badpass_message="Password is wrong, please try again"
Defaults	passwd_tries=5
Defaults	insults
Defaults	log_input,log_output
```

#### Types of Defaults Entries

```
Defaults                parameter,   parameter_list     #affect all users on any host
Defaults@Host_List      parameter,   parameter_list     #affects all users on a specific host
Defaults:User_List      parameter,   parameter_list     #affects a specific user
Defaults!Cmnd_List      parameter,   parameter_list     #affects  a specific command 
Defaults>Runas_List     parameter,   parameter_list     #affects commands being run as a specific user
```

For the scope of this guide, we will zero down to the first type of Defaults in the forms below. Parameters may be flags, integer values, strings, or lists.

You should note that flags are implicitly boolean and can be turned off using the `'!'` operator, and lists have two additional assignment operators, `+=` (add to list) and `-=` (remove from list).

```
Defaults     parameter
OR
Defaults     parameter=value
OR
Defaults     parameter -=value   
Defaults     parameter +=value  
OR
Defaults     !parameter       
```

### 1\. Set a Secure PATH

This is the path used for every command run with sudo, it has two importances:

1.  Used when a system administrator does not trust sudo users to have a secure PATH environment variable
2.  To separate “root path” and “user path”, only users defined by exempt_group are not affected by this setting.

To set it, add the line:

```
Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
```

### 2\. Enable sudo on TTY User Login Session

To enable sudo to be invoked from a real tty but not through methods such as cron or cgi-bin scripts, add the line:

```
Defaults  requiretty   
```

### 3\. Run Sudo Command Using a pty

A few times, attackers can run a malicious program (such as a virus or malware) using sudo, which would again fork a background process that remains on the user’s terminal device even when the main program has finished executing.

To avoid such a scenario, you can configure sudo to run other commands only from a psuedo-pty using the `use_pty` parameter, whether I/O logging is turned on or not as follows:

```
Defaults  use_pty
```

### 4\. Create a Sudo Log File

By default, sudo logs through syslog(3). However, to specify a custom log file, use the logfile parameter like so:

```
Defaults  logfile="/var/log/sudo.log"
```

To log hostname and the four-digit year in the custom log file, use log_host and log_year parameters respectively as follows:

```
Defaults  log_host, log_year, logfile="/var/log/sudo.log"
```

Below is an example of a custom sudo log file:

[
 ![Create Custom Sudo Log File](http://www.tecmint.com/wp-content/uploads/2017/01/Create-Sudo-Log-File.png) 
][3]

Create Custom Sudo Log File

### 5\. Log Sudo Command Input/Output

The log_input and log_output parameters enable sudo to run a command in pseudo-tty and log all user input and all output sent to the screen receptively.

The default I/O log directory is /var/log/sudo-io, and if there is a session sequence number, it is stored in this directory. You can specify a custom directory through the iolog_dir parameter.

```
Defaults   log_input, log_output
```

There are some escape sequences are supported such as `%{seq}` which expands to a monotonically increasing base-36 sequence number, such as 000001, where every two digits are used to form a new directory, e.g. 00/00/01 as in the example below:

```
$ cd /var/log/sudo-io/
$ ls
$ cd  00/00/01
$ ls
$ cat log
```
[
 ![Log sudo Input Output](http://www.tecmint.com/wp-content/uploads/2017/01/Log-sudo-Input-Output.png) 
][4]

Log sudo Input Output

You can view the rest of the files in that directory using the [cat command][5].

### 6\. Lecture Sudo Users

To lecture sudo users about password usage on the system, use the lecture parameter as below.

It has 3 possible values:

1.  always – always lecture a user.
2.  once – only lecture a user the first time they execute sudo command (this is used when no value is specified)
3.  never – never lecture the user.

```

Defaults  lecture="always"
```

Additionally, you can set a custom lecture file with the lecture_file parameter, type the appropriate message in the file:

```
Defaults  lecture_file="/path/to/file"
```
[
 ![Lecture Sudo Users](http://www.tecmint.com/wp-content/uploads/2017/01/Lecture-Sudo-Users.png) 
][6]

Lecture Sudo Users

### 7\. Show Custom Message When You Enter Wrong sudo Password

When a user enters a wrong password, a certain message is displayed on the command line. The default message is “sorry, try again”, you can modify the message using the badpass_message parameter as follows:

```
Defaults  badpass_message="Password is wrong, please try again"
```

### 8\. Increase sudo Password Tries Limit

The parameter passwd_tries is used to specify the number of times a user can try to enter a password.

The default value is 3:

```
Defaults   passwd_tries=5 
```
[
 ![Increase Sudo Password Attempts](http://www.tecmint.com/wp-content/uploads/2017/01/Increase-Sudo-Password-Attempts.png) 
][7]

Increase Sudo Password Attempts

To set a password timeout (default is 5 minutes) using passwd_timeout parameter, add the line below:

```
Defaults   passwd_timeout=2
```

### 9\. Let Sudo Insult You When You Enter Wrong Password

In case a user types a wrong password, sudo will display insults on the terminal with the insults parameter. This will automatically turn off the badpass_message parameter.

```
Defaults  insults 
```
[
 ![Let's Sudo Insult You When Enter Wrong Password](http://www.tecmint.com/wp-content/uploads/2017/01/Sudo-Insult-Message.png) 
][8]

Let’s Sudo Insult You When Enter Wrong Password

### 10\. Learn More Sudo Configurations

Additionally, you can learn more sudo command configurations by reading: [Difference Between su and sudo and How to Configure sudo in Linux][9].

That’s it! You can share other useful sudo command configurations or [tricks and tips with Linux][10] users out there via the comment section below.

--------------------------------------------------------------------------------

作者简介：Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

![](http://1.gravatar.com/avatar/4e444ab611c7b8c7bcb76e58d2e82ae0?s=128&d=blank&r=g)

--------------------------------------------------------------------------------

via: http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/add-users-in-linux/
[2]:http://www.tecmint.com/su-vs-sudo-and-how-to-configure-sudo-in-linux/
[3]:http://www.tecmint.com/wp-content/uploads/2017/01/Create-Sudo-Log-File.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/01/Log-sudo-Input-Output.png
[5]:http://www.tecmint.com/13-basic-cat-command-examples-in-linux/
[6]:http://www.tecmint.com/wp-content/uploads/2017/01/Lecture-Sudo-Users.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/01/Increase-Sudo-Password-Attempts.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/01/Sudo-Insult-Message.png
[9]:http://www.tecmint.com/su-vs-sudo-and-how-to-configure-sudo-in-linux/
[10]:http://www.tecmint.com/tag/linux-tricks/
