[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use to infrastructure as code)
[#]: via: (https://opensource.com/article/19/7/infrastructure-code)
[#]: author: (Michael Zamot https://opensource.com/users/mzamot)

How to use to infrastructure as code
======
As your servers and applications grow, it becomes harder to maintain and
keep track of them if you don't treat your infrastructure as code.
![Magnifying glass on code][1]

My previous article about [setting up a homelab][2] described many options for building a personal lab to learn new technology. Regardless of whichever solution you choose, as your servers and applications grow, it will become harder and harder to maintain and keep track of them if you don't establish control. To avoid this, it's essential to treat your infrastructure as code.

This article is about infrastructure as code (IaC) best practices and includes a sample project automating the deployment of two virtual machines (VMs) and installing [Keepalived][3] and [Nginx][4] while implementing these practices. You can find all the [code for this project][5] on GitHub.

### Why is IaC important? Aren't my scripts enough?

No, scripts are not enough. Over time, scripts become hard to maintain and hard to keep track of. IaC can help you maintain uniformity and scalability while saving lots of time that you would waste if you did every task manually.

One of the problems with the culture of managing servers manually or partially automated is the lack of consistency and control, which (more often than not) causes configuration drifts and undocumented changes to applications or servers. If a server or a virtual machine has to be replaced, it's time-consuming to manually install every piece of software and do every bit of configuration.

With IaC, hundreds of servers can be provisioned, deployed, and configured, usually from a centralized location, and every configuration can be tracked in a version-control system. If a configuration file has to be modified, instead of connecting to every server, the file can be altered locally and the code pushed to the version-control system. The same is true with scaling up or replacing damaged servers. The entire infrastructure is managed centrally, all the code is kept in a version-control repository like Git, and any changes required by the servers are done using this code alone. No more unique unicorns! (Sorry, unicorns!)

One of IaC's main benefits is its integration with [CI/CD][6] tools like [Jenkins][7], which allows you to test more often and create deployment pipelines that automate moving versions of applications from one environment to the next.

### So, how do you start?

Start by doing an inventory of every application, service, and configuration needed by a server; review every piece of software installed, collect the configuration files, verify their parameters, and find where you can replicate the server.

When you have identified everything you need, remember:

  * Use version control; everything should be tracked using version control.
  * Code everything; nothing should be done manually. Use code to describe the desired state.
  * Idempotence. Every result from the code you write should always yield the same result, no matter how many times it is executed.
  * Make your code modular.
  * Test, test, test
  * Again: Use version control. Don't _ever_ forget this.



#### Prerequisites

You need two virtual machines with CentOS 7 installed. SSH login with keys should be working.

Create a directory called **homelab**. This will be your work directory, and this tutorial will refer to it as **$PWD**. Create two other directories inside this directory: **roles** and **group_vars**:


```
$ mkdir -p homelab/{roles,group_vars}
$ cd homelab
```

#### Version control

The first best practice is to always keep track of everything: automation, configuration files, templates. Version-control systems like Git make it easy for users to collaborate by providing a centralized repository where all the code, configurations, templates, etc. can be found. It also lets users review or restore older versions of files.

If you don't have one, create an account in GitHub or GitLab (or use any other version-control provider of your choice).

Inside **$PWD**, initialize your Git repo:


```
$ echo "# IaC example" &gt;&gt; README.md
$ git init
$ git add README.md
$ git commit -m "First commit"
$ git remote add origin &lt;your Git URL&gt;
$ git push -u origin master
```

#### Code everything

The main idea of IaC is to manage—as much as possible—all your infrastructure with code. Any change required in a server, application, or configuration must be defined in the code. Configuration files can be converted into templates to enable greater flexibility and reusability. Settings specific to applications or servers must also be coded, usually in variable files.

When creating the automation, it is crucial to remember idempotence: No matter how many times the code is executed, it should always have the same result. Same input, same result. For example, when writing a piece of code that modifies a file, you must ensure that if the same code is executed again, the file will look the same.

The following steps are automated, and the code is idempotent.

### Modularity

When writing infrastructure as code, it is imperative to think about reusability. Most of the code you write should be reusable and scalable.

When writing [Ansible][8] roles, the best approach is to follow the Unix philosophy: "Write programs that do one thing and do it well." Therefore, create multiple roles, one for each piece of software: 1) a "base" or "common" role that prepares each VM regardless of its purpose; 2) a role to install and configure Keepalived (for high availability); 3) a role to install and configure Nginx (web server). This method allows each role to be reused for different kinds of servers and will save a lot of coding in the future.

