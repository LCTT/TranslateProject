A Pocket Guide for Linux ssh Command with Examples
================================================================================
If you have been in the IT world for quite some time you probably have heard about SSH, how great a tool it is and all its cool security features. In this tutorial you will learn how to use SSH in a few minutes and login to your remote computers seamlessly and securely.

If you have no clue what SSH is you can visit [Wikipedia][1] before proceeding.

### Basic Usage ###

The simplest usage of SSH is where you specify a user and the hostname. The hostname could be an IP address or a domain name an in the following format.

    $ ssh user@hostname

For example to login to a Raspberry Pi on my LAN, I would simply type the command in the terminal as follows:

    $ ssh pi@10.42.0.47

Where pi is the user and 10.42.0.47 is the IP of the Raspberry Pi on my LAN. Change this accordingly to reflect your LAN configuration or your remote computer’s IP address.

![basic ssh](http://linoxide.com/wp-content/uploads/2014/08/basic-ssh.png)

If you have logged in successfully then the rest of the guide shall be a breeze for you.

### Using A Different Port ###

By default ssh uses port 22, but for various reasons you may want to connect to another port.

    $ ssh -p 10022 user@hostname

This will connect to ssh via port 10022 instead of port 22.

### Execute Commands Remotely ###

At times its convenient to execute a command on the remote host and get the output and continue working on the local machine. Well SSH has catered for this need,

    $ ssh pi@10.42.0.47 ls -l

This command for example will list the contents of the home directory and return the prompt to you. Cool? Try it out with other commands as well.

![remote command](http://linoxide.com/wp-content/uploads/2014/08/remote-command.png)

### Mounting remote filesystems ###

Another great tool based on ssh is sshfs. With sshfs you can mount remote filesystems and have the remote files on the local machine.

    $ sshfs -o idmap=user user@hostname:/home/user ~/Remote

For example this command can be used as:

    $ sshfs -o idmap=user pi@10.42.0.47:/home/pi ~/Pi

This will mount pi’s home directory to a folder on the local machine called Pi.

For more details on sshfs [look at our sshfs tutorial][2].

### X11 Forwarding ###

Suppose now you want to run a GUI program on your remote computer? SSH had you in mind! Login to the remote machine with the basic SSH command but -X option. This will allow X11 forwarding. After you login you might not see any difference, but once you invoke a GUI based program you notice the difference.

    $ ssh -X pi@10.42.0.47

    $ pistore

Now you may want to do other stuff on the command line while running the GUI program. Simply suffix the command with &.

    $ pistore&

![X11 forwarding](http://linoxide.com/wp-content/uploads/2014/08/X11-forwarding.png)

### Escape Sequences ###

There are various escape sequences provided by SSH. To view them, SSH to any remote machine then type tilde(~) followed by a question mark. You will see a couple of other supported escape sequences. In this example you can the output of **~#** and **~C**.

![escape sequences](http://linoxide.com/wp-content/uploads/2014/08/escape-sequences.png)

### Edit SSH Configuration ###

If you need to change SSH configuration, open the file **/etc/ssh/sshd_config** with your favourite text editor and edit whatever you need to. For example we might need to change the banner. In your text editor find the following line:

    #Banner none

Uncomment the line by deleting the # then add a path to the file with the message you want displayed. The line should now read as:

    Banner /etc/issue

In this /etc/ssh/sshd_config file you will also find the options of changing the port number, idle logout timeout e.t.c . These are fairly straight forward, but refer to the ssh manual for anything that might not be familiar before attempting to make changes.

### Generate SSH Key Pair ###

To generate a new key pair run the command as follows:

    $ ssh-keygen -t dsa

You will be asked for a passphrase then the key pair will be generated. This command will also give you the key’s randomart image.

![generate key pair](http://linoxide.com/wp-content/uploads/2014/08/generate-key-pair.png)

### Finding A Hostkey ###

Now before you add that key pair it does no harm to see if it exists already.

    $ ssh-keygen -F 10.42.0.47

![find hostkey](http://linoxide.com/wp-content/uploads/2014/08/find-hostkey.png)

### Removing A Hostkey ###

Sometimes its necessary to remove a key pair you had generated, for example when the host has changed or perhaps when you need to remove keys that are no longer used.

    $ ssh-keygen -R 10.42.0.47

This is much more convenient than opening **~/.ssh/known_hosts**
and removing the keys manually.

![remove hostkey](http://linoxide.com/wp-content/uploads/2014/08/remove-hostkey.png)

### Conclusion ###

With the above commands you will be able to use SSH with ease. There is more to explore and your imagination is your limitation.


--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/pocket-guide-linux-ssh-command/

作者：[Bobbin Zachariah][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bobbin/
[1]:http://en.wikipedia.org/wiki/Secure_Shell
[2]:http://linoxide.com/how-tos/sshfs-mount-remote-directories/