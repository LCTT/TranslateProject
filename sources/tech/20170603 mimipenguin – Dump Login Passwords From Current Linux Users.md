mimipenguin – Dump Login Passwords From Current Linux Users
============================================================

 Download Your Free eBooks NOW - [10 Free Linux eBooks for Administrators][8] | [4 Free Shell Scripting eBooks][9]

Mimipenguin is a free and open source, simple yet powerful Shell/Python script used to dump the login credentials (usernames and passwords) from the current Linux desktop user and it has been tested on various Linux distributions.

Additionally, it supports applications such as: VSFTPd (active FTP client connections), Apache2 (active/old HTTP BASIC AUTH sessions but this requires Gcore) and openssh-server (active SSH connections with [sudo command usage][5]). Importantly, it’s gradually being ported to numerous languages to support all imaginable post-exploit situations.

#### How does Mimipenguin Works?

To understand how mimipenguin works, you need to keep in mind that all if not most Linux distributions store a great deal of such critical information as: credentials, encryption keys, as well as personal data in memory.

Particularly usernames and passwords are held by processes (running programs) in memory and stored as plain text for relatively long periods of time. Mimipenguin technically exploits these clear-text credentials in memory – it dumps a process and extracts lines that have a likelihood of accommodating clear-text credentials.

It then tries to perform a calculation of each word’s chances of being present by determining hashes in: /etc/shadow, memory, and regex searches. Once it finds any, it prints them on standard output.

### Installing Mimipenguin in Linux Systems

We will use git to clone the mimipenguin repository, so first install git on the system if in case you don’t have it.

```
$ sudo apt install git 		#Debian/Ubuntu systems
$ sudo yum install git		#RHEL/CentOS systems
$ sudo dnf install git		#Fedora 22+
```

Then clone the mimipenguin directory in your home folder (any where else) like this:

```
$ git clone https://github.com/huntergregal/mimipenguin.git
```

Once you have downloaded the directory, move into it and run mimipenguin as follows:

```
$ cd mimipenguin/
$ ./mimipenguin.sh 
```

Note: If you encounter the error below, use the sudo command like so:

```
Root required - You are dumping memory...
Even mimikatz requires administrator
```

![Dump Login Passwords in Linux](https://www.tecmint.com/wp-content/uploads/2017/06/Dump-Login-Passwords-in-Linux.png)

Dump Login Passwords in Linux

From the output above, mimipenguin provides you the desktop environment along with the username and password.

Alternatively, run the Python script as follows:

```
$ sudo ./mimipenguin.py
```

Note that sometimes gcore may hang the script (this is a known problem with gcore).

#### Future Updates

Below is a list of features yet to be added in mimipenguin:

*   Improving overall effectiveness

*   Adding more support and other credential locations

*   Including support for non-desktop environments

*   Adding support for LDAP

mimipenguin Github repository: [https://github.com/huntergregal/mimipenguin][6]

Also, check out:

1.  [How to Password Protect a Vim File in Linux][1]

2.  [How to Generate/Encrypt/Decrypt Random Passwords in Linux][2]

3.  [How to Protect GRUB with Password in RHEL / CentOS / Fedora Linux][3]

4.  [Resetting/Recovering Forgotten Root User Account Password in CentOS 7][4]

Do share any additional ideas relating to this tool or issues of cleartext credentials in memory in Linux via the comment section below.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

-------------

via: https://www.tecmint.com/mimipenguin-hack-login-passwords-of-linux-users/

作者：[Aaron Kili ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://www.tecmint.com/password-protect-vim-file-in-linux/
[2]:https://www.tecmint.com/generate-encrypt-decrypt-random-passwords-in-linux/
[3]:https://www.tecmint.com/password-protect-grub-in-linux/
[4]:https://www.tecmint.com/reset-forgotten-root-password-in-centos-7-rhel-7/
[5]:https://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[6]:https://github.com/huntergregal/mimipenguin
[7]:https://www.tecmint.com/author/aaronkili/
[8]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[9]:https://www.tecmint.com/free-linux-shell-scripting-books/
