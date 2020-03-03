[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Ansible Ad-hoc Command Quick Start Guide with Examples)
[#]: via: (https://www.2daygeek.com/ansible-ad-hoc-command-quick-start-guide-with-examples/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Ansible Ad-hoc Command Quick Start Guide with Examples
======

Recently, we have written an article about the **[Ansible installation and configuration][1]**.

Only a few examples of how to use it are included in that tutorial.

If you are new to Ansible, I suggest you read the Installation and Configuration section by pressing the URL above.

Once you’re good in that area, go ahead and play with this article.

By default, Ansible uses only 5 parallel processes. If you want to perform a task on multiple hosts, you need to manually set the value of the fork count by adding **“-f [fork count]”**.

### What is ad-hoc Command

The ad-hoc command is used to automate a task on one or more managed nodes. Ad-hoc commands are very simple, but they are not re-usable. It uses the **“/usr/bin/ansible”** binary to perform all actions.

Ad-hoc commands are best for tasks you run once. For example, if you want to check whether a given user is available or not, you can use the Ansible Quick One liner without writing a playbook.

### Why Would You Like to Know About ad-hoc Commands?

Ad-hoc commands prove the simplicity and power of the Ansible. It currently supports 3389 modules as of version 2.9, so you need to understand and learn the list of Ansible modules you want to use regularly.

If you are new to Ansible, you can easily practice those modules and their arguments with the help of ad-hoc command.

The concepts you learn here will port over directly to the playbook language.

**General Syntax of ad-hoc command:**

```
ansible | [pattern] | -m [module] | -a "[module options]"
   A    |     B     |      C      |            D
```

The ad-hoc command comes with four parts and the details are below.

```
+-----------------+--------------------------------------------------+
|    Details      |                   Description                    |
+-----------------+--------------------------------------------------+
|ansible          | A command                                        |
|pattern          | Input the entire inventory or a specific group   |
|module           | Run the given module name                        |
|module options   | Specify the module arguments                     |
+-----------------+--------------------------------------------------+
```

### How To Use Ansible Inventory File

If you use the default inventory file of Ansible **“/etc/ansible/hosts”**, you can call it directly.

If not, the entire path of the Ansible Inventory file should be called with the **“-i”** option.

### What’s Pattern and How to Use it?

An Ansible pattern can refer to a single host, IP address, an inventory group, a set of groups, or all hosts in your inventory.

It allows you to run commands and playbooks against them. Patterns are very flexible and you can use them according to your needs.

For example, you can exclude hosts, use wildcards or regular expressions, and more.

The table below describes common patterns and their use. But if it doesn’t meet your needs, you can use variables in patterns with the **“-e”** argument in the ansible-playbook.

```
+-----------------------+------------------------------+-----------------------------------------------------+
|    Description        |          Pattern(s)          |                          Targets                    |
+-----------------------+------------------------------+-----------------------------------------------------+
|All hosts              | all (or *)                   | Run an Ansible against all servers in your inventory|
|One host               | host1                        | Run an Ansible against only the given host.         |
|Multiple hosts         | host1:host2 (or host1,host2) | Run an Ansible against the mentioned multiple hosts |
|One group              | webservers                   | Run an Ansible against the webservers group         |
|Multiple groups        | webservers:dbservers         | all hosts in webservers plus all hosts in dbservers |
|Excluding groups       | webservers:!atlanta          | all hosts in webservers except those in atlanta     |
|Intersection of groups | webservers:&staging          | any hosts in webservers that are also in staging    |
+-----------------------+------------------------------+-----------------------------------------------------+
```

### What is Ansible Modules and What it Does?

Modules (also referred to as “task plugins” or “library plugins”) are units of code that can be used to perform a specific task directly on remote hosts or through Playbooks.

Ansible executes the given module on the remote target node and collects the return values.

Each module supports multiple arguments, allowing it to meet the user’s needs. Almost all modules take **“key=value”** arguments except few.

You can add multiple arguments with the space at once, and the command/shell modules directly take the string of the command you want to run.

We will add a table with the most frequently used **“module options”** arguments.

To list all available modules, run the command below.

```
$ ansible-doc -l
```

Run the command below to read the documentation for the given module

```
$ ansible-doc [Module]
```

### 1) How to List the Contents of a Directory Using Ansible on Linux

This can be done using the Ansible command module as follows. We have listed the contents of the **“daygeek”** user’s home directory on the **“node1.2g.lab”** and **“node2.2g.lab”** remote server.

```
$ ansible web -m command -a "ls -lh /home/daygeek"

node1.2g.lab | CHANGED | rc=0 >>
total 12K
drwxr-xr-x. 2 daygeek daygeek   6 Feb 15  2019 Desktop
drwxr-xr-x. 2 daygeek daygeek   6 Feb 15  2019 Documents
drwxr-xr-x. 2 daygeek daygeek   6 Feb 15  2019 Downloads
drwxr-xr-x. 2 daygeek daygeek   6 Feb 15  2019 Music
-rwxr-xr-x. 1 daygeek daygeek 159 Mar  4  2019 passwd-up.sh
drwxr-xr-x. 2 daygeek daygeek   6 Feb 15  2019 Pictures
drwxr-xr-x. 2 daygeek daygeek   6 Feb 15  2019 Public
drwxr-xr-x. 2 daygeek daygeek   6 Feb 15  2019 Templates
-rwxrwxr-x. 1 daygeek daygeek 138 Mar 10  2019 user-add.sh
-rw-rw-r--. 1 daygeek daygeek  18 Mar 10  2019 user-list1.txt
drwxr-xr-x. 2 daygeek daygeek   6 Feb 15  2019 Videos

node2.2g.lab | CHANGED | rc=0 >>
total 0
drwxr-xr-x. 2 daygeek daygeek 6 Nov  9 09:55 Desktop
drwxr-xr-x. 2 daygeek daygeek 6 Nov  9 09:55 Documents
drwxr-xr-x. 2 daygeek daygeek 6 Nov  9 09:55 Downloads
drwxr-xr-x. 2 daygeek daygeek 6 Nov  9 09:55 Music
drwxr-xr-x. 2 daygeek daygeek 6 Nov  9 09:55 Pictures
drwxr-xr-x. 2 daygeek daygeek 6 Nov  9 09:55 Public
drwxr-xr-x. 2 daygeek daygeek 6 Nov  9 09:55 Templates
drwxr-xr-x. 2 daygeek daygeek 6 Nov  9 09:55 Videos
```

### 2) How to Manage Files Using Ansible on Linux

Ansible “copy module” copies a file from a local system to a remote system. Use the Ansible command module to move or copy files to a remote machine.

```
$ ansible web -m copy -a "src=/home/daygeek/backup/CentOS7.2daygeek.com-20191025.tar dest=/home/u1" --become

node1.2g.lab | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "checksum": "ad8aadc0542028676b5fe34c94347829f0485a8c",
    "dest": "/home/u1/CentOS7.2daygeek.com-20191025.tar",
    "gid": 0,
    "group": "root",
    "md5sum": "ee8e778646e00456a4cedd5fd6458cf5",
    "mode": "0644",
    "owner": "root",
    "secontext": "unconfined_u:object_r:user_home_t:s0",
    "size": 30720,
    "src": "/home/daygeek/.ansible/tmp/ansible-tmp-1579726582.474042-118186643704900/source",
    "state": "file",
    "uid": 0
}

node2.2g.lab | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": true,
    "checksum": "ad8aadc0542028676b5fe34c94347829f0485a8c",
    "dest": "/home/u1/CentOS7.2daygeek.com-20191025.tar",
    "gid": 0,
    "group": "root",
    "md5sum": "ee8e778646e00456a4cedd5fd6458cf5",
    "mode": "0644",
    "owner": "root",
    "secontext": "unconfined_u:object_r:user_home_t:s0",
    "size": 30720,
    "src": "/home/daygeek/.ansible/tmp/ansible-tmp-1579726582.4793239-237229399335623/source",
    "state": "file",
    "uid": 0
}
```

We can verify it by running the command below.

```
$ ansible web -m command -a "ls -lh /home/u1" --become

node1.2g.lab | CHANGED | rc=0 >>
total 36K
-rw-r--r--. 1 root root 30K Jan 22 14:56 CentOS7.2daygeek.com-20191025.tar
-rw-r--r--. 1 root root  25 Dec  9 03:31 user-add.sh

node2.2g.lab | CHANGED | rc=0 >>
total 36K
-rw-r--r--. 1 root root 30K Jan 23 02:26 CentOS7.2daygeek.com-20191025.tar
-rw-rw-r--. 1 u1   u1    18 Jan 23 02:21 magi.txt
```

To copy a file from one location to another on the remote machine, use the following command.

```
$ ansible web -m command -a "cp /home/u2/magi/ansible-1.txt /home/u2/magi/2g" --become
```

To move a file, use the following command.

```
$ ansible web -m command -a "mv /home/u2/magi/ansible.txt /home/u2/magi/2g" --become
```

To create a new file named **“ansible.txt”** under **“u1”** user, run the following command.

```
$ ansible web -m file -a "dest=/home/u1/ansible.txt owner=u1 group=u1 state=touch" --become
```

To create a new directory named **“magi”** under the **“u1”** user, run the following command. **_“**The file module can also create directories as follows**_“**.

```
$ ansible web -m file -a "dest=/home/u1/magi mode=755 owner=u2 group=u2 state=directory" --become
```

To change the permission of the **“ansible.txt”** file to **“777”** under **“u1”** user, run the following command.

```
$ ansible web -m file -a "dest=/home/u1/ansible.txt mode=777" --become
```

To delete the “ansible.txt” file under “u1” user, run the following command.

```
$ ansible web -m file -a "dest=/home/u2/magi/ansible-1.txt state=absent" --become
```

Use the following command to delete a directory and it will delete the given directory recursively.

```
$ ansible web -m file -a "dest=/home/u2/magi/2g state=absent" --become
```

### 3) User Management

You can easily perform the user management activity through Ansible, such as user creation, deleting a user, and adding a user to the group.

```
$ ansible all -m user -a "name=foo password=[crypted password here]"
```

To remove a user, run the following command.

```
$ ansible all -m user -a "name=foo state=absent"
```

### 4) Managing Package

Package installation can be easily managed using the appropriate Ansible Package Manager module. For example, we are going to use the yum module to manage packages on the CentOS system.

To install the latest Apache (httpd) package.

```
$ ansible web -m yum -a "name=httpd state=latest"
```

To uninstall the Apache (httpd) package.

```
$ ansible web -m yum -a "name=httpd state=absent"
```

### 5) Managing Service

Use the following Ansible module command to manage any service on Linux using Ansible

To stop the httpd service

```
$ ansible web -m service -a "name=httpd state=stopped"
```

To start the httpd service

```
$ ansible web -m service -a "name=httpd state=started"
```

To restart the httpd service

```
$ ansible web -m service -a "name=httpd state=restarted"
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/ansible-ad-hoc-command-quick-start-guide-with-examples/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/install-configure-ansible-automation-tool-linux-quick-start-guide/
