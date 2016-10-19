GETTING STARTED WITH ANSIBLE
==========


This is a crash course on Ansible that you can also use as a template for small projects or to get you into this awesome tool. By the end of this guide, you will know enough to automate server configurations, deployments and more. 

### What is Ansible and why you should care ?

Ansible is a configuration management system known for its simplicity. You only need ssh access to your servers or equipment. It also differs from other options because it pushes changes instead of pulling like puppet or chef normally do. You can deploy code to any number of servers, configure network equipment or automate anything in your infrastructure.

#### Requirements

It’s assumed that you are using Mac or Linux as your workstation, Ubuntu Trusty for your servers and have some experience installing packages. Also, you will need the following software on your computer. So, if you don’t have them already, go ahead and install:

- Virtualbox
- Vagrant
- Mac users: Homebrew

#### Scenario
We are going to emulate 2 web application servers connecting to a MySQL database. The web application uses Rails 5 with Puma.

### Preparations

#### Vagrantfile

Create a folder for this project and save the following content in a file called: Vagrantfile

```
VMs = [
    [ "web1", "10.1.1.11"],
    [ "web2", "10.1.1.12"],
    [ "dbserver", "10.1.1.21"],
  ]

Vagrant.configure(2) do |config|
  VMs.each { |vm|
    config.vm.define vm[0] do |box|
      box.vm.box = "ubuntu/trusty64"
      box.vm.network "private_network", ip: vm[1]
      box.vm.hostname = vm[0]
      box.vm.provider "virtualbox" do |vb|
         vb.memory = "512"
      end
    end
  }
end
```

### Configure your virtual network

We want our VMs to talk to each other, but don’t let that traffic go out to your real network, so we are going to create aHost-Only adapter in Virtualbox.

1. Open Virtualbox
2. Go to Preferences
3. Go to Network
4. Click on Host-Only networks
5. Click to add a network
6. Click on Adapter
7. Set IPv4 to 10.1.1.1, IPv4 Network Mark: 255.255.255.0
8. Click Ok

#### Test your VMs and virtual network

In a terminal, in the directory for this project where you have the Vagrantfile, type the following command:

```
vagrant up
```

This will create your VMs so it may take a while. Check that everything worked by typing this command and verifying the output:

```
$ vagrant status
Current machine states:

web1                      running (virtualbox)
web2                      running (virtualbox)
master                    running (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
```

Now log into each one of the VMs using user & password vagrant and the IPs in the Vagrantfile, this will validate the VMs and add their keys to your known hosts file.

```
ssh vagrant@10.1.1.11 # password is `vagrant`
ssh vagrant@10.1.1.12
ssh vagrant@10.1.1.21
```

Congratulations! Now you have servers to play with. Here comes the exiting part!

### Install Ansible

For Mac users:

```
$ brew install ansible
```

For Ubuntu users:

```
$ sudo apt install ansible
```

Make sure you got a recent version of ansible that is 2.1 or superior:

```
$ ansible --version
ansible 2.1.1.0
```

### The Inventory

Ansible uses an inventory to know what servers to work with and how to group them to perform tasks(in parallel). Let’s create our inventory for this project and name it inventory in the same folder as the Vagrantfile:

```
[all:children]
webs
db

[all:vars]
ansible_user=vagrant
ansible_ssh_pass=vagrant

[webs]
web1 ansible_host=10.1.1.11
web2 ansible_host=10.1.1.12

[db]
dbserver ansible_host=10.1.1.21
```

- `[all:children]` defines a group(all) of groups
- `[all:vars]` defines variables that belong to the group all
- `[webs]` defines a group just like [dbs]
- The rest of the file is just declarations of hosts, with their names and IPs
- A blank line means end of a declaration

Now that we have an inventory we can start using ansible from the command line, specifying a host or a group to perform commands. Here is a typical example of a command to check connectivity to your servers:

```
$ ansible -i inventory all -m ping
```

- `-i` specifies the inventory file
- `all` specifies the server or group of servers to operate
- `-m` specifies an ansible module, in this case ping

Here is the output of this command:

```
dbserver | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
web1 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
web2 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```

