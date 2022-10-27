[#]: subject: "Execute Commands On Remote Linux Systems Via SSH"
[#]: via: "https://ostechnix.com/execute-commands-on-remote-linux-systems-via-ssh/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "MjSeven"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Execute Commands On Remote Linux Systems Via SSH
======
Invoking Commands Or Programs On Remote Machines Over A Secure Network Connection

The other day I was testing how to [keep file permissions intact while copying files or directories][1] to multiple locations and systems. When I wanted to check the file permissions on a remote system, I had to login to that system over SSH and check the attributes. The process of login and log-out from the remote system multiple times was bit annoying to me. I thought it would be better if I could **execute commands on remote Linux systems via SSH**.

Fortunately, I found a workaround to invoke commands and programs on a remote machine over a secure network connection after skimming through the man pages of `ssh` command.

If you ever wondered how to run a command or script on a remote system from your local system itself without logging in to that remote system, here is how to do it.

#### Contents

1. 1. Execute Commands On Remote Linux Systems Via SSH  2. 1.1. Run A Single Command On Remote Systems Over SSH  3. 1.2. Execute Multiple Commands On Remote Hosts Via SSH  4. 1.3. Invoke Commands With Sudo Privileges On Remote Machines Over SSH  5. 1.4. Run Local Scripts On Remote Systems Via SSH  6. 1.5. Save Command Output From Remote Host To Local Host  7. 1.6. Configure SSH Key-based Authentication To Avoid Password Typing
8. 2. Use sshpass While Running Commands On Remote Machines Over SSH  9. 2.1. What Is sshpass?  10. 2.2. Install sshpass In Linux  11. 2.3. Execute Commands On Remote Machines Over SSH With sshpass
12. Conclusion

### 1. Execute Commands On Remote Linux Systems Via SSH

The typical way to run a command or script on a remote system over SSH from the local system is:

```
$ ssh <username@IP_Address-or-Doman_name> <Command-or-Script>
```

Allow me to show you some examples.

#### 1.1. Run A Single Command On Remote Systems Over SSH

Let us say you want to [find Kernel details][2] of your remote Linux system. To do so, simply, run:

```
$ ssh sk@192.168.225.22 uname -a
```

Here,

* sk is the username of my remote system,
* 192.168.225.22 is the IP address of the remote system,
* And `"uname -a"` is the command that I want to run on the remote system from my local system.

**Sample output:**

![Execute Commands On Remote Linux Systems Via SSH][3]

See? I haven't actually logged-in to the remote system, but executed the `uname` command on the remote system over SSH and displayed the output in my local system's Terminal.

You can also specify the command in quotes like below.

```
$ ssh sk@192.168.225.22 "uname -a"
```

Or,

```
$ ssh sk@192.168.225.22 'uname -a'
```

If you have [changed default port of SSH protocol][4], just mention it using **-p** parameter like below.

```
$ ssh -p 2200 sk@192.168.225.22 uname -a
```

#### 1.2. Execute Multiple Commands On Remote Hosts Via SSH

You can also run multiple commands on a remote host by specifying them within quotes like below.

```
$ ssh sk@192.168.225.22 "uname -r && lsb_release -a"
```

Or,

```
$ ssh sk@192.168.225.22 "uname -r ; lsb_release -a"
```

The above commands will display the Kernel version and distribution details of my Ubuntu server.

**Sample output:**

![Run Multiple Commands On Remote Hosts Over SSH On Linux][5]

As one one of our reader mentioned in the comment section below, you should specify multiple commands in quotes. If you don't use quotes, the first command will execute on the remote system and second command will be evaluated on local machine only. The whole command in quotes will be processed remotely as intended.

#### 1.3. Invoke Commands With Sudo Privileges On Remote Machines Over SSH

Some commands requires `"sudo"` privileges to run. For instance, the following command will install **Vim** on my remote system.

```
$ ssh -t sk@192.168.225.22 sudo apt install apache2
```

**Sample output:**

![Run Commands With Sudo Privileges On Remote Machines Over SSH][6]

Did you notice? I have used **-t** flag in the above command. We need to mention this **-t** flag to force pseudo-terminal allocation. This can be used to execute arbitrary screen-based programs on a remote machine, which can be very useful, e.g. when implementing menu services.

Also, I have entered password **twice**. The first time I entered the password of the remote user to access the remote system over SSH from my local system and the second password is required to give sudo permission to the remote user to install application (i.e. apache2 in this case) on the remote system.

Let us check if the Apache service is running using command:

```
$ ssh -t sk@192.168.225.22 sudo systemctl status apache2
sk@192.168.225.22's password: 
[sudo] password for sk: 
● apache2.service - The Apache HTTP Server
Loaded: loaded (/lib/systemd/system/apache2.service; enabled; vendor preset: enabled)
Drop-In: /lib/systemd/system/apache2.service.d
└─apache2-systemd.conf
Active: active (running) since Thu 2019-12-19 11:08:03 UTC; 52s ago
Main PID: 5251 (apache2)
Tasks: 55 (limit: 2318)
CGroup: /system.slice/apache2.service
├─5251 /usr/sbin/apache2 -k start
├─5253 /usr/sbin/apache2 -k start
└─5254 /usr/sbin/apache2 -k start

Dec 19 11:08:03 ubuntuserver systemd[1]: Starting The Apache HTTP Server...
Dec 19 11:08:03 ubuntuserver apachectl[5227]: AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 2409:4072:51f:a1b6:a00:27ff:f
Dec 19 11:08:03 ubuntuserver systemd[1]: Started The Apache HTTP Server.
```

Similarly, we can run any command or script on a remote system over SSH from the local system.

#### 1.4. Run Local Scripts On Remote Systems Via SSH

Let us a create a simple script on our local system to display all the available information about your remote system's distribution name, package management and base details etc.

```
$ vi system_information.sh
```

Add the following lines:

```
#!/bin/bash
#Name: Display System Details
#Owner: OSTechNIx
#----------------------------
echo /etc/*_ver* /etc/*-rel*; cat /etc/*_ver* /etc/*-rel*
```

Press **ESC** key and type **:wq** to save the file and exit.

Now run this script on your remote system over SSH using command:

```
$ ssh sk@192.168.225.22 'bash -s' < system_information.sh
```

**Sample output:**

```
sk@192.168.225.22's password: 
/etc/debian_version /etc/lsb-release /etc/os-release
buster/sid
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=18.04
DISTRIB_CODENAME=bionic
DISTRIB_DESCRIPTION="Ubuntu 18.04.2 LTS"
NAME="Ubuntu"
VERSION="18.04.2 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04.2 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic
```

If you don't specify `'bash -s'` in the above command, you will get the details of the remote system but Pseudo-terminal will not be allocated.

#### 1.5. Save Command Output From Remote Host To Local Host

This can be useful if you want to share the output of a command that you run on the remote system over SSH with your support team or colleague.

The following command will run **"du -ah"** on your remote system over SSH and save the output in **diskusage.txt** file in your local system.

```
$ ssh sk@192.168.225.22 du -ah > diskusage.txt
```

You can then analyze the disk usage details by viewing the `diskusage.txt` file using **cat** command or text viewers.

```
$ cat diskusage.txt 
4.0K ./.profile
4.0K ./.gnupg/private-keys-v1.d
8.0K ./.gnupg
76K ./data/image.jpg
128K ./data/file.pdf
20K ./data/text.docx
5.9M ./data/audio.mp3
6.1M ./data
0 ./.sudo_as_admin_successful
4.0K ./pacman?inline=false
4.0K ./.bash_logout
4.0K ./.wget-hsts
4.0K ./.bash_history
0 ./.cache/motd.legal-displayed
4.0K ./.cache
4.0K ./deb-pacman_1.0-0.deb
4.0K ./.bashrc
6.2M .
```

#### 1.6. Configure SSH Key-based Authentication To Avoid Password Typing

If you run commands on remote systems often, you may want to configure SSH key-based authentication to skip password typing every time. More details can be found in the following link.

* [How To Configure SSH Key-based Authentication In Linux][7]

After configuring SSH key-based authentication, we can execute commands on Remote machines over SSH without entering the password:

```
$ ssh sk@192.168.225.22 sudo apt update
```

### 2. Use sshpass While Running Commands On Remote Machines Over SSH

If you don't want to configure SSH key-based authentication, you can use **sshpass** utility to run commands on remote machines via without entering password.

#### 2.1. What Is sshpass?

The sshpass utility is designed for running ssh using the keyboard-interactive password authentication mode, but in non-interactive way. To put this in simple terms - sshpass offers non-interactive way to authenticate a SSH session.

SSH uses direct TTY access to make sure that the password is indeed issued by an interactive keyboard user. Sshpass runs ssh in a dedicated tty, fooling it into thinking it is getting the password from an interactive user.

#### 2.2. Install sshpass In Linux

The sshpass utility is available in the default repositories of many Linux distributions. For instance, you can use the following command to install sshpass in Debian, Ubuntu and its derivatives:

```
$ sudo apt install sshpass
```

#### 2.3. Execute Commands On Remote Machines Over SSH With sshpass

sshpass can accept password as an argument, or read the password via an environment variable, or read the password from a text file.

**A word of caution:** All of these methods are **highly insecure**. All system users can see the password in the commands by simply issuing the **ps** command. It is **NOT RECOMMENDED** to use these methods in production. It is better to use key-based authentication instead.

Let us see examples for each method.

**Provide Password as an argument:**

To provide password as an argument, use `-p` option like below.

```
$ sshpass -p <remote-password> ssh remoteuser@ip-address <command-to-execute>
```

**Example:**

```
$ sshpass -p ubuntu ssh ostechnix@192.168.1.30 uname -a
```

Here,

* -p ubuntu - provides the password for the remote system.
* ostechnix@192.168.1.30 - Remote username and IP address.
* 'uname -a' - Command to execute on the remote machine.

**Sample output:**

```
Linux Ubuntu22CT 5.15.60-1-pve #1 SMP PVE 5.15.60-1 (Mon, 19 Sep 2022 17:53:17 +0200) x86_64 x86_64 x86_64 GNU/Linux
```

**Provide Password as an Environment variable:**

In this method, we declare an environment variable called **SSHPASS** with the remote system's password as its value. And then we provide the password with **-e** flag like below:

```
$ SSHPASS=ubuntu sshpass -e ssh ostechnix@192.168.1.30 uname -a
```

**Read Password from a text file:**

Append the password in a text file with echo command:

```
$ echo "ubuntu" > mypassword.txt
```

Now, pass the password file to sshpass lwith **-f**flag like below:

```
$ sshpass -f mypassword.txt ssh ostechnix@192.168.1.30 uname -a
```

![Execute Commands On Remote Machines Over SSH With sshpass][8]

### Conclusion

In this tutorial, we learned a few methods to invoke a command or program on a remote machine over a secure network connection. Among all the methods, the sshpass method is least secure. The users are encouraged to avoid using sshpass in production systems.

--------------------------------------------------------------------------------

via: https://ostechnix.com/execute-commands-on-remote-linux-systems-via-ssh/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/how-to-keep-ownership-and-file-permissions-intact-when-copying-files-or-directories/
[2]: https://ostechnix.com/find-out-the-linux-distribution-name-version-and-kernel-details/
[3]: https://ostechnix.com/wp-content/uploads/2019/12/Execute-Commands-On-Remote-Linux-Systems-Via-SSH.gif
[4]: https://ostechnix.com/how-to-change-apache-ftp-and-ssh-default-port-to-a-custom-port-part-3/
[5]: https://ostechnix.com/wp-content/uploads/2019/12/Run-multiple-commands-on-remote-systems-via-SSH-on-Linux.png
[6]: https://ostechnix.com/wp-content/uploads/2019/12/Run-commands-with-sudo-privileges-on-remote-systems-via-SSH.png
[7]: https://ostechnix.com/configure-ssh-key-based-authentication-linux/
[8]: https://ostechnix.com/wp-content/uploads/2022/09/Execute-Commands-On-Remote-Machines-Over-SSH-With-sshpass.png
