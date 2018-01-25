translating---geekpi

Ansible Tutorial: Intorduction to simple Ansible commands
======
In our earlier Ansible tutorial, we discussed [**the installation & configuration of Ansible**][1]. Now in this ansible tutorial, we will learn some basic examples of ansible commands that we will use to manage our infrastructure. So let us start by looking at the syntax of a complete ansible command,

```
$ ansible <group> -m <module> -a <arguments>
```

Here, we can also use a single host or all in place of <group> & <arguments> are optional to provide. Now let's look at some basic commands to use with ansible,

### Check connectivity of hosts

We have used this command in our previous tutorial also. The command to check connectivity of hosts is

```
$ ansible <group> -m ping
```

### Rebooting hosts

```
$ ansible <group> -a "/sbin/reboot"
```

### Checking host 's system information

Ansible collects the system's information for all the hosts connected to it. To display the information of hosts, run

```
$ ansible <group> -m setup | less
```

Secondly, to check a particular info from the collected information by passing an argument,

```
$ ansible <group> -m setup -a "filter=ansible_distribution"
```

### Transfering files

For transferring files we use a module 'copy' & complete command that is used is

```
$ ansible <group> -m copy -a "src=/home/dan dest=/tmp/home"
```

### Manging users

So to manage the users on the connected hosts, we use a module named 'user' & comamnds to use it are as follows,

#### Creating a new user

```
 $ ansible <group> -m user -a "name=testuser password=<encrypted password>"
```

#### Deleting a user

```
$ ansible <group> -m user -a "name=testuser state=absent"
```

 **Note:-** To create an encrypted password, use the 'mkpasswd -method=sha-512' command.

### Changing permissions & ownership

So for changing ownership of files of connected hosts, we use module named 'file' & commands used are

### Changing permission of a file

```
$ ansible <group> -m file -a "dest=/home/dan/file1.txt mode=777"
```

### Changing ownership of a file

```
 $ ansible <group> -m file -a "dest=/home/dan/file1.txt mode=777 owner=dan group=dan"
```

### Managing Packages

So, we can manage the packages installed on all the hosts connected to ansible by using 'yum' & 'apt' modules & the complete commands used are

#### Check if package is installed & update it

```
$ ansible <group> -m yum -a "name=ntp state=latest"
```

#### Check if package is installed & don't update it

```
$ ansible <group> -m yum -a "name=ntp state=present"
```

#### Check if package is at a specific version

```
$ ansible <group> -m yum -a "name= ntp-1.8 state=present"
```

#### Check if package is not installed

```
$ ansible <group> -m yum -a "name=ntp state=absent"
```

### Managing services

So to manage services with ansible, we use a modules 'service' & complete commands that are used are,

#### Starting a service

```
$ansible <group> -m service -a "name=httpd state=started"
```

#### Stopping a service

```
$ ansible <group> -m service -a "name=httpd state=stopped"
```

#### Restarting a service

```
$ ansible <group> -m service -a "name=httpd state=restarted"
```

So this completes our tutorial of some simple, one line commands that can be used with ansible. Also, for our future tutorials, we will learn to create plays & playbooks that help us manage our hosts more easliy & efficiently.

If you think we have helped you or just want to support us, please consider these :-

Connect to us: [Facebook][2] | [Twitter][3] | [Google Plus][4]

Become a Supporter - [Make a contribution via PayPal][5]

Linux TechLab is thankful for your continued support.

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/ansible-tutorial-simple-commands/

作者：[SHUSAIN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/create-first-ansible-server-automation-setup/
[2]:https://www.facebook.com/linuxtechlab/
[3]:https://twitter.com/LinuxTechLab
[4]:https://plus.google.com/+linuxtechlab
[5]:http://linuxtechlab.com/contact-us-2/
