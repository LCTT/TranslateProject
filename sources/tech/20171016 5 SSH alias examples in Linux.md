ch-cn translating
5 SSH alias examples in Linux
======
[![][1]][1]

As a Linux user, we use[ ssh command][2] to log in to remote machines. The more you use ssh command, the more time you are wasting in typing some significant commands. We can use either [alias defined in your .bashrc file][3] or functions to minimize the time you spend on CLI. But this is not a better solution. The better solution is to use **SSH-alias** in ssh config file.

A couple of examples where we can better the ssh commands we use.

Connecting to ssh to AWS instance is a pain. Just to type below command, every time is complete waste your time as well.

to
```
ssh aws1
```

Connecting to a system when debugging.

to
```
ssh xyz
```

In this post, we will see how to achieve shorting of your ssh commands without using bash alias or functions. The main advantage of ssh alias is that all your ssh command shortcuts are stored in a single file and easy to maintain. The other advantage is we can use same alias **for both SSH and SCP commands alike**.

Before we jump into actual configurations, we should know difference between /etc/ssh/ssh_config, /etc/ssh/sshd_config, and ~/.ssh/config files. Below is the explanation for these files.

## Difference between /etc/ssh/ssh_config and ~/.ssh/config

System-level SSH configurations are stored in /etc/ssh/ssh_config. Whereas user-level ssh configurations are stored in ~/.ssh/config file.

## Difference between /etc/ssh/ssh_config and /etc/ssh/sshd_config

System-level SSH configurations are stored in /etc/ssh/ssh_config. Whereas system level SSH server configurations are stored in /etc/ssh/sshd_config file.

## **Syntax for configuration in ~/.ssh/config file**

Syntax for ~/.ssh/config file content.
```
config val
config val1 val2
```

**Example1:** Create SSH alias for a host(www.linuxnix.com)

Edit file ~/.ssh/config with following content
```
Host tlj
 User root
 HostName 18.197.176.13
 port 22
```

Save the file

The above ssh alias uses

  1. **tlj as an alias name**
  2. **root as a user who will log in**
  3. **18.197.176.13 as hostname IP address**
  4. **22 as a port to access SSH service.**



Output:
```
sanne@Surendras-MacBook-Pro:~ > ssh tlj
Welcome to Ubuntu 16.04.3 LTS (GNU/Linux 4.4.0-93-generic x86_64)
 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
  Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud
Last login: Sat Oct 14 01:00:43 2017 from 20.244.25.231
root@linuxnix:~# exit
logout
Connection to 18.197.176.13 closed.
```

**Example2:** Using ssh key to login to the system without using password using **IdentityFile**.

Example:
```
Host aws
 User ec2-users
 HostName ec2-54-200-184-202.us-west-2.compute.amazonaws.com
 IdentityFile ~/Downloads/surendra.pem
 port 22
```

**Example3:** Use a different alias for the same host. In below example, we use **tlj, linuxnix, linuxnix.com** for same IP/hostname 18.197.176.13.

~/.ssh/config file content
```
Host tlj linuxnix linuxnix.com
 User root
 HostName 18.197.176.13
 port 22
```

**Output:**
```
sanne@Surendras-MacBook-Pro:~ > ssh tlj
Welcome to Ubuntu 16.04.3 LTS (GNU/Linux 4.4.0-93-generic x86_64)
* Documentation: https://help.ubuntu.com
* Management: https://landscape.canonical.com
* Support: https://ubuntu.com/advantage
Get cloud support with Ubuntu Advantage Cloud Guest:
http://www.ubuntu.com/business/services/cloud
Last login: Sat Oct 14 01:00:43 2017 from 220.244.205.231
root@linuxnix:~# exit
logout
Connection to 18.197.176.13 closed.
sanne@Surendras-MacBook-Pro:~ > ssh linuxnix.com
Welcome to Ubuntu 16.04.3 LTS (GNU/Linux 4.4.0-93-generic x86_64)
* Documentation: https://help.ubuntu.com
* Management: https://landscape.canonical.com
* Support: https://ubuntu.com/advantage
```
```
Get cloud support with Ubuntu Advantage Cloud Guest:
http://www.ubuntu.com/business/services/cloud
Last login: Sun Oct 15 20:31:08 2017 from 1.129.110.13
root@linuxnix:~# exit
logout
Connection to 138.197.176.103 closed.
[6571] sanne@Surendras-MacBook-Pro:~ > ssh linuxnix
Welcome to Ubuntu 16.04.3 LTS (GNU/Linux 4.4.0-93-generic x86_64)
* Documentation: https://help.ubuntu.com
* Management: https://landscape.canonical.com
* Support: https://ubuntu.com/advantage
Get cloud support with Ubuntu Advantage Cloud Guest:
http://www.ubuntu.com/business/services/cloud
Last login: Sun Oct 15 20:31:20 2017 from 1.129.110.13
root@linuxnix:~# exit
logout
Connection to 18.197.176.13 closed.
```

**Example4:** Copy a file to remote system using same SSH alias

Syntax:
```
**scp <filename> <ssh_alias>:<location>**
```

Example:
```
sanne@Surendras-MacBook-Pro:~ > scp abc.txt tlj:/tmp
abc.txt                           100%   12KB  11.7KB/s   00:01    
sanne@Surendras-MacBook-Pro:~ >
```

As we already set ssh host as an alias, using SCP is a breeze as both ssh and SCP use almost same syntax and options.

To do scp a file from local machine to remote one use below.

**Examaple5:** Resolve SSH timeout issues in Linux. By default, your ssh logins are timed out if you don 't activily use the terminial.

[SSH timeouts][5] are one more pain where you have to re-login to a remote machine after a certain time. We can set SSH time out right in side your ~/.ssh/config file to make your session active for whatever time you want. To achieve this we will use two SSH options for keeping the session alive. One ServerAliveInterval keeps your session live for number of seconds and ServerAliveCountMax will initial session after session for a given number.
```
**ServerAliveInterval A**
**ServerAliveCountMax B**
```

**Example:**
```
Host tlj linuxnix linuxnix.com
 User root
 HostName 18.197.176.13
 port 22
 ServerAliveInterval 60**
 ServerAliveCountMax 30
```

We will see some other exiting howto in our next post. Keep visiting linuxnix.com.

--------------------------------------------------------------------------------

via: https://www.linuxnix.com/5-ssh-alias-examples-using-ssh-config-file/

作者：[Surendra Anne;Max Ntshinga;Otto Adelfang;Uchechukwu Okeke][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxnix.com
[1]:https://www.linuxnix.com/wp-content/uploads/2017/10/SSH-alias-1.png
[2]:https://www.linuxnix.com/ssh-access-remote-linux-server/
[3]:https://www.linuxnix.com/linux-alias-command-explained-with-examples/
[4]:/cdn-cgi/l/email-protection
[5]:https://www.linuxnix.com/how-to-auto-logout/
