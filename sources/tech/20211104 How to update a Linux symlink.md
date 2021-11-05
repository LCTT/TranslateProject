[#]: subject: "How to update a Linux symlink"
[#]: via: "https://opensource.com/article/21/11/update-linux-file-system-link"
[#]: author: "Alan Formy-Duval https://opensource.com/users/alanfdoss"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to update a Linux symlink
======
Links have always been a unique advanced feature of UNIX file systems.
![Links][1]

UNIX and Linux users find many uses for links, particularly symbolic links. One way that I like to use symbolic links is to manage configuration backups of various IT equipment.

I have a directory structure to hold everything related to documentation, updates, and other files for the computers and devices on my network. Devices can include routers, access points, NAS servers, and laptops, often of different brands and versions. The configuration backups themselves might be deep within the directory tree, e.g. `/home/alan/Documents/network/device/NetgearRL5000/config`.

To simplify the backup process, I have a directory in my home called `Configuration`. I use symbolic links from this directory to point to the specific device directory:


```


:~/Configuration/ $ ls -F1
Router@
Accesspoint@
NAS@

```

**Note**: The `-F` option of the `ls` command appends special characters to each file name to represent its type. As shown above, the `@` symbol indicates that these are links.

### Creating a link

The symbolic link **Router** points to the `config` directory of my Netgear RL5000. The command to create it is `ln -s:`


```
`$ ln -s /home/alan/Documents/network/device/NetgearRL5000/config Router`
```

Then, take a look and confirm with `ls -l:`


```


:~/Configuration/ $ ls -l
Router -&gt; /home/alan/Documents/network/device/NetgearRL5000/config
NAS -&gt; /home/alan/Documents/network/device/NFSBox/config
...

```

The advantage is that when performing maintenance on this device, I simply browse to `~/Configuration/Router`.

The second advantage of using a symbolic link becomes evident if I decide to replace this router with a new model. I might re-task the old router to be an access point. Therefore, its directory does not get deleted. Instead, I have a new directory that corresponds to the new router, perhaps an ASUS DF-3760. I create the directory and confirm its existence:


```
`$ mkdir -p ~/Documents/network/device/ASUSDF-3760/config`[/code] [code]

:~/Documents/network/device/ $ ls
NetgearRL5000
ASUSDF-3760
NFSBox
...

```

Another example could be if you have several access points throughout your offices. You can use symbolic links to represent each one logically with either a generic name, such as `ap1`, `ap2`, and so on, or you can use descriptive words such as `ap_floor2`, `ap_floor3`, etc. This way, as the physical devices change over time, you do not have to continuously update any processes that might be managing them as they are addressing the links rather than the actual device directories.

### Updating a link

Since my main router has changed, I want the router's symbolic link to point to its directory. I could use the `rm` and `ln` commands to remove and create a new symbolic link, but there is a way to do this in one step using only the `ln` command with a few options:


```


:~/Configuration/ $ ln -vfns ~/Documents/network/device/ASUSDF-3760/config/ Router
'Router' -&gt; '/home/alan/Documents/network/device/ASUSDF-3760/config/'
:~/Configuration/ $ ls -l
Router -&gt; /home/alan/Documents/network/device/ASUSDF-3760/config
NAS -&gt; /home/alan/Documents/network/device/NFSBox/config

```

The options, according to the man page, are as follow:

**-v, --verbose**

print name of each linked file

**-f, --force**

remove destination file (necessary since a link already exists)

**-n, --no-dereference**

treat LINK_NAME as a normal file if it is a symbolic link to a directory

**-s, --symbolic**

make symbolic links instead of hard links

### Wrap up

Links are one of the most powerful features of UNIX and Linux file systems. Other operating systems have tried to mimic this capability, but those never worked as well or were as usable due to the lack of a fundamental link design in their file systems.

The demonstration above is only one possibility of many to take advantage of links for seamlessly navigating an ever-changing directory structure in a living production environment. Links provides the flexibility needed in an organization that is never static for long.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/update-linux-file-system-link

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/links.png?itok=enaPOi4L (Links)
