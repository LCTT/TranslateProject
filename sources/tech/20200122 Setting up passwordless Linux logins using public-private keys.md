[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Setting up passwordless Linux logins using public/private keys)
[#]: via: (https://www.networkworld.com/article/3514607/setting-up-passwordless-linux-logins-using-publicprivate-keys.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Setting up passwordless Linux logins using public/private keys
======
Using a set of public/private keys to allow you to log into a remote Linux system or run commands using ssh without a password can be very convenient, but setup is just tad tricky. Here's how and a script to help.
Ivanastar / Getty Images

Setting up an account on a [Linux][1] system that allows you to log in or run commands remotely without a password isn’t all that hard, but there are some tedious details that you need to get right if you want it to work. In this post, we’re going to run through the process and then show a script that can help manage the details.

Once set up, passwordless access is especially useful if you want to run ssh commands within a script, especially one that you might want to schedule to run automatically.

It’s important to note that you do not have to be using the same user account on both systems. In fact, you can use your public key for a number of accounts on a system or for different accounts on multiple systems.

[][2]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][2]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

Here’s how to set this up.

### Which system to start on?

First, you need to start on the system from which you want to issue commands. That's the system that you will use to create the ssh keys.  You also need to have access to the account on the remote system on which those commands will be run.

To keep the roles clear, we’ll call that first system in our scenario the “boss” since it will issue commands to be run on the other system.

Thus, the command prompt:

[RELATED: Linux hardening: a 15-step checklist for a secure Linux server][3]

```
boss$
```

If you do not already have a public/private key pair set up for your account on the boss system, create one using a command like that shown below. Note that you can choose between the various encryption algorithms. (Either RSA or DSA is generally used.) Note that to access the system without typing a password, you will need to enter no password for the two prompts shown in the dialog below.

If you already have a public/private key pair associated with this account, skip this step.

```
boss$ ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/home/myself/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):            <== just press the enter key
Enter same passphrase again:                           <== just press the enter key
Your identification has been saved in /home/myself/.ssh/id_rsa.
Your public key has been saved in /home/myself/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:1zz6pZcMjA1av8iyojqo6NVYgTl1+cc+N43kIwGKOUI myself@boss
The key's randomart image is:
+---[RSA 3072]----+
|     . ..        |
|   E+ .. .       |
|  .+ .o + o      |
|   ..+.. .o* .   |
|    ... So+*B o  |
|    +   ...==B . |
| . o .   ....++. |
|o o   . . o..o+  |
|=..o.. ..o  o.   |
+----[SHA256]-----+
```

The command shown above will create both a public and a private key. What one encrypts, the other will decrypt. So, the relationship between these keys is critical and the private key should **never** be shared. Instead, it should stay in your .ssh folder on the boss system.

Notice that your public and private keys, on creation, will be saved in your .ssh folder.

The next step is to copy the **public** key to the system you want to access from the boss system without using a password. You can use **scp** to do this though, at this point, you’ll still need to enter your password. In this example, that system is called “target”.

```
boss$ scp .ssh/id_rsa.pub myacct@target:/home/myaccount
myacct@target's password:
```

On the target system (the one on which the commands will be run), you will need to install your public key. If you don’t have a .ssh directory (e.g., if you’ve never used ssh on that system), running a command like this will set one up for you:

```
target$ ssh localhost date
target$ ls -la .ssh
total 12
drwx------ 2 myacct myacct 4096 Jan 19 11:48 .
drwxr-xr-x 6 myacct myacct 4096 Jan 19 11:49 ..
-rw-r--r-- 1 myacct myacct  222 Jan 19 11:48 known_hosts
```

Still on the target system, you then need to add the public key you transferred from the “boss” system to your .ssh/authorized_keys file. The command below will add the key to the end of the file if it exists already or create the file and add the key if the file does not exist.

```
target$ cat id_rsa.pub >> .ssh/authorized_keys
```

Next, you need to make sure that the permissions on your authorized_keys file are set to 600. If not, run the **chmod 600 .ssh/authorized_keys** command.

```
target$ ls -l authorized_keys
-rw------- 1 myself myself 569 Jan 19 12:10 authorized_keys
```

Also check to be sure that permissions on your .ssh directory on the target system are set to 700. Fix the permissions with **chmod 700 .ssh** if needed.

```
target$ ls -ld .ssh
drwx------ 2 myacct myacct 4096 Jan 14 15:54 .ssh
```

At this point, you should be able to run a command remotely from your boss system to your target system without entering a password. This should work unless the target user account on the target system has an old public key for the same user and host as the one you’re trying to connect from. If so, you should be able to remove the earlier (and conflicting) entry.

### Using a script

Using a script can make some work a lot easier. In the example script below, however, the one annoying problem that you’ll run into is that you’ll have to enter the target user’s password numerous times before the password-free access is configured. One option would be to break the script into two parts – the commands that need to be run on the boss system and the commands that need to be run on the target system.

Here’s the do-it-all version of the script:

```
#!/bin/bash
# NOTE: This script requires that you have the password for the remote acct
#       in order to set up password-free access using your public key

LOC=`hostname`  # the local system from which you want to run commands from
                # wo a password

# get target system and account
echo -n "target system> "
read REM
echo -n "target user> "
read user

# create a key pair if no public key exists
if [ ! -f ~/.ssh/id_rsa.pub ]; then
  ssh-keygen -t rsa
fi

# ensure a .ssh directory exists in the remote account
echo checking for .ssh directory on remote system
ssh $user@$REM "if [ ! -d /home/$user/.ssh ]; then mkdir /home/$user/.ssh; fi"

# share the public key (using local hostname)
echo copying the public key
scp ~/.ssh/id_rsa.pub $user@$REM:/home/$user/$user-$LOC.pub

# put the public key into the proper location
echo adding key to authorized_keys
ssh $user@$REM "cat /home/$user/$user-$LOC.pub >> /home/$user/.ssh/authorized_ke
ys"

# set permissions on authorized_keys and .ssh (might be OK already)
echo setting permissions
ssh $user@$REM "chmod 600 ~/.ssh/authorized_keys"
ssh $user@$REM "chmod 700 ~/.ssh"

# try it out -- should NOT ask for a password
echo testing -- if no password is requested, you are all set
ssh $user@$REM /bin/hostname
```

The script has been configured to tell you what it is doing each time you will have to enter a password. Interaction will look something like this:

```
$ ./rem_login_setup
target system> fruitfly
target user> lola
checking for .ssh directory on remote system
lola@fruitfly's password:
copying the public key
lola@fruitfly's password:
id_rsa.pub                                    100%  567   219.1KB/s   00:00
adding key to authorized_keys
lola@fruitfly's password:
setting permissions
lola@fruitfly's password:
testing -- if no password is requested, you are all set
fruitfly
```

After the scenario shown above, you'd be able to log into lola's account on fruitfly like this:

```
$ ssh lola@fruitfly
[lola@fruitfly ~]$
```

Once passwordless login is set up, you’ll both be able to log in from the boss system to the target system without a password and run arbitrary ssh commands. Running without a password in this way does not imply that your account is less secure. However, protecting your password on the boss system could become considerably more important depending on the nature of the target.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3514607/setting-up-passwordless-linux-logins-using-publicprivate-keys.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3215226/what-is-linux-uses-featres-products-operating-systems.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://www.networkworld.com/article/3143050/linux/linux-hardening-a-15-step-checklist-for-a-secure-linux-server.html#tk.nww-fsb
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
