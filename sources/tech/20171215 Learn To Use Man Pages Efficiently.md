translating by lujun9972
Learn To Use Man Pages Efficiently
======
A while ago, we have published a brief guide that described how to easily [**recall forgotten Linux commands**][1]. That guide was really quite useful for those having trouble at remembering commands. Today, we are going to learn how to get want you want from man pages effectively and quickly. As you might already know, a typical man page is divided into several parts, each with a distinct heading. You might need to scroll down for quite a long time when you're looking for a particular information on the specific flag/option. This is really inefficient and time consuming process. This is why it is important to learn to use man pages efficiently to find out what exactly you want to know.

In this brief tutorial, I will be sharing few important tricks which I use daily when referring man pages.

### Learn To Use Man Pages Efficiently

#### Basic use

As we all know, we can open a man page of a command, for example "mkdir", using command:
```
man mkdir
```

Use **spacebar** , **d** , **b** and **up** / **down** arrows to browse through the man page. To go to the end of the man page, press **End** key and to go to the fist page of a man page, press **Home** key. Press **h** key in the currently opened man page to know all useful keyboard shortcuts and general usage information.

[![][2]][3]

Press **q** to exit the man page.

#### Recall a forgotten command

For those who don't know which command they actually want can refer the link that I attached in the first paragraph of this guide. We also can do it using man pages too. Let us say, you want to create a directory, but you couldn't remember what command we use to create a directory.

To do so, use grep command with man:
```
man -k directory | grep create
```

Sample output would be:
```
CURLOPT_NEW_DIRECTORY_PERMS (3) - permissions for remotely created directories
libssh2_sftp_mkdir_ex (3) - create a directory on the remote file system
mkdir (2) - create a directory
mkdirat (2) - create a directory
mkdtemp (3) - create a unique temporary directory
mkdtemp (3p) - create a unique directory or file
mkfontdir (1) - create an index of X font files in a directory
mklost+found (8) - create a lost+found directory on a mounted Linux second extended file...
mkstemp (3p) - create a unique directory
mktemp (1) - create a temporary file or directory
pam_mkhomedir (8) - PAM module to create users home directory
```

[![][2]][4]

Just read the description of the each command and pick the suitable command. Ahh, you now remember. **mkdir** is the one that you 're looking for, isn't it? It's that simple.

#### Search within man pages

Once you're in a man page, you may want to look for specific string. To do so, just type **/** (forward slash) followed by your search string like below
```
/<search_string> or <pattern>
```

Let us say, you're in man page of mount command and wants to look for information on the **- bind** option. To do so, type:
```
/bind
```

[![][2]][5]

Any matches to the search string in the current man page will be highlighted.

[![][2]][6]

Press **" n"** and **" SHIFT+n"** to browse through the next and previous matches.

/pattern(or string) - will search forward for (N-th) matching line. You can also do the backward searching using **?pattern**. This can be helpful if you are at the end or middle of the man page.
```
?bind
```

To display only matching lines, type:
```
&bind
```

[![][2]][7]

In this search method, you don't have to use "n" or "shift+n" to scroll through next and previous matches. **& pattern** will only display the matching lines that contains the search term, everything else will be omitted.

#### Search matches without opening man page

It is also possible to search for information on the specific option without opening man page.

For instance, you're looking for information on the **-m** option of **mkdir** command. To find it out, run:
```
man mkdir | grep -e '-m'
```

Or,
```
man mkdir | grep -- '-m'
```

[![][2]][8]

This command will display the **first occurrence** of **-m** in the man page of mkdir command. As we see in the above command -m represents MODE (chmod).

If you want to see the complete man page of mkdir command but skip directly to the first occurrence of **-m** , use the following command:
```
man mkdir | less +/-m
```

[![][2]][9]

Here is another example:
```
man mount | less +/--bind
```

[![][2]][10]

Press "n" and "SHIFT+n" to browse through the next and previous matches.

Also read:[3 Good Alternatives To Man Pages Every Linux User Should Know][11]

#### Export entire man page to text file

We can export the entire man page of a specific command to a text file. To do so, just run the following command:
```
man mount > mount.txt
```

This command will export the man page of the mount command to mount.txt file and save it in the current working directory.

It is also possible to obtain a simpler version of a man page, without backspaces and underscores, using the following command.
```
man mount | col -b > mount.txt
```

To know more details about man pages, run:
```
man man
```

This command will display the man page about the man pages. These tricks are just basics but enough to get going. These tricks will save you a lot of time and avoid unlimited scrolling.

And, that's all for today. Hope you find this useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/learn-use-man-pages-efficiently/

作者：[][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com
[1]:https://www.ostechnix.com/easily-recall-forgotten-linux-commands/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2017/12/man-pages-4.png ()
[4]:http://www.ostechnix.com/wp-content/uploads/2017/12/man-pages-3.png ()
[5]:http://www.ostechnix.com/wp-content/uploads/2017/12/man-pages-5.png ()
[6]:http://www.ostechnix.com/wp-content/uploads/2017/12/man-pages-6.png ()
[7]:http://www.ostechnix.com/wp-content/uploads/2017/12/man-pages-8.png ()
[8]:http://www.ostechnix.com/wp-content/uploads/2017/12/man-pages-1.png ()
[9]:http://www.ostechnix.com/wp-content/uploads/2017/12/man-pages-2-1.png ()
[10]:http://www.ostechnix.com/wp-content/uploads/2017/12/man-pages-7.png ()
[11]:https://www.ostechnix.com/3-good-alternatives-man-pages-every-linux-user-know/
