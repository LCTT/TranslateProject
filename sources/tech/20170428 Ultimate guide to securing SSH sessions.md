Ultimate guide to securing SSH sessions
======
Hi Linux-fanatics, in this tutorial we will be discussing some ways with which we make our ssh server more secure. OpenSSH is currently used by default to work on servers as physical access to servers is very limited. We use ssh to copy/backup files/folders, to remotely execute commands etc. But these ssh connections might not be as secure as we believee & we must make some changes to our default settings to make them more secure.

Here are steps needed to secure our ssh sessions,

### Use complex username & password

This is first of the problem that needs to be addressed, I have known users who have '12345' as their password. It seems they are inviting hackers to get themselves hacked. You should always have a complex password.

It should have at-least 8 characters with numbers & alphabets, lower case & upper case letter, and also special characters. A good example would be " ** ** _vXdrf23#$wd_**** " , it is not a word so dictionary attack will be useless & has uppercase, lowercase characters, numbers & special characters.

### Limit user logins

Not all the users are required to have access to ssh in an organization,  so we should make changes to our configuration file to limit user logins. Let's say only Bob & Susan are authorized have access to ssh, so open your configuration file

```
 $ vi /etc/ssh/sshd_config
```

& add the allowed users to the bottom of the file

```
 AllowUsers bob susan
```

Save the file & restart the service. Now only Bob & Susan will have access to ssh , others won't be able to access ssh.

### Configure Idle logout time


Once logged into ssh sessions, there is default time before sessions logs out on it own. By default idle logout time is 60 minutes, which according to me is way to much. Consider this, you logged into a session , executed some commands & then went out to get a cup of coffee but you forgot to log-out of the ssh. Just think what could be done in the 60 seconds, let alone in 60 minutes.

So, its wise to reduce idle log-out time to something around 5 minutes & it can be done in config file only. Open '/etc/ssh/sshd_config' & change the values

```
ClientAliveInterval 300
ClientAliveCountMax 0
```

Its in seconds, so configure them accordingly.

### Disable root logins

As we know root have access to anything & everything on the server, so we must disable root access through ssh session. Even if it is needed to complete a task that only root can do, we can escalate the  privileges of a normal user.

To disable root access, open your configuration file & change the following parameter

```
PermitRootLogin no
ClientAliveCountMax 0
```

This will disable root access to ssh sessions.

### Enable Protocol 2

SSH protocol 1 had man in the middle attack issues & other security issues as well, all these issues were addressed in Protocol 2. So protocol 1 must not be used at any cost. To change the protocol , open your sshd_config file & change the following parameter

```
 Protocol 2
```

### Enable a warning screen

It would be a good idea to enable a warning screen stating a warning about misuse of ssh, just before a user logs into the session. To create a warning screen, create a file named **" warning"** in **/etc/** folder (or any other folder)  & write something like "We monitor all our sessions on continuously. Don't misuse your access or else you will be prosecuted" or whatever you wish to warn. You can also consult legal team about this warning  to make it more official.

After this file is create, open sshd_config file & enter the following parameter into the file

```
 Banner /etc/issue
```

now you warning message will be displayed each time someone tries to access the session.

### Use non-standard ssh port

By default, ssh uses port 22 & all the brute force scripts are written for port 22 only. So to make your sessions even more secure, use a non-standard port like 15000. But make sure before selecting a port that its not being used by some other service.

To change port, open sshd_config & change the following parameter

```
 Port 15000
```

Save & restart the service and you can access the ssh only with this new port. To start a session with custom port use the following command

```
 $ ssh -p 15000 {server IP}
```

** Note:-** If using firewall, open the port on your firewall & we must also change the SELinux settings if using a custom port for ssh. Run the following command to update the SELinux label

```
$ semanage port -a -t ssh_port_t -p tcp 15000
```

### Limit IP access

If you have an environment where your server is accessed by only limited number of IP addresses, you can also allow access to those IP addresses only. Open sshd_config file & enter the following with your custom port

```
Port 15000
ListenAddress 192.168.1.100
ListenAddress 192.168.1.115
```

Now ssh session will only be available to these mentioned IPs with the custom port 15000.

### Disable empty passwords

As mentioned already that you should only use complex username & passwords, so using an empty password for remote login is a complete no-no. To disable empty passwords, open sshd_config file & edit the following parameter

```
PermitEmptyPasswords no
```

### Use public/private key based authentication

Using Public/Private key based authentication has its advantages i.e. you no longer need to enter the password when entering into a session (unless you are using a passphrase to decrypt the key) & no one can have access to your server until & unless they have the right authentication key. Process to setup public/private key based authentication is discussed in [**this tutorial here**][1].

So, this completes our tutorial on securing your ssh server. If having any doubts or issues, please leave a message in the comment box below.

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/ultimate-guide-to-securing-ssh-sessions/

作者：[SHUSAIN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/configure-ssh-server-publicprivate-key/
[2]:https://www.facebook.com/techlablinux/
[3]:https://twitter.com/LinuxTechLab
[4]:https://plus.google.com/+linuxtechlab
[5]:http://linuxtechlab.com/contact-us-2/
