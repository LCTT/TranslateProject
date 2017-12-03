How to Manage Users with Groups in Linux
============================================================

### [group-of-people-1645356_1920.jpg][1]

![groups](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/group-of-people-1645356_1920.jpg?itok=rJlAxBSV)

Learn how to work with users, via groups and access control lists in this tutorial.

[Creative Commons Zero][4]

Pixabay

When you administer a Linux machine that houses multiple users, there might be times when you need to take more control over those users than the basic user tools offer. This idea comes to the fore especially when you need to manage permissions for certain users. Say, for example, you have a directory that needs to be accessed with read/write permissions by one group of users and only read permissions for another group. With Linux, this is entirely possible. To make this happen, however, you must first understand how to work with users, via groups and access control lists (ACLs).

We’ll start from the beginning with users and work our way to the more complex ACLs. Everything you need to make this happen will be included in your Linux distribution of choice. We won’t touch on the basics of users, as the focus on this article is about groups.

For the purpose of this piece, I’m going to assume the following:

You need to create two users with usernames:

*   olivia

*   nathan

You need to create two groups:

*   readers

*   editors

Olivia needs to be a member of the group editors, while nathan needs to be a member of the group readers. The group readers needs to only have read permission to the directory /DATA, whereas the group editors needs to have both read and write permission to the /DATA directory. This, of course, is very minimal, but it will give you the basic information you need to expand the tasks to fit your much larger needs.

I’ll be demonstrating on the Ubuntu 16.04 Server platform. The commands will be universal—the only difference would be if your distribution of choice doesn’t make use of sudo. If this is the case, you’ll have to first su to the root user to issue the commands that require sudo in the demonstrations.

### Creating the users

The first thing we need to do is create the two users for our experiment. User creation is handled with the useradd command. Instead of just simply creating the users we need to create them both with their own home directories and then give them passwords.

The first thing we do is create the users. To do this, issue the commands:

```
sudo useradd -m olivia

sudo useradd -m nathan
```

Next each user must have a password. To add passwords into the mix, you’d issue the following commands:

```
sudo passwd olivia

sudo passwd nathan
```

That’s it, your users are created.

### Creating groups and adding users

Now we’re going to create the groups readers and editors and then add users to them. The commands to create our groups are:

```
addgroup readers

addgroup editors
```

### [groups_1.jpg][2]

![groups](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/groups_1.jpg?itok=BKwL89BB)

Figure 1: Our new groups ready to be used.

[Used with permission][5]

With our groups created, we need to add our users. We’ll add user nathan to group readers with the command:

```
sudo usermod -a -G readers nathan
```

```
sudo usermod -a -G editors olivia
```

### Giving groups permissions to directories

Let’s say you have the directory /READERS and you need to allow all members of the readers group access to that directory. First, change the group of the folder with the command:

```
sudo chown -R :readers /READERS 
```

```
sudo chmod -R g-w /READERS
```

```
sudo chmod -R o-x /READERS
```

Let’s say you have the directory /EDITORS and you need to give members of the editors group read and write permission to its contents. To do that, the following command would be necessary:

```
sudo chown -R :editors /EDITORS

sudo chmod -R g+w /EDITORS

sudo chmod -R o-x /EDITORS
```

The problem with using this method is you can only add one group to a directory at a time. This is where access control lists come in handy.

### Using access control lists

Now, let’s get tricky. Say you have a single folder—/DATA—and you want to give members of the readers group read permission and members of the group editors read/write permissions. To do that, you must take advantage of the setfacl command. The setfacl command sets file access control lists for files and folders.

The structure of this command looks like this:

```
setfacl OPTION X:NAME:Y /DIRECTORY
```

```
sudo setfacl -m g:readers:rx -R /DATA
```

To give members of the editors group read/write permissions (while retaining read permissions for the readers group), we’d issue the command;

```
sudo setfacl -m g:editors:rwx -R /DATA 
```

### All the control you need

And there you have it. You can now add members to groups and control those groups’ access to various directories with all the power and flexibility you need. To read more about the above tools, issue the commands:

*   man usradd

*   man addgroup

*   man usermod

*   man sefacl

*   man chown

*   man chmod

Learn more about Linux through the free ["Introduction to Linux" ][3]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/12/how-manage-users-groups-linux

作者：[Jack Wallen ]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://www.linux.com/files/images/group-people-16453561920jpg
[2]:https://www.linux.com/files/images/groups1jpg
[3]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[4]:https://www.linux.com/licenses/category/creative-commons-zero
[5]:https://www.linux.com/licenses/category/used-permission
