[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Ansible Automation Tool Installation, Configuration and Quick Start Guide)
[#]: via: (https://www.2daygeek.com/install-configure-ansible-automation-tool-linux-quick-start-guide/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Ansible Automation Tool Installation, Configuration and Quick Start Guide
======

There are many automation tools on the market.

I can name a few of them, and they are widely used by many organizations, such as Puppet, Chef, CFEngine, Foreman, Katello, Saltstock, Space Walk.

### What Automation Tool Does?

Automation tools make the life of a Linux administrator much easier by automating routine tasks without human intervention.

These tools allow users to perform configuration management, application deployment and provisioning.

### Why do you like Ansible?

Ansible is an agent-less automation tool that uses SSH to perform all tasks, but others require agents on client nodes.

### What is Ansible?

Ansible is an open source, easy-to-use, powerful IT automation tool that performs tasks on client nodes over SSH.

It is built in Python and is one of the most popular and robust programming languages in the world today’s.

The Python package is required on both ends to perform all the modules.

It can configure systems, deploy software, and schedule advanced IT tasks such as continuous deployment or zero downtime rolling updates.

You can easily perform any kind of automation tasks with simple and complex tasks through Ansible.

Before you get started, you need to understand some of the Ansible terminology that helps you to make a task easier.

### How Ansible Works?

Ansible works by pushing small programs known as ansible modules on the client nodes, and these modules are temporarily stored in the client nodes, which are used to communicate with the Ansible server via a JSON protocol.

Ansible runs these modules via SSH and remove them when finished.

Modules are nothing but scripts written in Python, Perl, etc,.

![][1]

The control node, which controls the entire functionality of the playbook, including client nodes (hosts).

  * **Control node:** The host you use Ansible to execute tasks on managed nodes. You can have multiple control nodes, but you cannot use a Windows machine as a control node.
  * **Managed nodes:** List of hosts configured by the control node
  * **Inventory:** A list of hosts managed by the control nodes, these nodes are configured in the **“/etc/ansible/hosts”** file. It contains information about each node, such as an IP address or its hostname, and these nodes can be grouped as needed.
  * **Modules:** Each module is used to perform a specific task, which currently supports 3387 modules.
  * **ad-hoc:** It allows you to run one task at a time (it uses the **/usr/bin/ansible** binary).
  * **Tasks:** There is a list of tasks in each play. Tasks are executed in order, one at a time in the managed nodes.
  * **Playbooks:** You can perform multiple tasks simultaneously using playbooks, whereas you can only perform one task using an ad-hoc command. Playbooks are written in YAML and are easy to read (which uses the **/usr/bin/ansible-playbook** binary). In the future we will create an article about playbooks that you can use to perform complex tasks.



### Testing Environment:

This environment contains one control node (**server.2g.lab**) and three managed nodes (**node1.2g.lab, node2.2g.lab, node3.2g.lab**), all running in the virtual environment with the following operating systems.

```
+----------------------+---------------+-------------+---------------+
|    System Purpose    |   Hostname    |  IP Address |      OS       |
+----------------------+---------------+-------------+---------------+
|Ansible Control Node  | server.2g.lab | 192.168.1.7 | Manjaro 18    |
|Managed Node1         | node1.2g.lab  | 192.168.1.6 | CentOS7       |
|Managed Node2         | node2.2g.lab  | 192.168.1.5 | CentOS8       |
|Managed Node3         | node3.2g.lab  | 192.168.1.9 | Ubuntu 18.04  |
|User: daygeek                                                       |
+--------------------------------------------------------------------+
```

### Prerequisites:

  * Enable password-less authentication between Ansible control node and managed nodes.
  * The control node must be Python 2 (version 2.7) or Python 3 (versions 3.5 and higher).
  * The managed node must be Python 2 (version 2.6 or later) or Python 3 (version 3.5 or later).
  * If you have SELinux enabled on remote nodes, you will also want to install **libselinux-python** on them before using any copy/file/template related functions in Ansible.



### How to Install the Ansible on Control Node

The Ansible package is available in the distribution official repository, so you can easily install it.

For **“Fedora/RHEL 8/CentOS 8”** system, use the **[DNF Command][2]** to install ansible.

Make a note: You need to enable the **[EPEL repository][3]** on RHEL/CentOS systems because the Ansible package is not available in the distribution official repository.

```
$ sudo dnf install ansible
```

For **“Debian/Ubuntu”** systems, use **[APT-GET Command][4]** or **[APT Command][5]** to install ansible.

Configure the blow PPA to install the latest stable version of ansible on Ubuntu.

```
$ sudo apt update
$ sudo apt install software-properties-common
$ sudo apt-add-repository --yes --update ppa:ansible/ansible
$ sudo apt install ansible
```

For Debian system, configure the blow source list:

```
$ echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" | sudo tee -a /etc/apt/sources.list.d/ansible.list
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
$ sudo apt update
$ sudo apt install ansible
```

For **“Arch Linux”** based systems, use **[Pacman Command][6]** to install ansible.

```
$ sudo pacman -S ansible
```

For **“RHEL/CentOS”** systems, use **[YUM Command][7]** to install ansible.

```
$ sudo yum install ansible
```

For **“openSUSE”** system, use **[Zypper Command][8]** to install ansible.

```
$ sudo zypper install ansible
```

Alternatively, you can install it using the **[PIP Python package manager][9]**

```
$ curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
$ sudo python get-pip.py
$ sudo pip install ansible
```

Check the version of Ansible installed on the control node as follows:

```
$ ansible --version

ansible 2.9.2
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/home/daygeek/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.8/site-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.8.1 (default, Jan  8 2020, 23:09:20) [GCC 9.2.0]
```

### How to Install Python Package on Managed Nodes

Use the following command to install the python package on managed nodes.

```
$ sudo yum install -y python
$ sudo dnf install -y python
$ sudo zypper install -y python
$ sudo pacman -S python
$ sudo apt install -y python
```

### How to Setup SSH key authentication (Password-less Authentication) on Linux

Use the following command to create an ssh key, and then copy them to remote machines.

```
$ ssh-keygen
$ ssh-copy-id [email protected]
$ ssh-copy-id [email protected]
$ ssh-copy-id [email protected]
```

Refer the following article to **[setup SSH key authentication (Password-less Authentication) on Linux][10]**

### How to Create Ansible Inventory

Add the list of nodes you want to manage in the **“/etc/ansible/hosts”** file. If you do not find an existing one you can create a new file. This is a sample inventory file for my test environment.

```
$ sudo vi /etc/ansible/hosts

[web]
node1.2g.lab
node2.2g.lab

[app]
node3.2g.lab
```

Let’s see if we can find all hosts using the following command.

```
$ ansible all --list-hosts

 hosts (3):
   node1.2g.lab
   node2.2g.lab
   node3.2g.lab
```

Run the below command for individual groups.

```
$ ansible web --list-hosts

 hosts (2):
   node1.2g.lab
   node2.2g.lab
```

### How to Perform a Task Using the ad-hoc Command

Once the host inventory validation check is done, you are ready to drive a car. Here you go..!

**Syntax:**

```
ansible [pattern] -m [module] -a "[module options]"

Details:
========
ansible: A command
pattern: Enter the entire inventory or a specific group
-m [module]: Run the given module name
-a [module options]: Specify the module arguments
```

Use the Ping module to ping all nodes in your inventory:

```
$ ansible all -m ping

node3.2g.lab | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
node1.2g.lab | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
node2.2g.lab | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": false,
    "ping": "pong"
}
```

All systems have given a successful result, nothing has changed, and return `pong’ on success.

You can get a list of available modules using the following command.

```
$ ansible-doc -l
```

Currently supports 3387 built-in modules, which will grow with each Ansible release:

```
$ ansible-doc -l | wc -l
3387
```

Use the command module to execute commands against all nodes in your inventory:

```
$ ansible all -m command -a "uptime"

node3.2g.lab | CHANGED | rc=0 >>
 18:05:07 up  1:21,  3 users,  load average: 0.12, 0.06, 0.01
node1.2g.lab | CHANGED | rc=0 >>
 06:35:06 up  1:21,  4 users,  load average: 0.01, 0.03, 0.05
node2.2g.lab | CHANGED | rc=0 >>
 18:05:07 up  1:25,  3 users,  load average: 0.01, 0.01, 0.00
```

Execute the command module for a specific group.

To check the memory usage for the **“app”** group.

```
$ ansible app -m command -a "free -m"

node3.2g.lab | CHANGED | rc=0 >>
              total        used        free      shared  buff/cache   available
Mem:           1993        1065          91           6         836         748
Swap:          1425           0        1424
```

To run the hostnamectl command against the **“web”** group, use the following format.

```
$ ansible web -m command -a "hostnamectl"

node1.2g.lab | CHANGED | rc=0 >>
   Static hostname: CentOS7.2daygeek.com
         Icon name: computer-vm
           Chassis: vm
        Machine ID: 002f47b82af248f5be1d67b67e03514c
           Boot ID: dc38f9b8089d4b2d9304e526e00c6a8f
    Virtualization: kvm
  Operating System: CentOS Linux 7 (Core)
       CPE OS Name: cpe:/o:centos:centos:7
            Kernel: Linux 3.10.0-957.el7.x86_64
      Architecture: x86-64
node2.2g.lab | CHANGED | rc=0 >>
   Static hostname: node2.2g.lab
         Icon name: computer-vm
           Chassis: vm
        Machine ID: e39e3a27005d44d8bcbfcab201480b45
           Boot ID: 27b46a09dde546da95ace03420fe12cb
    Virtualization: oracle
  Operating System: CentOS Linux 8 (Core)
       CPE OS Name: cpe:/o:centos:centos:8
            Kernel: Linux 4.18.0-80.el8.x86_64
      Architecture: x86-64
```

**Reference:** [Ansible Docs][11]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/install-configure-ansible-automation-tool-linux-quick-start-guide/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.2daygeek.com/linux-dnf-command-examples-manage-packages-fedora-centos-rhel-systems/
[3]: https://www.2daygeek.com/install-enable-epel-repository-on-rhel-centos-oracle-linux/
[4]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[6]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[7]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[8]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[9]: https://www.2daygeek.com/install-pip-manage-python-packages-linux/
[10]: https://www.2daygeek.com/configure-setup-passwordless-ssh-key-based-authentication-linux/
[11]: https://docs.ansible.com/ansible/latest/user_guide/index.html
