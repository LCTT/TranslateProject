ucasFL translating
# How to install SSH ( secure shell ) service on Kali Linux

Contents

*   *   [1. Objective][4]
    *   [2. Requirements][5]
    *   [3. Difficulty][6]
    *   [4. Conventions][7]
    *   [5. Instructions][8]
        *   [5.1. Install SSH][1]
        *   [5.2. Enable and Start SSH][2]
        *   [5.3. Allow SSH Root Access][3]

### Objective

The objective is to install SSH ( secure shell ) service on Kali Linux.

### Requirements

Privileged access to your Kali Linux installation or Live system is required.

### Difficulty

EASY

### Conventions

*   **#** - requires given command to be executed with root privileges either directly as a root user or by use of `sudo` command
*   **$** - given command to be executed as a regular non-privileged user

### Instructions

### Install SSH

From the terminal use `apt-get` command to install SSH packages:
```
# apt-get update
# apt-get install ssh
```

### Enable and Start SSH

To make sure that secure shell starts after reboot use `systemctl` command to enable it:
```
# systemctl enable ssh
```
To start SSH for a current session execute:
```
# service ssh start
```

### Allow SSH Root Access

By default SSH would not allow you to SSH login as root user, thus the following error message will appear:
```
Permission denied, please try again.
```
You have two options in order to be able to SSH into your Kali Linux. First option is to create a new non-privileged user and use its credentials to log in. Second, allow the root user to access the secure shell. To do so, either edit or insert the following line within the `/etc/ssh/sshd_config` SSH config file:
```
FROM:
#PermitRootLogin prohibit-password
TO:
PermitRootLogin yes
```

<center style="box-sizing: inherit;">
 ![kali linux enable ssh root access](https://linuxconfig.org/images/enable-root-ssh-login-kali-linux.jpg)
</center>

After you have made the above change of the `/etc/ssh/sshd_config`, restart ssh service before you attempt SSH login as a root user:

```
# service ssh restart
```


--------------------------------------------------------------------------------

via: https://linuxconfig.org/how-to-install-ssh-secure-shell-service-on-kali-linux

作者：[Lubos Rendek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org/how-to-install-ssh-secure-shell-service-on-kali-linux
[1]:https://linuxconfig.org/how-to-install-ssh-secure-shell-service-on-kali-linux#h5-1-install-ssh
[2]:https://linuxconfig.org/how-to-install-ssh-secure-shell-service-on-kali-linux#h5-2-enable-and-start-ssh
[3]:https://linuxconfig.org/how-to-install-ssh-secure-shell-service-on-kali-linux#h5-3-allow-ssh-root-access
[4]:https://linuxconfig.org/how-to-install-ssh-secure-shell-service-on-kali-linux#h1-objective
[5]:https://linuxconfig.org/how-to-install-ssh-secure-shell-service-on-kali-linux#h2-requirements
[6]:https://linuxconfig.org/how-to-install-ssh-secure-shell-service-on-kali-linux#h3-difficulty
[7]:https://linuxconfig.org/how-to-install-ssh-secure-shell-service-on-kali-linux#h4-conventions
[8]:https://linuxconfig.org/how-to-install-ssh-secure-shell-service-on-kali-linux#h5-instructions