#### Create the base role

This role will prepare the VM with all the steps it needs after it is provisioned. Think about any configurations or software each server needs; they should go in this module. In this example, the base role will:

  * Change the hostname
  * Install security updates
  * Enable [EPEL][9] and install utilities
  * Customize the welcome message



Create the basic role skeleton inside **$PWD/roles**:


```
`$ ansible-galaxy init --offline base`
```

The main file for the role is **$PWD/roles/base/tasks/main.yml**. Modify it with the following content:


```
\---
# We set the hostname to the value in the inventory
\- name: Change hostname
  hostname:
    name: "{{ inventory_hostname }}"

\- name: Update the system
  yum:
    name: "*"
    state: latest

\- name: Install basic utilities
  yum:
    name: ['epel-release', 'tmux', 'vim', 'wget', 'nfs-utils']
    state: present

\- name: Copy motd
  template:
    src: motd.j2
    dest: /etc/motd
```

Create the template file that will replace **/etc/motd** by creating the file **$PWD/roles/base/templates/motd.j2**


```
UNAUTHORIZED ACCESS TO THIS DEVICE IS PROHIBITED

You must have explicit, authorized permission to access or configure "{{ inventory_hostname }}". Unauthorized attempts and actions to access or use this system may result in civil and/or criminal penalties. All activities performed on this device are logged and monitored.
```

Every task in this code is idempotent. No matter how many times the code is executed, it will always yield exactly the same result. Notice how **/etc/motd** is modified; if the file were modified by adding or appending content (instead of using a template), it would have failed the idempotence rule, because a new line would be added every time it was executed.

#### Create the Keepalived role

You could create a role that includes both **Keepalived** and **Nginx**. But what would happen if you ever needed to install Keepalived without a web server? The code would have to be duplicated, wasting time, effort, and simplicity. Keeping roles minimal and straightforward is the way to go.

The automation code should always handle configuration files so they can be tracked in your version-control system. But how do you handle configuration files when settings can have different values per host? Use templates! Templates allow you to use variables and facts, giving you flexibility with the benefits of uniformity.

Create the Keepalived role skeleton within **$PWD/roles**:


```
`$ ansible-galaxy init --offline keepalived`
```

Modify the main task file **$PWD/roles/keepalived/tasks/main.yml** as follows:


```
\---
\- name: Install keepalived
  yum:
    name: "keepalived"
    state: latest

\- name: Configure keepalived with the right settings
  template:
    src: keepalived.j2
    dest: /etc/keepalived/keepalived.conf
  notify: restart keepalived
```

**$PWD/roles/keepalived/handlers/main.yml**:


```
\---
# handlers file for keepalived
\- name: restart keepalived
  service:
    name: keepalived
    enabled: yes
    state: restarted
```

And create the configuration template file **$PWD/roles/keepalived/templates/keepalived.j2**:


```
#### File handled by Ansible.

vrrp_script chk_nginx {
  script "pidof nginx" # check the nginx process
  interval 2 # every 2 seconds
  weight 2 # add 2 points if OK
}

vrrp_instance LAB {
  interface {{ keepalived_nic }} # interface to monitor
  state {{ keepalived_state }}
  virtual_router_id {{ keepalived_vri }}
  priority {{ keepalived_priority }}
  virtual_ipaddress {
    {{ keepalived_vip }}
  }
  track_script {
    chk_nginx
  }
}
```

The Keepalived configuration file was converted into a template. It is a typical Keepalived configuration file, but instead of hardcoding values, it is parameterized.

When automating infrastructure and configuration files, it's vital to analyze application configuration files carefully, noting which values are the same across the environments and which settings are unique to each server. Again, every time the template is processed, it should yield the same result. Create variables, use Ansible facts; this adds up to modularity and flexibility.

#### Create the Nginx role

