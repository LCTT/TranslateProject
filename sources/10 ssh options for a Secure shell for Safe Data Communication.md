(translating by runningwater)
10 ssh options for a Secure shell for Safe Data Communication
================================================================================
A system administrator may have managed more than 1 servers. Then those servers may located in different places. Visiting the servers one by one may not the best way to manage them. Then a remote method can be an effective way to manage them. One of the common aplication for remote activity is **SSH**.

### What is SSH ###

**SSH or Secure Shell** is a cryptographic network protocol. The data through this protocol will be encrypted to ensure that no one can read if the data leaked in the middle. To use SSH, the destination machine should have a SSH server application installed because **SSH is a client-server model**. SSH is usually used when you want to remote hosts in a secure way over the insecure network such as the Internet.

### Installing SSH ###

Modern Linux should have installed SSH by default. If its not, we can install it manually. The easiest way to install SSH is through your Linux package manager.

### On Debian / Ubuntu Linux based : ###

#### Install ssh-client ####

    $ sudo apt-get install openssh-client

#### Install ssh-server ####

    $ sudo apt-get install openssh-server

### On RedHat / CentOS Linux based : ###

    # yum install openssh-server openssh-clients

Once SSH is installed we can check it by typing **ssh** from your Linux console.

![An ssh client](http://linoxide.com/wp-content/uploads/2014/02/ssh_client.png)

### Using SSH ###

SSH provides a lot of options to be used. In this article we will cover some options that may useful in day-to-day operations.

#### 1. Run SSH without no options ####

A common way to use SSH is without any options. Just type “**ssh** ”. Here’s a sample :

    $ ssh 192.168.0.103

![SSH connecti confirmation](http://linoxide.com/wp-content/uploads/2014/02/ssh_ask_connect.png)

When the first time you connect to destination host, ssh will confirm you about the authenticity of the destination host. If you answer No****, then SSH will not continue while **if you said Yes**, SSH will continue.

![Connecting to SSH](http://linoxide.com/wp-content/uploads/2014/02/ssh_connect.png)

The next time you login into the same host, SSH will not ask you a confirmation. The authenticity oft the host by default is saved under /home/user/.ssh folder in every user.

#### 2. Specify a username for login ####

By default, ssh will try to connect using active user as a username. On the previous command, ssh will try to login into the server using a username named pungki. This is because user pungki on the client side, is running ssh client.

What about if in the destination host, there is no user named pungki? Then you must supply a username that exist in the destination host. To specify the username from the beginning, use -l option

    $ ssh -l leni 192.168.0.103

![Ssh using -l option](http://linoxide.com/wp-content/uploads/2014/02/ssh_l.png)

We can also type like this :

    $ ssh leni@192.168.0.0103

![Another way to supply username](http://linoxide.com/wp-content/uploads/2014/02/ssh_l_2.png)

#### 3. Specify the port ####

**SSH default port is 22**. Most of modern Linux are open port 22. If you run ssh without defining a port, then ssh will direct the request via port 22.

But some system administrator may changed the default SSH port. Let say that the port now is 1234. To contact that host, use **-p** option followed by SSH port.

    $ ssh 192.168.0.103 -p 1234

To change the port number, we need to modify the **/etc/ssh/ssh_config**.
Find the line :

    Port 22

Change it into another port, for example above, is 1234. Then restart the SSH service.

#### 4. Request compression on every data ####

With this option, all data which sent and received via SSH will be compressed. The data still encrypted. To use compression with SSH, use **-C** option.

    $ ssh -C 192.168.0.103

This option will be useful if your connection is slow, such as using a modem. But when you are using a fast connection such as LAN or higher, than compression will be slow down your transfer rate.
The level of compression can be controlled using **-o** option followed by **CompressionLevel** option. But this option will only applied for SSH-1.

#### 5. Define a cipher algorithm ####

SSH provides some cipher algorithms to be used. These algorithms can be seen inside **/etc/ssh/ssh_config or ~/.ssh/config file** (if exist).

![SSH cipher configuration example](http://linoxide.com/wp-content/uploads/2014/02/ssh_cipher.png)

Let say you want to use **blowfish** algorithm for encrypting your SSH session. Then you can put this line into your **/etc/ssh/ssh_config or ~/.ssh/config** file :

    Cipher blowfish

By default, SSH will use 3des algorithm

#### 6. Turn on debug mode ####

For some reason, we may want to debug the SSH connection that we want to create. SSH provides **-v** option to do this.

    $ ssh -v 192.168.0.103

![debug ssh connection](http://linoxide.com/wp-content/uploads/2014/02/ssh_v.png)

#### 7. Bind source address ####

If your client has more than 2 IP Address, you might not know which IP Address is used to create a connection to the SSH server.

![More than 1 IP Address](http://linoxide.com/wp-content/uploads/2014/02/ifconfig.png)

To solve this situation, we can use -b option which will bind an IP Address to SSH connection. This IP Address will be used as the source address of the connection.

    $ ssh -b 192.168.0.200 -l leni 192.168.0.103

On the server side, we can check the established connection to the server using netstat. We see that 192.168.0.200 connection is established.

![Bind address using SSH](http://linoxide.com/wp-content/uploads/2014/02/ssh_bind.png)

#### 8. Use other configuration file ####

By default, ssh will use a ssh configuration file which located in **/etc/ssh/ssh_config**. This file is applied to system wide. If you want to apply particular setting to specific user, you should put it in **~/.ssh/config** file. If you don’t see it, you can create it.

Here’s a sample of a custom **ssh_config**. This config is located in **/home/pungki directory**.

    Host 192.168.0.*
    ForwardX11 yes
    PasswordAuthentication yes
    ConnectTimeout 10
    Ciphers aes128-ctr,aes192-ctr,aes256-ctr,arcfour256,arcfour128,aes128-cbc,3des-cbc
    Protocol 2
    HashKnownHosts yes

To use a specific config file, we can use **-F** option.

    $ ssh -F /home/pungki/my_ssh_config 192.168.0.101

![Specify your ssh_config](http://linoxide.com/wp-content/uploads/2014/02/ssh_F.png)

### 9. Use SSH X11 Forwarding ###

For some reason, you may want to display a X11 application on the server into your client computer. SSH provides **-X** option to do this. But in order to enable this feature, we need some preparation. Here’s the settings

On the server side, you need to enable line **ForwardX11 yes or X11Forward yes** in **/etc/ssh/ssh_config**. Then restart your SSH server.

Then on the client side, type **ssh -X user@host** :

    $ ssh -X leni@192.168.0.101

Once you have logged on, you can check it by typing :

    $ echo $DISPLAY

You should see something like

    localhost:10:0

Then to run an application, just type the command of the application. Let say you want to run xclock application. Then type :

    $ xclock

![Use X11 Formading](http://linoxide.com/wp-content/uploads/2014/02/ssh_Y.png)

When it run, actually you are running the xclock application on the remote system, but display it on your local system.

![xclock](http://linoxide.com/wp-content/uploads/2014/02/xclock.png)

#### 10. Trusted X11 Forwading ####

If you pretty sure that your network is secure, then you may want to use **Trusted X11 Forwarding**. This mean that the remote X11 clients will have full access to the original X11 display. To use this option, we can use **-Y** option.

    $ ssh -Y leni@192.168.0.101

![SSH _Y for trusted connection](http://linoxide.com/wp-content/uploads/2014/02/ssh_Y1.png)

### Conclusion ###

We believe that SSH is used in wide-range area. Security and flexibility is one of the SSH offer to the user. As usual we can always type **man ssh** and **man ssh_config** to display its manual pages and explore more detail.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/learn-ssh-connection-options/

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出