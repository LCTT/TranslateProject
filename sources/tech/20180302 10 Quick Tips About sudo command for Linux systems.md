10 Quick Tips About sudo command for Linux systems
======

![Linux-sudo-command-tips][1]

### Overview

**sudo** stands for **superuser do**. It allows authorized users to execute command as an another user. Another user can be regular user or superuser. However, most of the time we use it to execute command with elevated privileges.

sudo command works in conjunction with security policies, default security policy is sudoers and it is configurable via **/etc/sudoers** file. Its security policies are highly extendable. One can develop and distribute their own policies as plugins.

#### How it’s different than su

In GNU/Linux there are two ways to run command with elevated privileges:

  * Using **su** command
  * Using **sudo** command



**su** stands for **switch user**. Using su, we can switch to root user and execute command. But there are few drawbacks with this approach.

  * We need to share root password with another user.
  * We cannot give controlled access as root user is superuser
  * We cannot audit what user is doing.



sudo addresses these problems in unique way.

  1. First of all, we don’t need to compromise root user password. Regular user uses its own password to execute command with elevated privileges.
  2. We can control access of sudo user meaning we can restrict user to execute only certain commands.
  3. In addition to this all activities of sudo user are logged hence we can always audit what actions were done. On Debian based GNU/Linux all activities are logged in **/var/log/auth.log** file.



Later sections of this tutorial sheds light on these points.

#### Hands on with sudo

Now, we have fair understanding about sudo. Let us get our hands dirty with practical. For demonstration, I am using Ubuntu. However, behavior with another distribution should be identical.

#### Allow sudo access

Let us add regular user as a sudo user. In my case user’s name is linuxtechi

1) Edit /etc/sudoers file as follows:
```
$ sudo visudo

```

2) Add below line to allow sudo access to user linuxtechi:
```
linuxtechi ALL=(ALL) ALL

```

In above command:

  * linuxtechi indicates user name
  * First ALL instructs to permit sudo access from any terminal/machine
  * Second (ALL) instructs sudo command to be allowed to execute as any user
  * Third ALL indicates all command can be executed as root



#### Execute command with elevated privileges

To execute command with elevated privileges, just prepend sudo word to command as follows:
```
$ sudo cat /etc/passwd

```

When you execute this command, it will ask linuxtechi’s password and not root user password.

#### Execute command as an another user

In addition to this we can use sudo to execute command as another user. For instance, in below command, user linuxtechi executes command as a devesh user:
```
$ sudo -u devesh whoami
[sudo] password for linuxtechi:
devesh

```

#### Built in command behavior

One of the limitation of sudo is – Shell’s built in command doesn’t work with it. For instance, history is built in command, if you try to execute this command with sudo then command not found error will be reported as follows:
```
$ sudo history
[sudo] password for linuxtechi:
sudo: history: command not found

```

**Access root shell**

To overcome above problem, we can get access to root shell and execute any command from there including Shell’s built in.

To access root shell, execute below command:
```
$ sudo bash

```

After executing this command – you will observe that prompt sign changes to pound (#) character.

### Recipes

In this section we’ll discuss some useful recipes which will help you to improve productivity. Most of the commands can be used to complete day-to-day task.

#### Execute previous command as a sudo user

Let us suppose you want to execute previous command with elevated privileges, then below trick will be useful:
```
$ sudo !4

```

Above command will execute 4th command from history with elevated privileges.

#### sudo command with Vim

Many times we edit system’s configuration files and while saving we realize that we need root access to do this. Because this we may lose our changes. There is no need to get panic, we can use below command in Vim to rescue from this situation:
```
:w !sudo tee %

```

In above command:

  * Colon (:) indicates we are in Vim’s ex mode
  * Exclamation (!) mark indicates that we are running shell command
  * sudo and tee are the shell commands
  * Percentage (%) sign indicates all lines from current line



#### Execute multiple commands using sudo

So far we have executed only single command with sudo but we can execute multiple commands with it. Just separate commands using semicolon (;) as follows:
```
$ sudo -- bash -c 'pwd; hostname; whoami'

```

In above command:

  * Double hyphen (–) stops processing of command line switches
  * bash indicates shell name to be used for execution
  * Commands to be executed are followed by –c option



#### Run sudo command without password

When sudo command is executed first time then it will prompt for password and by default password will be cached for next 15 minutes. However, we can override this behavior and disable password authentication using NOPASSWD keyword as follows:
```
linuxtechi ALL=(ALL) NOPASSWD: ALL

```

#### Restrict user to execute certain commands

To provide controlled access we can restrict sudo user to execute only certain commands. For instance, below line allows execution of echo and ls commands only
```
linuxtechi ALL=(ALL) NOPASSWD: /bin/echo /bin/ls

```

#### Insights about sudo

Let us dig more about sudo command to get insights about it.
```
$ ls -l /usr/bin/sudo
-rwsr-xr-x 1 root root 145040 Jun 13  2017 /usr/bin/sudo

```

If you observe file permissions carefully, **setuid** bit is enabled on sudo. When any user runs this binary it will run with the privileges of the user that owns the file. In this case it is root user.

To demonstrate this, we can use id command with it as follows:
```
$ id
uid=1002(linuxtechi) gid=1002(linuxtechi) groups=1002(linuxtechi)

```

When we execute id command without sudo then id of user linuxtechi will be displayed.
```
$ sudo id
uid=0(root) gid=0(root) groups=0(root)

```

But if we execute id command with sudo then id of root user will be displayed.

### Conclusion

Takeaway from this article is – sudo provides more controlled access to regular users. Using these techniques multiple users can interact with GNU/Linux in secure manner.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/quick-tips-sudo-command-linux-systems/

作者：[Pradeep Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxtechi.com/author/pradeep/
[1]:https://www.linuxtechi.com/wp-content/uploads/2018/03/Linux-sudo-command-tips.jpg
