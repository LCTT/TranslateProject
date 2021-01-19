[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Automatically Accept SSH Key Fingerprint?)
[#]: via: (https://www.2daygeek.com/how-to-automatically-accept-ssh-key-fingerprint/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Automatically Accept SSH Key Fingerprint?
======

**[SSH Secure Shell][1]** is an encryption network protocol that provides secure encrypted communications between two hosts.

It allows you to connect to a remote machine securely over an insecure network.

When you connect to a Linux system for the first time, SSH prompts you to accept the fingerprint of the machines to successfully establish the connection, since you do not have a fingerprint in your **“known_hosts”** file.

Fingerprint is a shortened version of the system’s public key.

To protect yourself from Man-in-the-Middle Attack (MITM), the ssh program verifies the fingerprint of the remote system ssh with the fingerprint stored since it was last connected.

If the fingerprint has changed you will be alerted and asked if you would like to proceed. Otherwise, you will be allowed to log in directly.

But sometimes you may need to accept SSH fingerprint automatically.

For instance, if you created a **[shell script][2]** to run against multiple machines to pull a report.

**Make a Note:** You are effectively bypassing SSH intended security through the methods below. It is less dangerous when using it on the internal network, but it is not advisable to use it on the public Internet or other untrusted networks.

This can be done using the following two methods.

  * Automatically accept an ssh fingerprint using the “StrictHostKeyChecking=no” option with the ssh command
  * Auto accepts an ssh fingerprint using the ssk-keycan command



When you connect to a remote computer for the first time, you will be warned that the authenticity of the host cannot be established and presented with a key fingerprint to verify.

```
$ ssh [email protected]
The authenticity of host '192.168.1.4 (192.168.1.4)' can't be established.
ECDSA key fingerprint is 6a:75:e3:ac:5d:f8:cc:04:01:7b:ef:4d:42:ad:b9:83.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.1.4' (ECDSA) to the list of known hosts.
[email protected]'s password:
Last login: Mon Dec 14 14:16:51 2020 from 192.168.1.6
```

Once you accept the fingerprint, it will be saved in the “known_hosts” file.

When reconnecting to the same remote host, SSH checks the fingerprint against the known_host file to verify its identity.

If this matches, you will be allowed direct access to the system as long as the key remains intact.

You will see the following warning if the fingerprint does not match the known_hosts. This happens if the host public key changes for some reason.

If you see the warning below, double-check that you are actually connecting with the right host on a secure connection. Although most of the time it is harmless, it can be an indication of a potential issue.

```
$ ssh [email protected]
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED! @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that the RSA host key has just been changed.
The fingerprint for the RSA key sent by the remote host is
6a:75:e3:ac:5d:f8:cc:04:01:7b:ef:4d:42:ad:b9:83.
Please contact your system administrator.
Add correct host key in /root/.ssh/known_hosts to get rid of this message.
Offending key in /root/.ssh/known_hosts:1
Password authentication is disabled to avoid man-in-the-middle attacks.
Keyboard-interactive authentication is disabled to avoid man-in-the-middle attacks.
********************************************************
Permission denied (publickey,password,keyboard-interactive).
```

### 1) How to Automatically Accept SSH Key Fingerprint Using SSH Option?

This method is simple and straight forward, to achieve this only need to add an option with SSH command.

When you use this option, ssh will automatically add a new host key to the user known_host file and allow it to host connections with modified hostkeys to connect to the remote system.

```
$ ssh -o "StrictHostKeyChecking no" 192.168.1.5
Warning: Permanently added 'centos7,192.168.1.5' (ECDSA) to the list of known hosts.
ok
```

However, the above warning shows that it has added a key to the known_host file.

### 2) How to Automatically Accept SSH Key Fingerprint Using ssk-keyscan Command?

This is another method, it is very simple. The ssh-keycan tool allows you to append the ssh key fingerprint to the user-known_host file on the remote server.

This tool is very useful when you want to add bulk.

This command must be inserted into the shell script before calling the actual command in the script.

Use the following format to add the ssh key fingerprint to a remote host.

```
$ ssh-keyscan -H 192.168.1.4 >> ~/.ssh/known_hosts
#centos:22 SSH-2.0-OpenSSH_7.4
```

Use the following format to add the ssh key fingerprint to multiple hosts.

To do so, you must add the remote hosts details to a file and call it with the ssh-keycan command as follows. For example, I added five hosts to the **“remote-hosts.txt”** file.

You can use any text editor to add entries. I recommend you to use **[vim editor][3]**, the most flexible and powerful text editor widely used by Linux administrators and developers.

```
# vi remote-hosts.txt

192.168.1.2
192.168.1.3
192.168.1.4
192.168.1.5
192.168.1.6
```

If yes, the ssh-keyscan command would be as follows.

```
$ ssh-keyscan -f /tmp/remote-hosts.txt >> ~/.ssh/known_hosts
#centos:22 SSH-2.0-OpenSSH_7.4
#centos:22 SSH-2.0-OpenSSH_7.4
#centos:22 SSH-2.0-OpenSSH_7.4
#centos:22 SSH-2.0-OpenSSH_7.4
#centos:22 SSH-2.0-OpenSSH_7.4
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-automatically-accept-ssh-key-fingerprint/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/ssh-tutorials/
[2]: https://www.2daygeek.com/category/shell-scripts/
[3]: https://www.2daygeek.com/basic-vim-commands-cheat-sheet-quick-start-guide/
