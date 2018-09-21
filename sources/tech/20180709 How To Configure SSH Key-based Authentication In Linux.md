LuMing translating
How To Configure SSH Key-based Authentication In Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2017/01/Configure-SSH-Key-based-Authentication-In-Linux-720x340.png)

### What is SSH Key-based authentication?

As we all know, **Secure Shell** , shortly **SSH** , is the cryptographic network protocol that allows you to securely communicate/access a remote system over unsecured network, for example Internet. Whenever you send a data over an unsecured network using SSH, the data will be automatically encrypted in the source system, and decrypted in the destination side. SSH provides four authentication methods namely **password-based authentication** , **key-based authentication** , **Host-based authentication** , and **Keyboard authentication**. The most commonly used authentication methods are password-based and key-based authentication.

In password-based authentication, all you need is the password of the remote system’s user. If you know the password of remote user, you can access the respective system using **“ssh[[email protected]][1]”**. On the other hand, in key-based authentication, you need to generate SSH key pairs and upload the SSH public key to the remote system in order to communicate it via SSH. Each SSH key pair consists of a private key and public key. The private key should be kept within the client system, and the public key should uploaded to the remote systems. You shouldn’t disclose the private key to anyone. Hope you got the basic idea about SSH and its authentication methods.

In this tutorial, we will be discussing how to configure SSH key-based authentication in Linux.

### Configure SSH Key-based Authentication In Linux

For the purpose of this guide, I will be using Arch Linux system as local system and Ubuntu 18.04 LTS as remote system.

Local system details:

  * **OS** : Arch Linux Desktop
  * **IP address** : 192.168.225.37 /24



Remote system details:

  * **OS** : Ubuntu 18.04 LTS Server
  * **IP address** : 192.168.225.22/24



### Local system configuration

Like I said already, in SSH key-based authentication method, the public key should be uploaded to the remote system that you want to access via SSH. The public keys will usually be stored in a file called **~/.ssh/authorized_keys** in the remote SSH systems.

**Important note:** Do not generate key pairs as **root** , as only root would be able to use those keys. Create key pairs as normal user.

Now, let us create the SSH key pair in the local system. To do so, run the following command in your client system.
```
$ ssh-keygen

```

The above command will create 2048 bit RSA key pair. Enter the passphrase twice. More importantly, Remember your passphrase. You’ll need it later.

**Sample output:**
```
Generating public/private rsa key pair.
Enter file in which to save the key (/home/sk/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/sk/.ssh/id_rsa.
Your public key has been saved in /home/sk/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:wYOgvdkBgMFydTMCUI3qZaUxvjs+p2287Tn4uaZ5KyE [email protected]
The key's randomart image is:
+---[RSA 2048]----+
|+=+*= + |
|o.o=.* = |
|.oo * o + |
|. = + . o |
|. o + . S |
| . E . |
| + o |
| +.*o+o |
| .o*=OO+ |
+----[SHA256]-----+

```

In case you have already created the key pair, you will see the following message. Just type “y” to create overwrite the existing key .
```
/home/username/.ssh/id_rsa already exists.
Overwrite (y/n)?

```

Please note that **passphrase is optional**. If you give one, you’ll be asked to enter the password every time when you try to SSH a remote system unless you are using any SSH agent to store the password. If you don’t want passphrase(not safe though), simply press ENTER key twice when you’ll be asked to enter the passphrase. However, we recommend you to use passphrase. Using a password-less ssh key is generally not a good idea from a security point of view. They should be limited to very specific cases such as services having to access a remote system without the user intervention (e.g. remote backups with rsync, …).

If you already have a ssh key without a passphrase in private file **~/.ssh/id_rsa** and wanted to update key with passphrase, use the following command:
```
$ ssh-keygen -p -f ~/.ssh/id_rsa

```

Sample output:
```
Enter new passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved with the new passphrase.

```

Now, we have created the key pair in the local system. Now, copy the SSH public key to your remote SSH server using command:

Here, I will be copying the local (Arch Linux) system’s public key to the remote system (Ubuntu 18.04 LTS in my case). Technically speaking, the above command will copy the contents of local system’s **~/.ssh/id_rsa.pub key** into remote system’s **~/.ssh/authorized_keys** file. Clear? Good.

Type **yes** to continue connecting to your remote SSH server. And, then Enter the root user’s password of the remote system.
```
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
[email protected]2.168.225.22's password:

Number of key(s) added: 1

Now try logging into the machine, with: "ssh '[email protected]'"
and check to make sure that only the key(s) you wanted were added.

```

If you have already copied the key, but want to update the key with new passphrase, use **-f** option to overwrite the existing key like below.

We have now successfully added the local system’s SSH public key to the remote system. Now, let us disable the password-based authentication completely in the remote system. Because, we have configured key-based authentication, so we don’t need password-base authentication anymore.

### Disable SSH Password-based authentication in remote system

You need to perform the following commands as root or sudo user.

To disable password-based authentication, go to your remote system’s console and edit **/etc/ssh/sshd_config** configuration file using any editor:
```
$ sudo vi /etc/ssh/sshd_config

```

Find the following line. Uncomment it and set it’s value as **no**.
```
PasswordAuthentication no

```

Restart ssh service to take effect the changes.
```
$ sudo systemctl restart sshd

```

### Access Remote system from local system

Go to your local system and SSH into your remote server using command:

Enter the passphrase.

**Sample output:**
```
Enter passphrase for key '/home/sk/.ssh/id_rsa':
Last login: Mon Jul 9 09:59:51 2018 from 192.168.225.37
[email protected]:~$

```

Now, you’ll be able to SSH into your remote system. As you noticed, we have logged-in to the remote system’s account using passphrase which we created earlier using **ssh-keygen** command, not using the actual account’s password.

If you try to ssh from another client system, you will get this error message. Say for example, I am tried to SSH into my Ubuntu system from my CentOS using command:

**Sample output:**
```
The authenticity of host '192.168.225.22 (192.168.225.22)' can't be established.
ECDSA key fingerprint is 67:fc:69:b7:d4:4d:fd:6e:38:44:a8:2f:08:ed:f4:21.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '192.168.225.22' (ECDSA) to the list of known hosts.
Permission denied (publickey).

```

As you see in the above output, I can’t SSH into my remote Ubuntu 18.04 systems from any other systems, except the CentOS system.

### Adding more Client system’s keys to SSH server

This is very important. Like I said already, you can’t access the remote system via SSH, except the one you configured (In our case, it’s Ubuntu). I want to give permissions to more clients to access the remote SSH server. What should I do? Simple. You need to generate the SSH key pair in all your client systems and copy the ssh public key manually to the remote server that you want to access via SSH.

To create SSH key pair on your client system’s, run:
```
$ ssh-keygen

```

Enter the passphrase twice. Now, the ssh key pair is generated. You need to copy the public ssh key (not private key) to your remote server manually.

Display the pub key using command:
```
$ cat ~/.ssh/id_rsa.pub

```

You should an output something like below.

Copy the entire contents (via USB drive or any medium) and go to your remote server’s console. Create a directory called **ssh** in the home directory as shown below. You need to execute the following commands as root user.
```
$ mkdir -p ~/.ssh

```

Now, append the your client system’s pub key which you generated in the previous step in a file called
```
echo {Your_public_key_contents_here} >> ~/.ssh/authorized_keys

```

Restart ssh service on the remote system. Now, you’ll be able to SSH to your server from the new client.

If manually adding ssh pubkey seems difficult, enable password-based authentication temporarily in the remote system and copy the key using “ssh-copy-id” command from your local system and finally disable the password-based authentication.

**Suggested read:**

And, that’s all for now. SSH Key-based authentication provides an extra layer protection from brute-force attacks. As you can see, configuring key-based authentication is not that difficult either. It is one of the recommended method to keep your Linux servers safe and secure.

I will be here soon with another useful article. Until then, stay tuned with OSTechNix.

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/configure-ssh-key-based-authentication-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/cdn-cgi/l/email-protection
