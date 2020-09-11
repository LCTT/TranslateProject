[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Download and Use Ansible Galaxy Roles in Ansible Playbook)
[#]: via: (https://www.linuxtechi.com/use-ansible-galaxy-roles-ansible-playbook/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

How to Download and Use Ansible Galaxy Roles in Ansible Playbook
======

**Ansible** is tool of choice these days if you must manage multiple devices, be it Linux, Windows, Mac, Network Devices, VMware and lot more. What makes Ansible popular is its agent less feature and granular control. If you have worked with python or have experience with **yaml** , you will feel at home with Ansible. To see how you can install [Ansible][1] click here.

<https://www.linuxtechi.com/wp-content/uploads/2019/05/Download-Use-Ansible-Galaxy-Roles.jpg>

Ansible core modules will let you manage almost anything should you wish to write playbooks, however often there is someone who has already written a role for a problem you are trying to solve. Let’s take an example, you wish to manage NTP clients on the Linux machines, you have 2 choices either write a role which can be applied to the nodes or use **ansible-galaxy** to download an existing role someone has already written/tested for you. Ansible galaxy has roles for almost all the domains and these caters different problems. You can visit <https://galaxy.ansible.com/> to get an idea on domains and popular roles it has. Each role published on galaxy repository is thoroughly tested and has been rated by the users, so you get an idea on how other people who have used it liked it.

To keep moving with the NTP idea, here is how you can search and install an NTP role from galaxy.

Firstly, lets run ansible-galaxy with the help flag to check what options does it give us

```
[root@linuxtechi ~]# ansible-galaxy --help
```

![ansible-galaxy-help][2]

As you can see from the output above there are some interesting options been shown, since we are looking for a role to manage ntp clients lets try the search option to see how good it is finding what we are looking for.

```
[root@linuxtechi ~]# ansible-galaxy search ntp
```

Here is the truncated output of the command above.

![ansible-galaxy-search][3]

It found 341 matches based on our search, as you can see from the output above many of these roles are not even related to NTP which means our search needs some refinement however, it has managed to pull some NTP roles, lets dig deeper to see what these roles are. But before that let me tell you the naming convention being followed here. The name of a role is always preceded by the author name so that it is easy to segregate roles with the same name. So, if you have written an NTP role and have published it to galaxy repo, it does not get mixed up with someone else repo with the same name.

With that out of the way, lets continue with our job of installing a NTP role for our Linux machines. Let’s try **bennojoy.ntp** for this example, but before using this we need to figure out couple of things, is this role compatible with the version of ansible I am running. Also, what is the license status of this role. To figure out these, let’s run below ansible-galaxy command,

```
[root@linuxtechi ~]# ansible-galaxy info bennojoy.ntp
```

![ansible-galaxy-info][4]

ok so this says the minimum version is 1.4 and the license is BSD, lets download it

```
[root@linuxtechi ~]# ansible-galaxy install bennojoy.ntp
- downloading role 'ntp', owned by bennojoy
- downloading role from https://github.com/bennojoy/ntp/archive/master.tar.gz
- extracting bennojoy.ntp to /etc/ansible/roles/bennojoy.ntp
- bennojoy.ntp (master) was installed successfully
[root@linuxtechi ~]# ansible-galaxy list
- bennojoy.ntp, master
[root@linuxtechi ~]#
```

Let’s find the newly installed role.

```
[root@linuxtechi ~]# cd /etc/ansible/roles/bennojoy.ntp/
[root@linuxtechi bennojoy.ntp]# ls -l
total 4
drwxr-xr-x. 2 root root   21 May 21 22:38 defaults
drwxr-xr-x. 2 root root   21 May 21 22:38 handlers
drwxr-xr-x. 2 root root   48 May 21 22:38 meta
-rw-rw-r--. 1 root root 1328 Apr 20  2016 README.md
drwxr-xr-x. 2 root root   21 May 21 22:38 tasks
drwxr-xr-x. 2 root root   24 May 21 22:38 templates
drwxr-xr-x. 2 root root   55 May 21 22:38 vars
[root@linuxtechi bennojoy.ntp]#
```

I am going to run this newly downloaded role on my Elasticsearch CentOS node. Here is my hosts file

```
[root@linuxtechi ~]# cat hosts
[CentOS]
elastic7-01 ansible_host=192.168.1.15 ansibel_port=22 ansible_user=linuxtechi
[root@linuxtechi ~]#
```

Let’s try to ping the node using below ansible ping module,

```
[root@linuxtechi ~]# ansible -m ping -i hosts elastic7-01
elastic7-01 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
[root@linuxtechi ~]#
```

Here is what the current ntp.conf looks like on elastic node.

```
[root@linuxtechi ~]# head -30 /etc/ntp.conf
```

![Current-ntp-conf][5]

Since I am in India, lets add server **in.pool.ntp.org** to ntp.conf. I would have to edit the variables in default directory of the role.

```
[root@linuxtechi ~]# vi /etc/ansible/roles/bennojoy.ntp/defaults/main.yml
```

Change NTP server address in “ntp_server” parameter, after updating it should look like below.

![Update-ansible-ntp-role][6]

The last thing now is to create my playbook which would call this role.

```
[root@linuxtechi ~]# vi ntpsite.yaml
---
 - name: Configure NTP on CentOS/RHEL/Debian System
   become: true
   hosts: all
   roles:
    - {role: bennojoy.ntp}
```

save and exit the file

We are ready to run this role now, use below command to run ntp playbook,

```
[root@linuxtechi ~]# ansible-playbook -i hosts ntpsite.yaml
```

Output of above ntp ansible playbook should be something like below,

![ansible-playbook-output][7]

Let’s check updated file now. go to elastic node and view the contents of ntp.conf file

```
[root@linuxtechi ~]# cat /etc/ntp.conf
#Ansible managed

driftfile /var/lib/ntp/drift
server in.pool.ntp.org

restrict -4 default kod notrap nomodify nopeer noquery
restrict -6 default kod notrap nomodify nopeer noquery
restrict 127.0.0.1
[root@linuxtechi ~]#
```

Just in case you do not find a role fulfilling your requirement ansible-galaxy can help you create a directory structure for your custom roles. This helps your playbooks along with the variables, handlers, templates etc assembled in a standardized file structure. Let’s create our own role, its always a good practice to let ansible-galaxy create the structure for you.

```
[root@linuxtechi ~]# ansible-galaxy init pk.backup
- pk.backup was created successfully
[root@linuxtechi ~]#
```

Verify the structure of your role using the tree command,

![createing-roles-ansible-galaxy][8]

Let me quickly explain what each of these directories and files are for, each of these serves a purpose.

The very first one is the **defaults** directory which contains the files containing variables with takes the lowest precedence, if the same variables are assigned in var directory it will be take precedence over default. The **handlers** directory hosts the handlers. The **file** and **templates** keep any files your role may need to copy and **jinja templates** to be used in playbooks respectively. The **tasks** directory is where your playbooks containing the tasks are kept. The var directory consists of all the files that hosts the variables used in role. The test directory consists of a sample inventory and test playbooks which can be used to test the role. The **meta directory** consists of any dependencies on other roles along with the authorship information.

Finally, **README.md** file simply consists of some general information like description and minimum version of ansible this role is compatible with.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/use-ansible-galaxy-roles-ansible-playbook/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/install-and-use-ansible-in-centos-7/
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/05/ansible-galaxy-help-1024x294.jpg
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/05/ansible-galaxy-search-1024x552.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/05/ansible-galaxy-info-1024x557.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Current-ntp-conf.jpg
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Update-ansible-ntp-role.jpg
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/05/ansible-playbook-output-1024x376.jpg
[8]: https://www.linuxtechi.com/wp-content/uploads/2019/05/createing-roles-ansible-galaxy.jpg