Note that servers respond with a different order. This only depends on who responds first, but is not relevant, because ansible keeps the status of each server separate.

You can also run any command using another switch:

- `-a <command>`

```
$ ansible -i inventory all -a uptime
web1 | SUCCESS | rc=0 >>
 21:43:27 up 25 min,  1 user,  load average: 0.00, 0.01, 0.05

dbserver | SUCCESS | rc=0 >>
 21:43:27 up 24 min,  1 user,  load average: 0.00, 0.01, 0.05

web2 | SUCCESS | rc=0 >>
 21:43:27 up 25 min,  1 user,  load average: 0.00, 0.01, 0.05
```

Here is another example with only one server:

```
$ ansible -i inventory dbserver -a "df -h /"
dbserver | SUCCESS | rc=0 >>
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        40G  1.4G   37G   4% /
```

### Playbooks

Playbooks are just YAML files that associate groups of servers in an inventory with commands. The correct word in ansible is tasks, and it can be a desired state, a shell command, or many other options. For a list of all the things you can do with ansible take a look at the list of all modules.

Here is an example of a playbook for running a shell command, save this as playbook1.yml:

```
---
- hosts: all
  tasks:
    - shell: uptime
```

- `---` is the start of the YAML file
- `- hosts`: specifies what group is going to be used
- `tasks`: marks the start of a list of tasks
- `- shell`: specifies the first task using the shell module
- REMEMBER: YAML requires indentation so make sure you are always following the correct structure in your playbooks

Run it with:

```
$ ansible-playbook -i inventory playbook1.yml

PLAY [all] *********************************************************************

TASK [setup] *******************************************************************
ok: [web1]
ok: [web2]
ok: [dbmaster]

TASK [command] *****************************************************************
changed: [web1]
changed: [web2]
changed: [dbmaster]

PLAY RECAP *********************************************************************
dbmaster                   : ok=2    changed=1    unreachable=0    failed=0
web1                       : ok=2    changed=1    unreachable=0    failed=0
web2                       : ok=2    changed=1    unreachable=0    failed=0
```

As you can see ansible ran 2 tasks, instead of just one we have in our playbook. The TASK [setup] is an implicit task that runs first to capture information of the servers like hostnames, IPs, distributions, and many more details, that information can then be used to run conditional tasks.

There is also a final PLAY RECAP where ansible shows how many tasks ran and the corresponding state for each. In our case, since we ran a shell command, ansible doesn’t know the resulting state and it’s then considered as changed.


### Installing Software

We are going to use apt to install software on our servers, for this we need to be root, so we have to use the become statement, save this content in playbook2.yml and run it(ansible-playbook playbook2.yml):

```
---
- hosts: webs
  become_user: root
  become: true
  tasks:
    - apt: name=git state=present
```

There are statements you can apply to all modules in ansible; one is the name statement that let’s you print a more descriptive text about the task being executed. In order to use it you keep your task the same but add name: descriptive text as the first line, so our previous text will be:

```
---
- hosts: webs
  become_user: root
  become: true
  tasks:
    - name: This task will make sure git is present on the system
      apt: name=git state=present
```

### Using `with_items`

When you are dealing with a list of items, packages to install, files to create, etc. ansible provides with_items. Here is how we use it in our playbook3.yml, adding at the same time some other statements we already know:

```
---
- hosts: all
  become_user: root
  become: true
  tasks:
    - name: Installing dependencies
      apt: name={{item}} state=present
      with_items:
        - git
        - mysql-client
        - libmysqlclient-dev
        - build-essential
        - python-software-properties
```

### Using `template` and `vars`

`vars` is one statement that defines variables you can use either in `task` statements or inside `template` files. Jinja2 is the templating engine used in Ansible, but you don’t need to learn a lot about it to use it. Define variables in your playbook like this:

```
---
- hosts: all
  vars:
    - secret_key: VqnzCLdCV9a3jK
    - path_to_vault: /opt/very/deep/path
  tasks:
    - name: Setting a configuration file using template
      template: src=myconfig.j2 dest={{path_to_vault}}/app.conf
```

