### Simple way for unattended bulk user creation in Linux

Contents

*   *   [1. Introduction][4]
    *   [2. Requirements][5]
    *   [3. Conventions][6]
    *   [4. How to proceed][7]
        *   [4.1. Create a file containing the usernames][1]
        *   [4.2. Create users][2]
        *   [4.3. Check user accounts][3]

### Introduction

As a Linux system administrator, you will sometimes have to add new user account to your system. To do so, `adduser` command is often used. When it comes to multiple users' creation, `adduser` command may become boring and time-consuming. This short article intends to provide the Linux system administrator with a simple and unattended way for bulk user creation. The `newusers` command will help you to create multiple users by getting their info from a prefilled file.

### Requirements

Privileged access to your Linux machine

### Conventions

# - requires given command to be executed with root privileges either directly as a root user or by use of `sudo` command
$ - given command to be executed as a regular non-privileged user

### How to proceed

### Create a file containing the usernames

In this initial step, you need to create a file that will contain the list of the usernames that are to be created.
```
$ vi users-list.txt
```
Put in your file, one user info per line, following the pattern below:
```
Username:Password:User ID:Group ID:User Info:Home Directory:Default Shell
Username:Password:User ID:Group ID:User Info:Home Directory:Default Shell
Username:Password:User ID:Group ID:User Info:Home Directory:Default Shell
...
```

### Create users

After having created the previous file with predefined users info, use `newusers`command to create users.
```
# newusers users-list.txt
```

### Check user accounts

Finally you can confirm that the users were created correctly, by looking for their presence in the `/etc/passwd` file:
```
# tail /etc/passwd
```

 ![using newusers for bulk user creation](https://linuxconfig.org/images/newusers-bulk-user-creation.png) 


--------------------------------------------------------------------------------

via: https://linuxconfig.org/simple-way-for-unattended-bulk-user-creation-in-linux

作者：[Essodjolo Kahanam][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org/simple-way-for-unattended-bulk-user-creation-in-linux
[1]:https://linuxconfig.org/simple-way-for-unattended-bulk-user-creation-in-linux#h4-1-create-a-file-containing-the-usernames
[2]:https://linuxconfig.org/simple-way-for-unattended-bulk-user-creation-in-linux#h4-2-create-users
[3]:https://linuxconfig.org/simple-way-for-unattended-bulk-user-creation-in-linux#h4-3-check-user-accounts
[4]:https://linuxconfig.org/simple-way-for-unattended-bulk-user-creation-in-linux#h1-introduction
[5]:https://linuxconfig.org/simple-way-for-unattended-bulk-user-creation-in-linux#h2-requirements
[6]:https://linuxconfig.org/simple-way-for-unattended-bulk-user-creation-in-linux#h3-conventions
[7]:https://linuxconfig.org/simple-way-for-unattended-bulk-user-creation-in-linux#h4-how-to-proceed
