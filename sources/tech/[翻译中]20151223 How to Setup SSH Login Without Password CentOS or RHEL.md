translating by fw8899
How to Setup SSH Login Without Password CentOS / RHEL
================================================================================
![](http://www.ehowstuff.com/wp-content/uploads/2015/12/notebook-1071774_1280.jpg)

As a system administrator, you plan on using OpenSSH for Linux and automate your daily tasks such as transferring files or database dump file for the backup to another server. To achieve this goal, you need to log in automatically from the host A to host B. Login automatically mean you do not want to enter any password because you want to use ssh from a shell script.

In this article we’ll show you how to Setup SSH Login without Password on CentOS / RHEL. After automatic login has been configured, you can use it to move the file using SSH (Secure Shell) and secure copy (SCP).

SSH is open source and the most trusted network protocol which is used to login to the remote server. It is used by system administrators to execute commands, also used to transfer files from one computer to another over a network using SCP protocol.

After you setup SSH login without password, you can get the following advantages :

a) Automate your daily task via scripts.
b) Enhance security of your linux server. This is one of the recommended method to prevent a brute force attack on virtual private server (VPS), SSH keys are nearly impossible to decipher by brute force alone.

### What is ssh-keygen ###

ssh-keygen is a Unix utility that is used to generate, create, manage the public and private keys for ssh authentication. With the help of the ssh-keygen tool, a user can create passphrase keys for both SSH protocol version 1 and version 2. ssh-keygen creates RSA keys for SSH protocol version 1 and RSA or DSA keys for use by SSH protocol version 2.

### What is ssh-copy-id ###

ssh-copy-id is a script that copies the local-host’s public key to the remote-host’s authorized_keys file. ssh-copy-id also append the indicated identity file to that machine’s ~/.ssh/authorized_keys file and assigns proper permission to the remote-host’s home.

### SSH keys ###

SSH keys provide better and secure way of logging into a linux server with SSH. After you run ssh-keygen, you will generate public key and private key. You can place the public key on any server, and then unlock it by connecting to it with a client that already has the private key. When the two match up, the system unlocks without the need for a password.

### Setup SSH Login Without Password on CentOS and RHEL. ###

This steps tested on CentOS 5/6/7, RHEL 5/6/7 and Oracle Linux 6/7.

Node1 : 192.168.0.9
Node2 : 192.168.l.10

#### Step One : ####

Test the connection and access from node1 to node2 :

    [root@node1 ~]# ssh root@192.168.0.10
    The authenticity of host '192.168.0.10 (192.168.0.10)' can't be established.
    RSA key fingerprint is 6d:8f:63:9b:3b:63:e1:72:b3:06:a4:e4:f4:37:21:42.
    Are you sure you want to continue connecting (yes/no)? yes
    Warning: Permanently added '192.168.0.10' (RSA) to the list of known hosts.
    root@192.168.0.10's password:
    Last login: Thu Dec 10 22:04:55 2015 from 192.168.0.1
    [root@node2 ~]#

#### Step Two : ####

Generate public and private keys using ssh-key-gen. Please take note that you can increase security by protecting the private key with a passphrase.

    [root@node1 ~]# ssh-keygen
    Generating public/private rsa key pair.
    Enter file in which to save the key (/root/.ssh/id_rsa):
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    Your identification has been saved in /root/.ssh/id_rsa.
    Your public key has been saved in /root/.ssh/id_rsa.pub.
    The key fingerprint is:
    b4:51:7e:1e:52:61:cd:fb:b2:98:4b:ad:a1:8b:31:6d root@node1.ehowstuff.local
    The key's randomart image is:
    +--[ RSA 2048]----+
    |          . ++   |
    |         o o  o  |
    |        o o o  . |
    |       . o + ..  |
    |        S   .  . |
    |         .   .. .|
    |        o E oo.o |
    |         = ooo.  |
    |        . o.o.   |
    +-----------------+

#### Step Three : ####

Copy or transfer the public key to remote-host using ssh-copy-id command. It will append the indicated identity file to ~/.ssh/authorized_keys on node2 :

    [root@node1 ~]# ssh-copy-id -i ~/.ssh/id_rsa.pub 192.168.0.10
    root@192.168.0.10's password:
    Now try logging into the machine, with "ssh '192.168.0.10'", and check in:
    
    .ssh/authorized_keys
    
    to make sure we haven't added extra keys that you weren't expecting.

#### Step Four : ####

Try SSH login without Password to node2 :

    [root@node1 ~]# ssh root@192.168.0.10
    Last login: Sun Dec 13 14:03:20 2015 from www.ehowstuff.local

I hope this article gives you some ideas and quick guide on how to setup SSH login without password on Linux CentOS / RHEL.

--------------------------------------------------------------------------------

via: http://www.ehowstuff.com/ssh-login-without-password-centos/

作者：[skytech][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.ehowstuff.com/author/skytech/
