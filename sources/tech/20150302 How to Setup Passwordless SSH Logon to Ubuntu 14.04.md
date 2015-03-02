How to Setup Passwordless SSH Logon to Ubuntu 14.04
================================================================================
Hi all, today we'll gonna learn how we can setup Passwordless SSH Logon to Ubuntu 14.04 "Trusty". Only the workstations having the correct matching key pair (private and public) will be allowed to logon to the SSH server, without the key paring, access will not be allowed.

Usually, we need to enter username and password combination to connect to an SSH console. If the combination is correct to that of the system's then, we get access to the server else we are denied from the access. But, there is something more secure than Password logon, we have passwordless SSH logon using the encrypted keys.

If you want to enable this secured option, we can simply disable password-logon and only allow logon using an encryption key. When using encryption keys option, the client computer generates a private and public key pair. The client then must upload the public key to the SSH server authorized_key file. Before access is granted, the server and client computer validate the key pair. If the public key on the server matches the private key submitted via the client then access will be granted else will be denied.

This is a very secure way authenticating to a SSH server and it’s a recommended method if you wish to implement secure logon with single user SSH logon. Here's a quick step-wise process on how to enable Passwordless SSH logon.

### 1. Installing Openssh Server ###

First off all, we'll need to update our local repository index. To do so, we'll first need to run apt-get update as shown below.

    $ sudo apt-get update

![Updating Repo Index](http://blog.linoxide.com/wp-content/uploads/2015/02/updating-repo-list.png)

Now, we can install openssh-server by running following command.

    $ sudo apt-get install openssh-server

![Installing openssh server](http://blog.linoxide.com/wp-content/uploads/2015/02/installing-openssh-server.png)

### 2. Enabling Openssh Server ###

Now, we'll want to enable OpenSSH server after we successfully installed it on our Ubuntu 14.04 Operating System. The command to enable/start the server is given as follows.

    $ sudo service ssh start

OR

    $ sudo /etc/init.d/ssh start

### 3. Configuring Key Pair ###

After we have installed our OpenSSH Server and enabled it. We'll now finally wanna go for generating our Public and Private Key Pair. To do that, run the following command in a terminal or console.

    $ ssh-keygen -t rsa

After running the above command, we'll be prompted to complete a series of tasks. The first will be where to save the keys, press Enter to choose the default location which is in a hidden .ssh folder in the home directory. The next prompt will be to enter the Paraphrase. I personally leave this blank (just press enter) to continue. It will then create the key pair and we’re done.

![Generating Key Pair](http://blog.linoxide.com/wp-content/uploads/2015/02/generating-key-pair.png)

After generation of the key pair, we will need to **copy the client’s public key to the SSH server** or host inorder to create trusted relationship with it. We'll need to run the commands below to copy the client public key to the server.

    $ ssh-copy-id user@ip_address

After the public key is copied to the server, we can now go and disable password logon via SSH. To do that, we'll need to open **/etc/ssh/ssh_config** via a text editor by run the commands below.

    $ sudo nano /etc/ssh/sshd_config

Now, we'll need to uncomment the lines and set the values as shown below.

![Configuring sshd Config](http://blog.linoxide.com/wp-content/uploads/2015/02/configuring-sshd_config.png)

### 4. Restarting the SSH Server ###

Finally, after we are done configuring SSH Server, we'll want to restart our SSH Server so that all the changes will take affect. To restart one can run the following command in a terminal or the console.

    $ sudo service ssh restart

OR

    $ sudo /etc/init.d/ssh restart

![Restarting ssh](http://blog.linoxide.com/wp-content/uploads/2015/02/restarting-ssh.png)

Finally, we can now ssh in to the server without a password and only from the client having the same key pair not the password.

### Conclusion ###

Hurray! We have successfully enabled Passwordless SSH logon. It is a lot secure to enable Encrypted Key Pair SSH logon . This is a very secure way authenticating to a SSH server and it’s a recommended method if you wish to implement secure logon with single user SSH logon. So, if you have any questions, suggestions, feedback please write them in the comment box below. Thank you ! Enjoy Encrypted Secure SSH Login :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/setup-passwordless-ssh-logon-ubuntu-14-04/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/