As you can see I can use {{path_to_vault}} as part of the playbook, but also since I am using a template statement, I can use any variable inside the myconfig.j2 file, which has to be stored in a subfolder called templates. Your project tree should look like:

```
├── Vagrantfile
├── inventory
├── playbook1.yml
├── playbook2.yml
└── templates
    └── myconfig.j2
```

When ansible finds a template statement it will look into the templates folder and expand the variables surrounded by{{ and }}.

Example template:

```
this is just an example vault_dir: {{path_to_vault}} secret_password: {{secret_key}}
```

You can also use `template` even if you are not expanding variables. I do this in advance considering I may add them later. For example, let’s create a `hosts.j2` template and add the hostnames and IPs:

```
10.1.1.11 web1
10.1.1.12 web2
10.1.1.21 dbserver
```

This will require a statement like this:

```
  -  name: Installing the hosts file in all servers
     template: src=hosts.j2 dest=/etc/hosts mode=644
```

### Shell commands

You should always try to use modules because Ansible can track the state of the task and avoid repeating it unnecessarily, but there are times when a shell command is unavoidable. For those cases Ansible offers two options:

- command: Literally just running a command without environment variables or redirections (|, <, >, etc.)
- shell: Runs /bin/sh and expands variables and redirections

#### Other useful modules

- apt_repository – Add/Remove package repositories in Debian family
- yum_repository – Add/Remove package repositories in RedHat family
- service – Start/Stop/Restart/Enable/Disable services
- git – Deploy code from a git server
- unarchive – Unarchive packages from the web or local sources

#### Running a task only in one server

Rails uses `migrations` to make gradual changes to your DB, but since you have more than one app server, these migrations can not be assigned as a group task, instead we need only one server to run the migrations. In cases like this is when run_once is used, run_once will delegate the task to one server and continue with the next task until this task is done. You only need to set run_once: true in your task.

```
    - name: 'Run db:migrate'
      shell: cd {{appdir}};rails db:migrate
      run_once: true
```

##### Tasks that can fail

By specifying ignore_errors: true you can run a task that may fail but doesn’t affect the completion of the rest of your playbook. This is useful, for example, when deleting a log file that initially will not exist.

```
    - name: 'Delete logs'
      shell: rm -f /var/log/nginx/errors.log
      ignore_errors: true
```

##### Putting it all together

Now using what we previously learned, here is the final version of each file:

Vagrantfile:

```
VMs = [
    [ "web1", "10.1.1.11"],
    [ "web2", "10.1.1.12"],
    [ "dbserver", "10.1.1.21"],
  ]

Vagrant.configure(2) do |config|
  VMs.each { |vm|
    config.vm.define vm[0] do |box|
      box.vm.box = "ubuntu/trusty64"
      box.vm.network "private_network", ip: vm[1]
      box.vm.hostname = vm[0]
      box.vm.provider "virtualbox" do |vb|
         vb.memory = "512"
      end
    end
  }
end
```

inventory:

```
[all:children]
webs
db

[all:vars]
ansible_user=vagrant
ansible_ssh_pass=vagrant

[webs]
web1 ansible_host=10.1.1.11
web2 ansible_host=10.1.1.12

[db]
dbserver ansible_host=10.1.1.21
```

templates/hosts.j2:

```
10.1.1.11 web1
10.1.1.12 web2
10.1.1.21 dbserver
```

templates/my.cnf.j2:

