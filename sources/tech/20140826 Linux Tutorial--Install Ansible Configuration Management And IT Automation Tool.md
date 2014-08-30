Linux Tutorial: Install Ansible Configuration Management And IT Automation Tool
================================================================================
![](http://s0.cyberciti.org/uploads/cms/2014/08/ansible_core_circle.png)

Today I will be talking about ansible, a powerful configuration management solution written in python. There are many configuration management solutions available, all with pros and cons, ansible stands apart from many of them for its simplicity. What makes ansible different than many of the most popular configuration management systems is that its agent-less, no need to setup agents on every node you want to control. Plus, this has the benefit of being able to control you entire infrastructure from more than one place, if needed. That last point's validity, of being a benefit, may be debatable but I find it as a positive in most cases. Enough talk, lets get started with Ansible installation and configuration on a RHEL/CentOS, and Debian/Ubuntu based systems.

### Prerequisites ###

1. Distro: RHEL/CentOS/Debian/Ubuntu Linux
1. Jinja2: A modern and designer friendly templating language for Python.
1. PyYAML: A YAML parser and emitter for the Python programming language.
1. parmiko: Native Python SSHv2 protocol library.
1. httplib2: A comprehensive HTTP client library.
1. Most of the actions listed in this post are written with the assumption that they will be executed by the root user running the bash or any other modern shell.

How Ansible works

Ansible tool uses no agents. It requires no additional custom security infrastructure, so it’s easy to deploy. All you need is ssh client and server:

     +----------------------+                    +---------------+
     |Linux/Unix workstation|       SSH          | file_server1  |
     |with Ansible          |<------------------>| db_server2    | Unix/Linux servers
     +----------------------+    Modules         | proxy_server3 | in local/remote
        192.168.1.100                            +---------------+ data centers

Where,

1. 192.168.1.100 - Install Ansible on your local workstation/server.
1. file_server1..proxy_server3 - Use 192.168.1.100 and Ansible to automates configuration management of all servers.
1. SSH - Setup ssh keys between 192.168.1.100 and local/remote servers.

### Ansible Installation Tutorial ###

Installation of ansible is a breeze, many distributions have a package available in their 3rd party repos which can easily be installed, a quick alternative is to just pip install it or grab the latest copy from github. To install using your package manager, on [RHEL/CentOS Linux based systems you will most likely need the EPEL repo][1] then:

#### Install ansible on a RHEL/CentOS Linux based system ####

Type the following [yum command][2]:

    $ sudo yum install ansible

#### Install ansible on a Debian/Ubuntu Linux based system ####

Type the following [apt-get command][3]:

    $ sudo apt-get install software-properties-common
    $ sudo apt-add-repository ppa:ansible/ansible
    $ sudo apt-get update
    $ sudo apt-get install ansible

#### Install ansible using pip ####

The [pip command is a tool for installing and managing Python packages][4], such as those found in the Python Package Index. The following method works on Linux and Unix-like systems:

    $ sudo pip install ansible

#### Install the latest version of ansible using source code ####

You can install the latest version from github as follows:

    $ cd ~
    $ git clone git://github.com/ansible/ansible.git
    $ cd ./ansible
    $ source ./hacking/env-setup

When running ansible from a git checkout, one thing to remember is that you will need to setup your environment everytime you want to use it, or you can add it to your bash rc file:

    # ADD TO BASH RC
    $ echo "export ANSIBLE_HOSTS=~/ansible_hosts" >> ~/.bashrc
    $ echo "source ~/ansible/hacking/env-setup" >> ~/.bashrc

The hosts file for ansible is basically a list of hosts that ansible is able to perform work on. By default ansible looks for the hosts file at /etc/ansible/hosts, but there are ways to override that which can be handy if you are working with multiple installs or have several different clients for whose datacenters you are responsible for. You can pass the hosts file on the command line using the -i option:

    $ ansible all -m shell -a "hostname" --ask-pass -i /etc/some/other/dir/ansible_hosts

My preference however is to use and environment variable, this can be useful if source a different file when starting work for a specific client. The environment variable is $ANSIBLE_HOSTS, and can be set as follows:

    $ export ANSIBLE_HOSTS=~/ansible_hosts

Once all requirements are installed and you have you hosts file setup you can give it a test run. For a quick test I put 127.0.0.1 into the ansible hosts file as follow:

    $ echo "127.0.0.1" > ~/ansible_hosts

Now lets test with a quick ping:

    $ ansible all -m ping

OR ask for the ssh password:

    $ ansible all -m ping --ask-pass

I have run across a problem a few times regarding initial setup, it is highly recommended you setup keys for ansible to use but in the previous test we used --ask-pass, on some machines you will need [to install sshpass][5] or add a -c paramiko like so:

    $ ansible all -m ping --ask-pass -c paramiko

Or you [can install sshpass][6], however sshpass is not always available in the standard repos so paramiko can be easier.

### Setup SSH Keys ###

Now that we have gotten the configuration, and other simple stuff, out of the way lets move onto doing something productive. Alot of the power of ansible lies in playbooks, which are basically scripted ansible runs (for the most part), but we will start with some one liners before we build out a playbook. Lets start with creating and configuring keys so we can avoid the -c and --ask-pass options:

    $ ssh-keygen -t rsa

Sample outputs:

    Generating public/private rsa key pair.
    Enter file in which to save the key (/home/mike/.ssh/id_rsa):
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    Your identification has been saved in /home/mike/.ssh/id_rsa.
    Your public key has been saved in /home/mike/.ssh/id_rsa.pub.
    The key fingerprint is:
    94:a0:19:02:ba:25:23:7f:ee:6c:fb:e8:38:b4:f2:42 mike@ultrabook.linuxdork.com
    The key's randomart image is:
    +--[ RSA 2048]----+
    |... . .          |
    |.  . + . .       |
    |= . o   o        |
    |.*     .         |
    |. . .   S        |
    | E.o             |
    |.. ..            |
    |o o+..           |
    | +o+*o.          |
    +-----------------+

Now obviously there are plenty of ways to put this in place on the remote machine but since we are using ansible, lets use that:

    $ ansible all -m copy -a "src=/home/mike/.ssh/id_rsa.pub dest=/tmp/id_rsa.pub" --ask-pass -c paramiko

Sample outputs:

    SSH password:
    127.0.0.1 | success >> {
        "changed": true,
        "dest": "/tmp/id_rsa.pub",
        "gid": 100,
        "group": "users",
        "md5sum": "bafd3fce6b8a33cf1de415af432774b4",
        "mode": "0644",
        "owner": "mike",
        "size": 410,
        "src": "/home/mike/.ansible/tmp/ansible-tmp-1407008170.46-208759459189201/source",
        "state": "file",
        "uid": 1000
    }

Next, add the public key in remote server, enter:

    $ ansible all -m shell -a "cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys" --ask-pass -c paramiko

Sample outputs:

    SSH password:
    127.0.0.1 | FAILED | rc=1 >>
    /bin/sh: /root/.ssh/authorized_keys: Permission denied

Whoops, we want to be able to run things as root, so lets add a -u option:

    $ ansible all -m shell -a "cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys" --ask-pass -c paramiko -u root

Sample outputs:

    SSH password:
    127.0.0.1 | success | rc=0 >>

Please note, I wanted to demonstrate a file transfer using ansible, there is however a more built in way for managing keys using ansible:

    $ ansible all -m authorized_key -a "user=mike key='{{ lookup('file', '/home/mike/.ssh/id_rsa.pub') }}' path=/home/mike/.ssh/authorized_keys manage_dir=no" --ask-pass -c paramiko

Sample outputs:

    SSH password:
    127.0.0.1 | success >> {
        "changed": true,
        "gid": 100,
        "group": "users",
        "key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCq+Z8/usprXk0aCAPyP0TGylm2MKbmEsHePUOd7p5DO1QQTHak+9gwdoJJavy0yoUdi+C+autKjvuuS+vGb8+I+8mFNu5CvKiZzIpMjZvrZMhHRdNud7GuEanusTEJfi1pUd3NA2iXhl4a6S9a/4G2mKyf7QQSzI4Z5ddudUXd9yHmo9Yt48/ASOJLHIcYfSsswOm8ux1UnyeHqgpdIVONVFsKKuSNSvZBVl3bXzhkhjxz8RMiBGIubJDBuKwZqNSJkOlPWYN76btxMCDVm07O7vNChpf0cmWEfM3pXKPBq/UBxyG2MgoCGkIRGOtJ8UjC/daadBUuxg92/u01VNEB mike@ultrabook.linuxdork.com",
        "key_options": null,
        "keyfile": "/home/mike/.ssh/authorized_keys",
        "manage_dir": false,
        "mode": "0600",
        "owner": "mike",
        "path": "/home/mike/.ssh/authorized_keys",
        "size": 410,
        "state": "file",
        "uid": 1000,
        "unique": false,
        "user": "mike"
    }

Now that the keys are in place lets try running an arbitrary command like hostname and hope we don't get prompted for a password

    $ ansible all -m shell -a "hostname" -u root

Sample outputs:

    127.0.0.1 | success | rc=0 >>

Success!!! Now that we can run commands as root and not be bothered by using a password we are in a good place to easily configure any and all hosts in the ansible hosts file. Let's remove the key from /tmp:

    $ ansible all -m file -a "dest=/tmp/id_rsa.pub state=absent" -u root

Sample outputs:

    127.0.0.1 | success >> {
        "changed": true,
        "path": "/tmp/id_rsa.pub",
        "state": "absent"
    }

Next, I'm going to make sure we have a few packages installed and on the latest version and we will move on to something a little more complicated:

    $ ansible all -m zypper -a "name=apache2 state=latest" -u root

Sample outputs:

    127.0.0.1 | success >> {
        "changed": false,
        "name": "apache2",
        "state": "latest"
    }

Alright, the key we placed in /tmp is now absent and we have the latest version of apache installed. This brings me to the next point, something that makes ansible very flexible and gives more power to playbooks, many may have noticed the -m zypper in the previous commands. Now unless you use openSuse or Suse enterpise you may not be familiar with zypper, it is basically the equivalent of yum in the suse world. In all of the examples above I have only had one machine in my hosts file, and while everything but the last command should work on any standard *nix systems with standard ssh configs, this leads to a problem. What if we had multiple machine types that we wanted to manage? Well this is where playbooks, and the configurability of ansible really shines. First lets modify our hosts file a little, here goes:

    $ cat ~/ansible_hosts

Sample outputs:

    [RHELBased]
    10.50.1.33
    10.50.1.47
     
    [SUSEBased]
    127.0.0.1

First, we create some groups of servers, and give them some meaningful tags. Then we create a playbook that will do different things for the different kinds of servers. You might notice the similarity between the yaml data structures and the command line instructions we ran earlier. Basically the -m is a module, and -a is for module args. In the YAML representation you put the module then :, and finally the args.

    ---
    - hosts: SUSEBased
      remote_user: root
      tasks:
        - zypper: name=apache2 state=latest
    - hosts: RHELBased
      remote_user: root
      tasks:
        - yum: name=httpd state=latest

Now that we have a simple playbook, we can run it as follows:

    $ ansible-playbook testPlaybook.yaml -f 10

Sample outputs:

    PLAY [SUSEBased] **************************************************************
     
    GATHERING FACTS ***************************************************************
    ok: [127.0.0.1]
     
    TASK: [zypper name=apache2 state=latest] ************************************** 
    ok: [127.0.0.1]
     
    PLAY [RHELBased] **************************************************************
     
    GATHERING FACTS ***************************************************************
    ok: [10.50.1.33]
    ok: [10.50.1.47]
     
    TASK: [yum name=httpd state=latest] ******************************************* 
    changed: [10.50.1.33]
    changed: [10.50.1.47]
     
    PLAY RECAP ********************************************************************
    10.50.1.33                 : ok=2    changed=1    unreachable=0    failed=0   
    10.50.1.47                 : ok=2    changed=1    unreachable=0    failed=0   
    127.0.0.1                  : ok=2    changed=0    unreachable=0    failed=0 

Now you will notice that you will see output from each machine that ansible contacted. The -f is what lets ansible run on multiple hosts in parallel. Instead of using all, or a name of a host group, on the command line you can put this passwords for the ask-pass prompt into the playbook. While we no longer need the --ask-pass since we have ssh keys setup, it comes in handy when setting up new machines, and even new machines can run from a playbook. To demonstrate this lets convert our earlier key example into a playbook:

    ---
    - hosts: SUSEBased
      remote_user: mike
      sudo: yes
      tasks:
        - authorized_key: user=root key="{{ lookup('file', '/home/mike/.ssh/id_rsa.pub') }}" path=/root/.ssh/authorized_keys manage_dir=no
    - hosts: RHELBased
      remote_user: mdonlon
      sudo: yes
      tasks:
        - authorized_key: user=root key="{{ lookup('file', '/home/mike/.ssh/id_rsa.pub') }}" path=/root/.ssh/authorized_keys manage_dir=no

Now there are plenty of other options here that could be done, for example having the keys dropped during a kickstart, or via some other kind of process involved with bringing up machines on the hosting of your choice, but this can be used in pretty much any situation assuming ssh is setup to accept a password. One thing to think about before writing out too many playbooks, version control can save you a lot of time. Machines need to change over time, you don't need to re-write a playbook every time a machine changes, just update the pertinent bits and commit the changes. Another benefit of this ties into what I said earlier about being able to manage the entire infrastructure from multiple places. You can easily git clone your playbook repo onto a new machine and be completely setup to manage everything in a repetitive manner.

#### Real world ansible example ####

I know a lot of people make great use of services like pastebin, and a lot of companies for obvious reasons setup their own internal instance of something similar. Recently, I came across a newish application called showterm and coincidentally I was asked to setup an internal instance of it for a client. I will spare you the details of this app, but you can google showterm if interested. So for a reasonable real world example I will attempt to setup a showterm server, and configure the needed app on the client to use it. In the process we will need a database server as well. So here goes, lets start with the client configuration.

    ---
    - hosts: showtermClients
      remote_user: root
      tasks:
        - yum: name=rubygems state=latest
        - yum: name=ruby-devel state=latest
        - yum: name=gcc state=latest
        - gem: name=showterm state=latest user_install=no

That was easy, lets move on to the main server:

    ---
    - hosts: showtermServers
      remote_user: root
      tasks:
        - name: ensure packages are installed
          yum: name={{item}} state=latest
          with_items:
            - postgresql
            - postgresql-server
            - postgresql-devel
            - python-psycopg2
            - git
            - ruby21
            - ruby21-passenger
        - name: showterm server from github
          git: repo=https://github.com/ConradIrwin/showterm.io dest=/root/showterm
        - name: Initdb
          command: service postgresql initdb
                   creates=/var/lib/pgsql/data/postgresql.conf
     
        - name: Start PostgreSQL and enable at boot
          service: name=postgresql
                   enabled=yes
                   state=started
        - gem: name=pg state=latest user_install=no
      handlers:
       - name: restart postgresql
         service: name=postgresql state=restarted
     
    - hosts: showtermServers
      remote_user: root
      sudo: yes
      sudo_user: postgres
      vars:
        dbname: showterm
        dbuser: showterm
        dbpassword: showtermpassword
      tasks:
        - name: create db
          postgresql_db: name={{dbname}}
     
        - name: create user with ALL priv
          postgresql_user: db={{dbname}} name={{dbuser}} password={{dbpassword}} priv=ALL
    - hosts: showtermServers
      remote_user: root
      tasks:
        - name: database.yml
          template: src=database.yml dest=/root/showterm/config/database.yml
    - hosts: showtermServers
      remote_user: root
      tasks:
        - name: run bundle install
          shell: bundle install
          args:
            chdir: /root/showterm
    - hosts: showtermServers
      remote_user: root
      tasks:
        - name: run rake db tasks
          shell: 'bundle exec rake db:create db:migrate db:seed'
          args:
            chdir: /root/showterm
    - hosts: showtermServers
      remote_user: root
      tasks:
        - name: apache config
          template: src=showterm.conf dest=/etc/httpd/conf.d/showterm.conf

Not so bad, now keeping in mind that this is a somewhat random and obscure app that we can now install in a consistent fashion on any number of machines, this is where the benefits of configuration management really come to light. Also, in most cases the declarative syntax almost speaks for itself and wiki pages need not go into as much detail, although a wiki page with too much detail is never a bad thing in my opinion.

### Expanding Configuration ###

We have not touched on everything here, Ansible has many options for configuring you setup. You can do things like embedding variables in your hosts file, so that Ansible will interpolate them on the remote nodes, eg.

    [RHELBased]
    10.50.1.33  http_port=443
    10.50.1.47  http_port=80  ansible_ssh_user=mdonlon
     
    [SUSEBased]
    127.0.0.1  http_port=443

While this is really handy for quick configurations, you can also layer variables across multiple files in yaml format. In you hosts file path you can make two sub directories named group_vars and host_vars. Any files in those paths that match the name of the group of hosts, or a host name in your hosts file will be interpolated at run time. So the previous example would look like this:

    ultrabook:/etc/ansible # pwd
    /etc/ansible
    ultrabook:/etc/ansible # tree
    .
    ├── group_vars
    │   ├── RHELBased
    │   └── SUSEBased
    ├── hosts
    └── host_vars
    ├── 10.50.1.33
    └── 10.50.1.47

----------

    2 directories, 5 files
    ultrabook:/etc/ansible # cat hosts
    [RHELBased]
    10.50.1.33
    10.50.1.47

----------

    [SUSEBased]
    127.0.0.1
    ultrabook:/etc/ansible # cat group_vars/RHELBased
    ultrabook:/etc/ansible # cat group_vars/SUSEBased
    ---
    http_port: 443
    ultrabook:/etc/ansible # cat host_vars/10.50.1.33
    ---
    http_port: 443
    ultrabook:/etc/ansible # cat host_vars/10.50.1.47
    ---
    http_port:80
    ansible_ssh_user: mdonlon

### Refining Playbooks ###

There are many ways to organize playbooks as well. In the previous examples we used a single file, and everything is really simplified. One way of organizing things that is commonly used is creating roles. Basically you load a main file as your playbook, and that then imports all the data from the extra files, the extra files are organized as roles. For example if you have a wordpress site, you need a web head, and a database. The web head will have a web server, the app code, and any needed modules. The database is sometimes ran on the same host and some times ran on remote hosts, and this is where roles really shine. You make a directory, and small playbook for each role. In this case we can have an apache role, mysql role, wordpress role, mod_php, and php roles. The big advantage to this is that not every role has to be applied on one server, in this case mysql could be applied to a separate machine. This also allows for code re-use, for example you apache role could be used with python apps and php apps alike. Demonstrating this is a little beyond the scope of this article, and there are many different ways of doing thing, I would recommend searching for ansible playbook examples. There are many people contributing code on github, and I am sure various other sites.

### Modules ###

All of the work being done behind the scenes in ansible is driven by modules. Ansible has an excellent library of built in modules that do things like package installation, transferring files, and everything we have done in this article. But for some people this will not be suitable for their setup, ansible has a means of adding your own modules. One great thing about the API provided by Ansible is that you are not restricted to the language it was written in, Python, you can use any language really. Ansible modules work by passing around JSON data structures, so as long as you can build a JSON data structure in your language of choice, which I am pretty sure any scripting language can do, you can begin coding something right away. There is much documentation on the Ansible site, about how the module interface works, and many examples of modules on github as well. Keep in mind that some obscure languages may not have great support, but that would only be because not enough people are contributing code in that language, try it out and publish your results somewhere!

### Conclusion ###

In conclusion, there are many systems around for configuration management, I hope this article shows the ease of setup for ansible which I believe is one of its strongest points. Please keep in mind that I was trying to show a lot of different ways to do things, and not everything above may be considered best practice in your private infrastructure, or the coding world abroad. Here are some more links to take you knowledge of ansible to the next level:

- [Ansible project][7] home page.
- [Ansible project documentation][8].
- [Multistage environments with Ansible][9].




--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/python-tutorials/linux-tutorial-install-ansible-configuration-management-and-it-automation-tool/

作者：[Nix Craft][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.cyberciti.biz/tips/about-us
[1]:http://www.cyberciti.biz/faq/fedora-sl-centos-redhat6-enable-epel-repo/
[2]:http://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/
[3]:http://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html
[4]:http://www.cyberciti.biz/faq/debian-ubuntu-centos-rhel-linux-install-pipclient/
[5]:http://www.cyberciti.biz/faq/noninteractive-shell-script-ssh-password-provider/
[6]:http://www.cyberciti.biz/faq/noninteractive-shell-script-ssh-password-provider/
[7]:http://www.ansible.com/
[8]:http://docs.ansible.com/
[9]:http://rosstuck.com/multistage-environments-with-ansible/