NearTan 认领

Fabric – Automate Your Linux Administration Tasks and Application Deployments Over SSH
===========================

When it comes to managing remote machines and deployment of applications, there are several command line tools out there in existence though many have a common problem of lack of detailed documentation.

In this guide, we shall cover the steps to introduce and get started on how to use fabric to improve on administering groups of servers.

![](http://www.tecmint.com/wp-content/uploads/2015/11/Automate-Linux-Administration-Tasks-Using-Fabric.png)
>Automate Linux Administration Tasks Using Fabric

Fabric is a python library and a powerful command line tool for performing system administration tasks such as executing SSH commands on multiple machines and application deployment.

Having a working knowledge of Python can be helpful when using Fabric, but may certainly not be necessary.

Reasons why you should choose fabric over other alternatives:

- Simplicity
- It is well-documented
- You don’t need to learn another language if you’re already a python guy.
- Easy to install and use.
- It is fast in its operations.
- It supports parallel remote execution.

### How to Install Fabric Automation Tool in Linux

An important characteristic about fabric is that the remote machines which you need to administer only need to have the standard OpenSSH server installed. You only need certain requirements installed on the server from which you are administering the remote servers before you can get started.

#### Requirements:

- Python 2.5+ with the development headers
- Python-setuptools and pip (optional, but preferred) gcc

Fabric is easily installed using pip (highly recommended), but you may also prefer to choose your default package manager `yum`, `dnf` or `apt-get` to install fabric package, typically called fabric or python-fabric.

For RHEL/CentOS based distributions, you must have [EPEL repository][1] installed and enabled on the system to install fabric package.

```
# yum install fabric   [On RedHat based systems]  
# dnf install fabric   [On Fedora 22+ versions]
```

For Debian and it’s derivatives such as Ubuntu and Mint users can simply do apt-get to install the fabric package as shown:

```
# apt-get install fabric
```

If you want to install development version of fabric, you may use pip to grab the most recent master branch.

```
# yum install python-pip       [On RedHat based systems] 
# dnf install python-pip       [On Fedora 22+ versions]
# apt-get install python-pip   [On Debian based systems]
```

Once pip has been installed successfully, you may use pip to grab the latest version of fabric as shown:

```
# pip install fabric
```

### How to Use Fabric to Automate Linux Administration Tasks

So lets get started on how you can use Fabric. During the installation process, a Python script called fab was added to a directory in your path. The `fab` script does all the work when using fabric.

#### Executing commands on the local Linux machine

By convention, you need to start by creating a Python file called fabfile.py using your favorite editor. Remember you can give this file a different name as you wish but you will need to specify the file path as follows:

```
# fabric --fabfile /path/to/the/file.py
```

Fabric uses `fabfile.py` to execute tasks. The fabfile should be in the same directory where you run the Fabric tool.

Example 1: Let’s create a basic `Hello World` first.

```
# vi fabfile.py
```

Add these lines of code in the file.

```
def hello():
print('Hello world, Tecmint community')
```

Save the file and run the command below.

```
# fab hello
```

![](http://www.tecmint.com/wp-content/uploads/2015/11/Create-Fabric-Fab-Python-File.gif)
>Fabric Tool Usage

And paste the following lines of code in the file.

```
#!  /usr/bin/env python
from fabric.api import local
def uptime():
local('uptime')
```

Then save the file and run the following command:

```
# fab uptime
```

![](http://www.tecmint.com/wp-content/uploads/2015/11/Fabric-Uptime.gif)
>Fabric: Check System Uptime

#### Executing commands on remote Linux machines to automate tasks

The Fabric API uses a configuration dictionary which is Python’s equivalent of an associative array known as `env`, which stores values that control what Fabric does.

The `env.hosts` is a list of servers on which you want run Fabric tasks. If your network is 192.168.0.0 and wish to manage host 192.168.0.2 and 192.168.0.6 with your fabfile, you could configure the env.hosts as follows:

```
#!/usr/bin/env python
from  fabric.api import env
env.hosts = [ '192.168.0.2', '192.168.0.6' ]
```

The above line of code only specify the hosts on which you will run Fabric tasks but do nothing more. Therefore you can define some tasks, Fabric provides a set of functions which you can use to interact with your remote machines.

Although there are many functions, the most commonly used are:

- run – which runs a shell command on a remote machine.
- local – which runs command on the local machine.
- sudo – which runs a shell command on a remote machine, with root privileges.
- Get – which downloads one or more files from a remote machine.
- Put – which uploads one or more files to a remote machine.

Example 3: To echo a message on multiple machines create a fabfile.py such as the one below.

```
#!/usr/bin/env python
from fabric.api import env, run
env.hosts = ['192.168.0.2','192.168.0.6']
def echo():
run("echo -n 'Hello, you are tuned to Tecmint ' ")
```

To execute the tasks, run the following command:

```
# fab echo
```

![](http://www.tecmint.com/wp-content/uploads/2015/11/Fabrick-Automate-Linux-Tasks.gif)
>Fabric: Automate Linux Tasks on Remote Linux

Example 4: You can improve the fabfile.py which you created earlier on to execute the uptime command on the local machine, so that it runs the uptime command and also checks disk usage using the df command on multiple machines as follows:

```
#!/usr/bin/env python
from fabric.api import env, run
env.hosts = ['192.168.0.2','192.168.0.6']
def uptime():
run('uptime')
def disk_space():
run('df -h')
```

Save the file and run the following command:

```
# fab uptime
# fab disk_space
```

![](http://www.tecmint.com/wp-content/uploads/2015/11/Fabric-Run-Multiple-Commands-on-Multiple-Linux-Systems.gif)
>Fabric: Automate Tasks on Multiple Linux Systems

#### Automatically Deploy LAMP Stack on Remote Linux Server

Example 4: Let us look at an example to deploy LAMP (Linux, Apache, MySQL/MariaDB and PHP) server on a remote Linux server.

We shall write a function that will allow LAMP to be installed remotely using root privileges.

##### For RHEL/CentOS and Fedora

```
#!/usr/bin/env python
from fabric.api import env, run
env.hosts = ['192.168.0.2','192.168.0.6']
def deploy_lamp():
run ("yum install -y httpd mariadb-server php php-mysql")
```

##### For Debian/Ubuntu and Linux Mint

```
#!/usr/bin/env python
from fabric.api import env, run
env.hosts = ['192.168.0.2','192.168.0.6']
def deploy_lamp():
sudo("apt-get install -q apache2 mysql-server libapache2-mod-php5 php5-mysql")
```

Save the file and run the following command:

```
# fab deploy_lamp
```

Note: Due to large output, it’s not possible for us to create a screencast (animated gif) for this example.

Now you can able to [automate Linux server management tasks][2] using Fabric and its features and examples given above…

#### Some Useful Options to Use with Fabric

- You can run fab –help to view help information and a long list of available command line options.
- An important option is –fabfile=PATH that helps you to specify a different python module file to import other then fabfile.py.
- To specify a username to use when connecting to remote hosts, use the –user=USER option.
- To use password for authentication and/or sudo, use the –password=PASSWORD option.
- To print detailed info about command NAME, use –display=NAME option.
- To view formats use –list option, choices: short, normal, nested, use the –list-format=FORMAT option.
- To print list of possible commands and exit, include the –list option.
- You can specify the location of config file to use by using the –config=PATH option.
- To display a colored error output, use –colorize-errors.
- To view the program’s version number and exit, use the –version option.

### Summary

Fabric is a powerful tool and is well documented and provides easy usage for newbies. You can read the full documentation to get more understanding of it. If you have any information to add or incase of any errors you encounter during installation and usage, you can leave a comment and we shall find ways to fix them.

Reference: [Fabric documentation][3]


--------------------------------------------------------------------------------

via: http://www.tecmint.com/automating-linux-system-administration-tasks/

作者：[Aaron Kili ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: http://www.tecmint.com/how-to-enable-epel-repository-for-rhel-centos-6-5/
[2]: http://www.tecmint.com/use-ansible-playbooks-to-automate-complex-tasks-on-multiple-linux-servers/
[3]: http://docs.fabfile.org/en/1.4.0/usage/env.html




