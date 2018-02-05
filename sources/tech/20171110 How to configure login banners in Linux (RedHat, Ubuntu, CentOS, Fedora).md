How to configure login banners in Linux (RedHat, Ubuntu, CentOS, Fedora)
======
Learn how to create login banners in Linux to display different warning or information messages to user who is about to log in or after he logs in.

![Login banners in Linux][1]

Whenever you login to some production systems of firm, you get to see some login messages, warnings or info about server you are about to login or already logged in like below. Those are the login banners.

![Login welcome messages in Linux][2]

In this article we will walk you through how to configure them.

There are two types of banners you can configure.

  1. Banner message to display before user log in (configure in file of your choice eg. `/etc/login.warn`)
  2. Banner message to display after user successfully logged in (configure in `/etc/motd`)



### How to display message when user connects to system before login

This message will be displayed to user when he connects to server and before he logged in. Means when he enter the username, this message will be displayed before password prompt.

You can use any filename and enter your message within. Here we used `/etc/login.warn` file and put our messages inside.

```
# cat /etc/login.warn
        !!!! Welcome to KernelTalks test server !!!!
This server is meant for testing Linux commands and tools. If you are
not associated with kerneltalks.com and not authorized please dis-connect
immediately.
```

Now, you need to supply this file and path to `sshd` daemon so that it can fetch this banner for each user login request. For that open `/etc/sshd/sshd_config` file and search for line `#Banner none`

Here you have to edit file and write your filename and remove hash mark. It should look like : `Banner /etc/login.warn`

Save file and restart `sshd` daemon. To avoid disconnecting existing connected users, use HUP signal to restart sshd.

```
oot@kerneltalks # ps -ef |grep -i sshd
root     14255     1  0 18:42 ?        00:00:00 /usr/sbin/sshd -D
root     19074 14255  0 18:46 ?        00:00:00 sshd: ec2-user [priv]
root     19177 19127  0 18:54 pts/0    00:00:00 grep -i sshd
 
root@kerneltalks # kill -HUP 14255
```

Thats it! Open new session and try login. You will be greeted with the message you configured in above steps .

![Login banner in Linux][3]

You can see message is displayed before user enter his password and log in to system.

### How to display message after user logs in

Message user sees after he logs into system successfully is **M** essage **O** f **T** he **D** ay & is controlled by `/etc/motd` file. Edit this file and enter message you want to greet user with once he successfully logged in.

```
root@kerneltalks # cat /etc/motd
           W E L C O M E
Welcome to the testing environment of kerneltalks.
Feel free to use this system for testing your Linux
skills. In case of any issues reach out to admin at
info@kerneltalks.com. Thank you.
 
```

You dont need to restart `sshd` daemon to take this change effect. As soon as you save the file, its content will be read and displayed by sshd daemon from very next login request it serves.

![motd in linux][4]

You can see in above screenshot : Yellow box is MOTD controlled by `/etc/motd` and green box is what we saw earlier login banner.

You can use tools like [cowsay][5], [banner][6], [figlet][7], [lolcat ][8]to create fancy, eye-catching messages to display at login. This method works on almost all Linux distros like RedHat, CentOs, Ubuntu, Fedora etc.

--------------------------------------------------------------------------------

via: https://kerneltalks.com/tips-tricks/how-to-configure-login-banners-in-linux/

作者：[kerneltalks][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://kerneltalks.com
[1]:https://c3.kerneltalks.com/wp-content/uploads/2017/11/login-banner-message-in-linux.png
[2]:https://c3.kerneltalks.com/wp-content/uploads/2017/11/Login-message-in-linux.png
[3]:https://c1.kerneltalks.com/wp-content/uploads/2017/11/login-banner.png
[4]:https://c3.kerneltalks.com/wp-content/uploads/2017/11/motd-message-in-linux.png
[5]:https://kerneltalks.com/tips-tricks/cowsay-fun-in-linux-terminal/
[6]:https://kerneltalks.com/howto/create-nice-text-banner-hpux/
[7]:https://kerneltalks.com/tips-tricks/create-beautiful-ascii-text-banners-linux/
[8]:https://kerneltalks.com/linux/lolcat-tool-to-rainbow-color-linux-terminal/