```
[client]
port        = 3306
socket      = /var/run/mysqld/mysqld.sock

[mysqld_safe]
socket      = /var/run/mysqld/mysqld.sock
nice        = 0

[mysqld]
server-id   = 1
user        = mysql
pid-file    = /var/run/mysqld/mysqld.pid
socket      = /var/run/mysqld/mysqld.sock
port        = 3306
basedir     = /usr
datadir     = /var/lib/mysql
tmpdir      = /tmp
lc-messages-dir = /usr/share/mysql
skip-external-locking
bind-address        = 0.0.0.0
key_buffer      = 16M
max_allowed_packet  = 16M
thread_stack        = 192K
thread_cache_size       = 8
myisam-recover         = BACKUP
query_cache_limit   = 1M
query_cache_size        = 16M
log_error = /var/log/mysql/error.log
expire_logs_days    = 10
max_binlog_size         = 100M

[mysqldump]
quick
quote-names
max_allowed_packet  = 16M

[mysql]

[isamchk]
key_buffer      = 16M

!includedir /etc/mysql/conf.d/

final-playbook.yml:

- hosts: all
  become_user: root
  become: true
  tasks:
    - name: 'Install common software on all servers'
      apt: name={{item}} state=present
      with_items:
        - git
        - mysql-client
        - libmysqlclient-dev
        - build-essential
        - python-software-properties
    - name: 'Install hosts file'
      template: src=hosts.j2 dest=/etc/hosts mode=644

- hosts: db
  become_user: root
  become: true
  tasks:
    - name: 'Software for DB server'
      apt: name={{item}} state=present
      with_items:
        - mysql-server
        - percona-xtrabackup
        - mytop
        - mysql-utilities
    - name: 'MySQL config file'
      template: src=my.cnf.j2 dest=/etc/mysql/my.cnf
    - name: 'Restart MySQL'
      service: name=mysql state=restarted
    - name: 'Grant access to web app servers'
      shell: echo 'GRANT ALL PRIVILEGES ON *.* TO "root"@"%" WITH GRANT OPTION;FLUSH PRIVILEGES;'|mysql -u root mysql

- hosts: webs
  vars:
    - appdir: /opt/dummyapp
  become_user: root
  become: true
  tasks:
    - name: 'Add ruby-ng repo'
      apt_repository: repo='ppa:brightbox/ruby-ng'
    - name: 'Install rails software'
      apt: name={{item}} state=present
      with_items:
        - ruby-dev
        - ruby-all-dev
        - ruby2.2
        - ruby2.2-dev
        - ruby-switch
        - libcurl4-openssl-dev
        - libssl-dev
        - zlib1g-dev
        - nodejs
    - name: 'Set ruby to 2.2'
      shell: ruby-switch --set ruby2.2
    - name: 'Install gems'
      shell: gem install bundler rails
    - name: 'Kill puma if running'
      shell: file /run/puma.pid >/dev/null && kill `cat /run/puma.pid` 2>/dev/null
      ignore_errors: True
    - name: 'Clone app repo'
      git:
           repo=https://github.com/c0d5x/rails_dummyapp.git
           dest={{appdir}}
           version=staging
           force=yes
    - name: 'Run bundler'
      shell: cd {{appdir}};bundler
    - name: 'Run db:setup'
      shell: cd {{appdir}};rails db:setup
      run_once: true
    - name: 'Run db:migrate'
      shell: cd {{appdir}};rails db:migrate
      run_once: true
    - name: 'Run rails server'
      shell: cd {{appdir}};rails server -b 0.0.0.0 -p 80 --pid /run/puma.pid -d
```

### Turn up your environment

Having these files in the same directory, turn up your dev environment by running:

```
vagrant up
ansible-playbook -i inventory final-playbook.yml
```

#### Deployment of new code

Make changes to your code and push those changes to your repo. Then, simply make sure you have the correct branch in your git statement:

```
    - name: 'Clone app repo'
      git:
           repo=https://github.com/c0d5x/rails_dummyapp.git
           dest={{appdir}}
           version=staging
           force=yes
```

As an example, you can change the version field with master, run the playbook again:

```
ansible-playbook -i inventory final-playbook.yml
```

Check that the page has changed on any of the web servers: `http://10.1.1.11` or `http://10.1.1.12`. Change it back to `version=staging` and rerun the playbook and check the page again.

You can also create an alternative playbook that has only the tasks related to the deployment so that it runs faster.

### What is next !?

This is a very small portion of what ansible can do. We didn’t touch roles, filters, debugor many other awesome features that it offers, but hopefully it gives you a good start! So, go ahead and start using it and learn as you go. If you have any questions you can reach me on twitter or comment below and let me know what else you’d like to find out about ansible!


--------------------------------------------------------------------------------

via: https://gorillalogic.com/blog/getting-started-with-ansible/?utm_source=webopsweekly&utm_medium=email

作者：[JOSE HIDALGO][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://gorillalogic.com/author/josehidalgo/
