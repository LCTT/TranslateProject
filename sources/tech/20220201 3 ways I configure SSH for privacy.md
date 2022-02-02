[#]: subject: "3 ways I configure SSH for privacy"
[#]: via: "https://opensource.com/article/22/2/configure-ssh-privacy"
[#]: author: "Jonathan Garrido https://opensource.com/users/jgarrido"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

3 ways I configure SSH for privacy
======
Here's how I optimize my SSH experience and protect my servers from
unauthorized access.
![A keyboard with privacy written on it.][1]

SSH (Secure Shell) is a protocol that enables you to create a verified and private connection, securing the channel using cryptographic keys, to launch a remote shell on another machine. Using this connection, you can execute remote commands, initiate secure file transfers, forward sockets and displays and services, and much more.

Before the appearance of SSH, most remote administration was done over telnet, and to be fair, once you could establish a remote session, you could do practically whatever you need. The problem with this protocol was that traffic traveled unencrypted as pure plaintext. It didn't take much effort to use a [traffic sniffer][2] to see all the packets within a session, including those containing a username and password.

With SSH, thanks to the use of asymmetric keys, the sessions between the apparatus involved in the communication are encrypted. And nowadays this is more relevant than ever, with all the cloud servers getting administered from all over the world.

### 3 tips for SSH configuration

The most common implementation of the SSH protocol is OpenSSH, developed by the OpenBSD project and available to most Linux and Unix-like operating systems. Once you install this package, you have a file named `sshd_config` that controls most of the behavior of the service. The default settings are generally very conservative, but I tend to make some adjustments to optimize my SSH experience and protect my servers from unauthorized access.

### 1\. Change the default port 

This is the one that not all administrators remember. Anyone with a port scanner can discover an SSH port even after you moved it, so you're hardly removing yourself from harm's way, but you do conveniently avoid hundreds of unsophisticated scripts launched against your server. It's a favor you can do yourself to cut out a good amount of noise from your logs.

For this article, I had an SSH server default port TCP 22 over one cloud provider, and the average attacks per minute were 24. After changing the port to a much higher number, TCP 45678, the average of people connecting and guessing any username or password was two per day.

To change the default port for SSH, open `/etc/ssh/sshd_config` in your favorite text editor and change the value of the `Port`** **from 22 to some number greater than 1024. The line may be commented because 22 is the default (so it doesn't need to be explicitly declared in the config), so uncomment the line before saving.


```


#Port 22122
#AddressFamily any 
#ListenAddress 0.0.0.0 
#ListenAddress ::

```

Once you've changed the port and saved the file, restart the SSH server:


```
`$ sudo systemctl restart sshd`
```

### 2\. No more passwords

There's a general movement to stop using passwords as a means of authentication, with methods such as two-factor authentication gaining popularity. OpenSSH can authenticate using asymmetric keys, so there's no need to remember complex passwords, much less to rotate them every few months, or fear that someone was "shoulder surfing" while you were establishing your remote session. The use of SSH keys allows you to log in to your remote equipment quickly and securely. This often means less time processing incorrect usernames and passwords for the server itself. Login is pleasantly simple. When there's no key, there's no entry—not even a prompt.

To use this feature, you must configure both the client (the computer physically in front of you) and the server (the remote machine).

On the client machine, you must generate an SSH key pair. This consists of a public and a private key. As their names imply, one key is for you to distribute to servers you want to login to, and the other is private and must get shared with no one. Create a new key with the `ssh-keygen` command, and use the `-t` option to specify a good, recent cryptography library like `ed25519`:


```


$ ssh-keygen -t ed25519    
 Generating public/private ed25519 key pair. 
 Enter file in which to save the key (~/.ssh/id_ed25519):

```

During key creation, you get prompted to name the file. You can press **Return** to accept the default. Should you create more keys in the future, you can give each one a custom name, but having multiple keys means specifying which key you want to use for each interaction, so for now, just accept the default.

You can also give your key a passphrase. This ensures that even if someone else manages to obtain your private key (which itself should never happen), they're unable to put it to use without your passphrase. It's a useful safeguard for some keys, while it's not appropriate for others (especially those used in scripts). Press **Return** to leave your key with no passphrase or create a passphrase if you choose.

To copy your key onto a server, use the `ssh-copy-id` command. For example, if I own a server named `example.com`, then I can copy my public key to it with this command:


```
`$ ssh-copy-id jgarrido@example.com`
```

This creates or amends the file `authorized_keys` in the server's `.ssh` directory with your public key. 

Once the `ssh-copy-id` command has confirmed what it's done, try to log in from your computer to verify you can log in without a password (or with your key's passphrase if you choose to use one).

Once you're on your server without using your server account's password, edit the server's `sshd_config` and set `PasswordAuthentication` to `no`.


```
`PasswordAuthentication no`
```

Restart the `ssh` service to load the new config:


```
`$ sudo systemctl restart sshd`
```

### 3\. Decide who can log in

Most distributions don't allow the root user to log in over SSH, which ensures that only non-privileged accounts are active, using the `sudo` command to escalate privileges as required. This prevents one notable and painfully obvious target (root) from simple but all too common scripted attacks.

Similarly, a simple and powerful feature of OpenSSH is the ability to decide which users can log into a machine. To set which users get granted SSH access, open the `sshd_config` file in your favorite text editor, and add a line like this:


```
`AllowUsers jgarrido jane tux`
```

Restart the SSH service to load the new config options.

This allows only the three users (jgarrido, jane, and tux) to log in or execute any operation on the remote machine.

### Final thoughts

You can use OpenSSH to implement a strong and robust SSH server. These were only three useful options to harden your installation. Still, there are tons of features and options that you can turn on or off within the `sshd_config` file, and there are many great applications like [Fail2ban][3] that you can use to safeguard your SSH service further.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/configure-ssh-privacy

作者：[Jonathan Garrido][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jgarrido
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/privacy_keyboard_security.jpg?itok=vZ9jFdK_ (A keyboard with privacy written on it.)
[2]: https://www.redhat.com/sysadmin/troubleshoot-network-dhcp-configuration
[3]: https://opensource.com/life/15/7/pipe-dreams
