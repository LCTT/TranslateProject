Users, Groups, and Other Linux Beasts
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/flamingo-2458782_1920.jpg?itok=_gkzGGx5)

Having reached this stage, [after seeing how to manipulate folders/directories][1], but before flinging ourselves headlong into fiddling with files, we have to brush up on the matter of _permissions_ , _users_ and _groups_. Luckily, [there is already an excellent and comprehensive tutorial on this site that covers permissions][2], so you should go and read that right now. In a nutshell: you use permissions to establish who can do stuff to files and directories and what they can do with each file and directory -- read from it, write to it, move it, erase it, etc.

To try everything this tutorial covers, you'll need to create a new user on your system. Let's be practical and make a user for anybody who needs to borrow your computer, that is, what we call a _guest account_.

**WARNING:** _Creating and especially deleting users, along with home directories, can seriously damage your system if, for example, you remove your own user and files by mistake. You may want to practice on another machine which is not your main work machine or on a virtual machine. Regardless of whether you want to play it safe, or not, it is always a good idea to back up your stuff frequently, check the backups have worked correctly, and save yourself a lot of gnashing of teeth later on._

### A New User

You can create a new user with the `useradd` command. Run `useradd` with superuser/root privileges, that is using `sudo` or `su`, depending on your system, you can do:
```
sudo useradd -m guest

```

... and input your password. Or do:
```
su -c "useradd -m guest"

```

... and input the password of root/the superuser.

( _For the sake of brevity, we'll assume from now on that you get superuser/root privileges by using`sudo`_ ).

By including the `-m` argument, `useradd` will create a home directory for the new user. You can see its contents by listing _/home/guest_.

Next you can set up a password for the new user with
```
sudo passwd guest

```

Or you could also use `adduser`, which is interactive and asks you a bunch of questions, including what shell you want to assign the user (yes, there are more than one), where you want their home directory to be, what groups you want them to belong to (more about that in a second) and so on. At the end of running `adduser`, you get to set the password. Note that `adduser` is not installed by default on many distributions, while `useradd` is.

Incidentally, you can get rid of a user with `userdel`:
```
sudo userdel -r guest

```

With the `-r` option, `userdel` not only removes the _guest_ user, but also deletes their home directory and removes their entry in the mailing spool, if they had one.

### Skeletons at Home

Talking of users' home directories, depending on what distro you're on, you may have noticed that when you use the `-m` option, `useradd` populates a user's directory with subdirectories for music, documents, and whatnot as well as an assortment of hidden files. To see everything in you guest's home directory run `sudo ls -la /home/guest`.

What goes into a new user's directory is determined by a skeleton directory which is usually _/etc/skel_. Sometimes it may be a different directory, though. To check which directory is being used, run:
```
useradd -D
GROUP=100
HOME=/home
INACTIVE=-1
EXPIRE=
SHELL=/bin/bash
SKEL=/etc/skel
CREATE_MAIL_SPOOL=no

```

This gives you some extra interesting information, but what you're interested in right now is the `SKEL=/etc/skel` line. In this case, and as is customary, it is pointing to _/etc/skel/_.

As everything is customizable in Linux, you can, of course, change what gets put into a newly created user directory. Try this: Create a new directory in _/etc/skel/_ :
```
sudo mkdir /etc/skel/Documents

```

And create a file containing a welcome text and copy it over:
```
sudo cp welcome.txt /etc/skel/Documents

```

Now delete the guest account:
```
sudo userdel -r guest

```

And create it again:
```
sudo useradd -m guest

```

Hey presto! Your _Documents/_ directory and _welcome.txt_ file magically appear in the guest's home directory.

You can also modify other things when you create a user by editing _/etc/default/useradd_. Mine looks like this:
```
GROUP=users
HOME=/home
INACTIVE=-1
EXPIRE=
SHELL=/bin/bash
SKEL=/etc/skel
CREATE_MAIL_SPOOL=no

```

Most of these options are self-explanatory, but let's take a closer look at the `GROUP` option.

### Herd Mentality

Instead of assigning permissions and privileges to users one by one, Linux and other Unix-like operating systems rely on _groups_. A group is a what you imagine it to be: a bunch of users that are related in some way. On your system you may have a group of users that are allowed to use the printer. They would belong to the _lp_ (for  " _line printer_ ") group. The members of the _wheel_ group were traditionally the only ones who could become superuser/root by using _su_. The _network_ group of users can bring up and power down the network. And so on and so forth.

Different distributions have different groups and groups with the same or similar names have different privileges also depending on the distribution you are using. So don't be surprised if what you read in the prior paragraph doesn't match what is going on in your system.

Either way, to see which groups are on your system you can use:
```
getent group

```

The `getent` command lists the contents of some of the system's databases.

To find out which groups your current user belongs to, try:
```
groups

```

When you create a new user with `useradd`, unless you specify otherwise, the user will only belong to one group: their own. A _guest_ user will belong to a _guest_ group and the group gives the user the power to administer their own stuff and that is about it.

You can create new groups and then add users to them at will with the `groupadd` command:
```
sudo groupadd photos

```

will create the _photos_ group, for example. Next time, we’ll use this to build a shared directory all members of the group can read from and write to, and we'll learn even more about permissions and privileges. Stay tuned!

Learn more about Linux through the free ["Introduction to Linux" ][3]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/7/users-groups-and-other-linux-beasts

作者：[Paul Brown][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/bro66
[1]:https://www.linux.com/blog/learn/2018/5/manipulating-directories-linux
[2]:https://www.linux.com/learn/understanding-linux-file-permissions
[3]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
