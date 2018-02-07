Create your first Ansible server (automation) setup
======
Automation/configuration management tools are the new craze in the IT world, organizations are moving towards adopting them. There are many tools that are available in market like Puppet, Chef, Ansible etc & in this tutorial, we are going to learn about Ansible.

Ansible is an open source configuration tool; that is used to deploy, configure & manage servers. Ansible is one of the easiest automation tool to learn and master. It does not require you to learn complicated programming language like ruby (used in puppet & chef) & uses YAML, which is a very simple language. Also it does not require any special agent to be installed on client machines & only requires client machines to have python and ssh installed, both of these are usually available on systems.

## Pre-requisites

Before we move onto installation part, let's discuss the pre-requisites for Ansible

  1. For server, we will need a machine with either CentOS or RHEL 7 installed & EPEL repository enabled

To enable epel repository, use the commands below,

 **RHEL/CentOS 7**

```
 $ rpm -Uvh https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-10.noarch.rpm
```

 **RHEL/CentOS 6 (64 Bit)**

```
 $ rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
```

 **RHEL/CentOS 6 (32 Bit)**

```
 $ rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
```

  2. For client machines, Open SSH & python should be installed. Also we need to configure password less login for ssh session (create public-private keys). To create public-private keys & configure password less login for ssh session, refer to our article "

[Setting up SSH Server for Public/Private keys based Authentication (Password-less login)][1]"



##  Installation

Once we have epel repository enabled, we can now install anisble using yum,

```
 $ yum install ansible
```

##  Configuring Ansible hosts

We will now configure hosts that we want Ansible to manage. To do that we need to edit the file **/etc/ansible/host** s & add the clients in following syntax,

```
[group-name]
alias ansible_ssh_host=host_IP_address
```

where, alias is the alias name given to hosts we adding & it can be anything,

host_IP_address is where we enter the IP address for the hosts.

For this tutorial, we are going to add 2 clients/hosts for ansible to manage, so let's create an entry for these two hosts in the configuration file,

```
 $ vi /etc/ansible/hosts
 [test_clients]
 client1 ansible_ssh_host=192.168.1.101
 client2 ansible_ssh_host=192.168.1.10
```

Save file & exit it. Now as mentioned in pre-requisites, we should have a password less login to these clients from the ansible server. To check if that's the case, ssh into the clients and we should be able to login without password,

```
 $ ssh root@192.168.1.101
```

If that's working, then we can move further otherwise we need to create Public/Private keys for ssh session (Refer to article mentioned above in pre-requisites).

We are using root to login to other servers but we can use other local users as well & we need to define it for Ansible whatever user we will be using. To do so, we will first create a folder named 'group_vars' in '/etc/ansible'

```
 $ cd /etc/ansible
 $ mkdir group_vars
```

Next, we will create a file named after the group we have created in 'etc/ansible/hosts' i.e. test_clients

```
 $ vi test_clients
```

& add the ifollowing information about the user,

```
 --
 ansible_ssh_user:root
```

 **Note :-** File will start with  '--' (minus symbol), so keep not of that.

If we want to use same user for all the groups created, then we can create only a single file named 'all' to mention the user details for ssh login, instead of creating a file for every group.

```
 $ vi /etc/ansible/group_vars/all
 --
 ansible_ssh_user: root
```

Similarly, we can setup files for individual hosts as well.

Now, the setup for the clients has been done. We will now push some simple commands to all the clients being managed by Ansible.

##  Testing hosts

To check the connectivity of all the hosts, we will issue a command,

```
 $ ansible -m ping all
```

If all the hosts are properly connected, it should return the following output,

```
 client1 | SUCCESS = > {
 " changed": false,
 " ping": "pong"
 }
 client2 | SUCCESS = > {
 " changed": false,
 " ping": "pong"
 }
```

We can also issue command to an individual host,

```
 $ ansible -m ping client1
```

or to the multiple hosts,

```
 $ ansible -m ping client1:client2
```

or even to a single group,

```
 $ ansible -m ping test_client
```

This complete our tutorial on setting up an Ansible server, in our future posts we will further explore funtinalities offered by Ansible. If any having doubts or queries regarding this post, use the comment box below.


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/create-first-ansible-server-automation-setup/

作者：[SHUSAIN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/configure-ssh-server-publicprivate-key/