This simple role will install and configure Nginx using a template, following the same principles discussed above. A template will be used for this role to generate an **index.html** with the host's internet protocol (IP). [Other facts][10] can be used, too.

Modify the main task file **$PWD/roles/nginx/tasks/main.yml** as follows:


```
\---
# tasks file for nginx
\- name: Install nginx
  yum:
    name: 'nginx'
    state: 'latest'
  notify: start nginx

\- name: Create web directory
  file:
    path: /var/www
    state: directory
    mode: '0755'

\- name: Create index.html
  template:
    src: index.html.j2
    dest: /var/www/index.html

\- name: Configure nginx
  template:
    src: lb.conf.j2
    dest: /etc/nginx/conf.d/lb.conf
  notify: restart nginx
```

Modify the main task file **$PWD/roles/nginx/handlers/main.yml** as follows:


```
\---
\- name: start nginx
  systemd:
    name: 'nginx'
    state: 'started'
    enabled: yes

\- name: restart nginx
  systemd:
    name: 'nginx'
    state: 'restarted'
```

And create the following two configuration template files: 

**$PWD/roles/nginx/templates/site.conf.j2:**


```
server {
  listen {{ keepalived_vip }}:80;
  root /var/www;
  location / {
  }
}
```

**$PWD/roles/nginx/templates/index.html.j2**:


```
`Hello, my ip is {{ ansible_default_ipv4.address }}`
```

### Put it all together

You've created several roles; they are ready to be used, so create a playbook to use them.

Create a file called **$PWD/main.yml**:


```
\---
\- hosts: webservers
  become: yes
  roles:
 - base
  - nginx
  - keepalived
```

This file defines what roles go where. If more roles are available, they can be included to create different combinations as needed. Some servers can be web servers only, for example. This flexibility is one of the main reasons it's so essential to write minimal functional units.

The previous roles require variables to work. Ansible is really flexible and lets you define variable files. This example creates a file called **all inside group_vars** (**$PWD/group_vars/all**). If more flexibility is needed, variables can be defined per host inside a folder called **host_vars**:


```
\---
keepalived_nic: eth0
keepalived_vri: 51
keepalived_vip: 192.168.2.180
```

Configure **keepalived_nic** with your preferred Keepalived interface, usually **eth0**. The variable **keepalived_vip** should have the IP needed to use as a virtual IP.

And finally, define the inventory. This inventory should keep track of your entire infrastructure. It's best to use dynamic inventories that gather all the information directly from the hypervisor so it doesn't have to be updated manually. Create a file called **inventory** with a section called **webservers** containing information about the two VMs:


```
[webservers]
webserver01  ansible_user=centos ansible_host=192.168.2.101 keepalived_state=MASTER keepalived_priority=101
webserver02  ansible_user=centos ansible_host=192.168.2.102 keepalived_state=BACKUP keepalived_priority=100
```

The variable **ansible_user** should have the user Ansible will use to connect to the server. The variable **keepalived_state** should indicate if the host will be configured as a Master or Backup (as required in the Keepalived template file). Finally, set the variable **keepalived_priority** here because the master should have a higher priority than the backup.

And that's it; you've automated configuration of two VMs, installing Keepalived and Nginx.

Now save your changes:


```
$ git add .
$ git commit -m "IaC playbook"
$ git push -u origin master
```

and deploy:


```
`$ ansible-playbook -i inventory main.yml`
```

This project investigated basic IaC concepts, but it doesn't end here. Learn more by exploring how to do automated server provisioning, unit testing, and integration with CI/CD tools and pipelines. It's a long process, but it's worth it, both technically and career-wise.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/infrastructure-code

作者：[Michael Zamot][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mzamot
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0 (Magnifying glass on code)
[2]: https://opensource.com/article/19/3/home-lab
[3]: https://www.keepalived.org/
[4]: https://www.nginx.com/
[5]: https://github.com/mzamot/os-homelab-example
[6]: https://en.wikipedia.org/wiki/CI/CD
[7]: https://jenkins.io/
[8]: https://www.ansible.com/
[9]: https://fedoraproject.org/wiki/EPEL
[10]: https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#variables-discovered-from-systems-facts
