<<<<<<< HEAD
Translating by maywanting
=======
translating by maywanting
>>>>>>> 39eb115a31c076f0c0deee4689c172a39c387644

5 SSH Hardening Tips
======================

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/binary-1188510_1920_0.jpg?itok=ocPCL_9G)
>Make your OpenSSH sessions more secure with these simple tips.
> Creative Commons Zero

When you look at your SSH server logs, chances are they are full of attempted logins from entities of ill intent. Here are 5 general ways (along with several specific tactics) to make your OpenSSH sessions more secure.

### 1. Make Password Auth Stronger

Password logins are convenient, because you can log in from any machine anywhere. But they are vulnerable to brute-force attacks. Try these tactics for strengthening your password logins.

- Use a password generator, such as pwgen. pwgen takes several options; the most useful is password length (e.g., pwgen 12 generates a 12-character password).

- Never reuse a password. Ignore all the bad advice about not writing down your passwords, and keep a notebook with your logins written in it. If you don't believe me that this is a good idea, then believe security guru [Bruce Schneier][1]. If you're reasonably careful, nobody will ever find your notebook, and it is immune from online attacks.

- You can add extra protection to your login notebook by obscuring the logins recorded in your notebook with character substitution or padding. Use a simple, easily-memorable convention such as padding your passwords with two extra random characters, or use a single simple character substitution such as # for *.

- Use a non-standard listening port on your SSH server. Yes, this is old advice, and it's still good. Examine your logs; chances are that port 22 is the standard attack point, with few attacks on other ports.

- Use [Fail2ban][2] to dynamically protect your server from brute force attacks.

- Create non-standard usernames. Never ever enable a remote root login, and avoid "admin".

### 2. Fix Too Many Authentication Failures

When my ssh logins fail with "Too many authentication failures for carla" error messages, it makes me feel bad. I know I shouldn't take it personally, but it still stings. But, as my wise granny used to say, hurt feelings don't fix the problem. The cure for this is to force a password-based login in your ~/.ssh/config file. If this file does not exist, first create the ~/.ssh/ directory:

```
$ mkdir ~/.ssh
$ chmod 700 ~/.ssh
```

Then create the `~/.ssh/config` file in a text editor and enter these lines, using your own remote HostName address:

```
HostName remote.site.com
PubkeyAuthentication=no
```

### 3. Use Public Key Authentication

Public Key authentication is much stronger than password authentication, because it is immune to brute-force password attacks, but it’s less convenient because it relies on RSA key pairs. To begin, you create a public/private key pair. Next, the private key goes on your client computer, and you copy the public key to the remote server that you want to log into. You can log in to the remote server only from computers that have your private key. Your private key is just as sensitive as your house key; anyone who has possession of it can access your accounts. You can add a strong layer of protection by putting a passphrase on your private key.

Using RSA key pairs is a great tool for managing multiple users. When a user leaves, disable their login by deleting their public key from the server.

This example creates a new key pair of 3072 bits strength, which is stronger than the default 2048 bits, and gives it a unique name so you know what server it belongs to:

```
$ ssh-keygen -t rsa -b 3072 -f id_mailserver
```

This creates two new keys, id_mailserver and id_mailserver.pub. id_mailserver is your private key -- do not share this! Now securely copy your public key to your remote server with the ssh-copy-id command. You must already have a working SSH login on the remote server:

```
$ ssh-copy-id -i  id_rsa.pub user@remoteserver

/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
user@remoteserver's password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'user@remoteserver'"
and check to make sure that only the key(s) you wanted were added.
```

ssh-copy-id ensures that you will not accidentally copy your private key. Test your new key login by copying the example from your command output, with single quotes:

```
$ ssh 'user@remoteserver'
```

It should log you in using your new key, and if you set a password on your private key, it will prompt you for it.

### 4. Disable Password Logins

Once you have tested and verified your public key login, disable password logins so that your remote server is not vulnerable to brute force password attacks. Do this in the /etc/sshd_config file on your remote server with this line:

```
PasswordAuthentication no
```

Then restart your SSH daemon.

### 5. Set Up Aliases -- They’re Fast and Cool

You can set up aliases for remote logins that you use a lot, so instead of logging in with something like "ssh -u username -p 2222 remote.site.with.long-name", you can use "ssh remote1". Set it up like this in your ~/.ssh/config file:

```
Host remote1
HostName remote.site.with.long-name
Port 2222
User username
PubkeyAuthentication no
```

If you are using public key authentication, it looks like this:

```
Host remote1
HostName remote.site.with.long-name
Port 2222
User username
IdentityFile  ~/.ssh/id_remoteserver
```

The [OpenSSH documentation][3] is long and detailed, but after you have mastered basic SSH use, you'll find it's very useful and contains a trove of cool things you can do with OpenSSH.



--------------------------------------------------------------------------------

via: https://www.linux.com/learn/5-ssh-hardening-tips

作者：[CARLA SCHRODER][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/cschroder
[1]: https://www.schneier.com/blog/archives/2005/06/write_down_your.html
[2]: http://www.fail2ban.org/wiki/index.php/Main_Page
[3]: http://www.openssh.com/
