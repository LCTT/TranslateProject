[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Ansible Playbooks Quick Start Guide with Examples)
[#]: via: (https://www.2daygeek.com/ansible-playbooks-quick-start-guide-with-examples/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Ansible Playbooks Quick Start Guide with Examples
======

We have already written two articles about Ansible, this is the third article.

If you are new to Ansible, I advise you to read the two topics below, which will teach you the basics of Ansible and what it is.

  * **Part-1: [How to Install and Configure Ansible on Linux][1]**
  * **Part-2: [Ansible ad-hoc Command Quick Start Guide][2]**



If you have finished them, you will feel the continuity as you read this article.

### What is the Ansible Playbook?

Playbooks are much more powerful and completely different way than ad-hoc command mode.

It uses the **“/usr/bin/ansible-playbook”** binary. It provides rich features to make complex task easier.

Playbooks are very useful if you want to run a task often.

Also, this is useful if you want to perform multiple tasks at the same time on the group of server.

Playbooks are written in YAML language. YAML stands for Ain’t Markup Language, which is easier for humans to read and write than other common data formats such as XML or JSON.

The Ansible Playbook Flow Chart below will tell you its detailed structure.

![][3]

### Understanding the Ansible Playbooks Terminology

  * **Control Node:** The machine where Ansible is installed. It is responsible for managing client nodes.
  * **Managed Nodes:** List of hosts managed by the control node
  * **Playbook:** A Playbook file contains a set of procedures used to automate a task.
  * **Inventory:** The inventory file contains information about the servers you manage.
  * **Task:** Each play has multiple tasks, tasks that are executed one by one against a given machine (it a host or multiple host or a group of host).
  * **Module:** Modules are a unit of code that is used to gather information from the client node.
  * **Role:** Roles are ways to automatically load some vars_files, tasks, and handlers based on known file structure.
  * **Play:** Each playbook has multiple plays, and a play is the implementation of a particular automation from beginning to end.
  * **Handlers:** This helps you reduce any service restart in a play. Lists of handler tasks are not really different from regular tasks, and changes are notified by notifiers. If the handler does not receive any notification, it will not work.



### How Does the Basic Playbook looks Like?

Here’s how the basic playbook looks.

```
---                                [YAML file should begin with a three dash]
- name:                            [Description about a script]
  hosts: group                     [Add a host or host group]
  become: true                     [It requires if you want to run a task as a root user]
  tasks:                           [What action do you want to perform under task]
    - name:                        [Enter the module options]
      module:                      [Enter a module, which you want to perform]
        module_options-1: value    [Enter the module options]
        module_options-2: value
        .
        module_options-N: value
```

### How to Understand Ansible Output

The Ansible Playbook output comes with 4 colors, see below for color definitions.

  * **Green:** **ok –** If that is correct, the associated task data already exists and configured as needed.
  * **Yellow: changed –** Specific data has updated or modified according to the needs of the tasks.
  * **Red: FAILED –** If there is any problem while doing a task, it returns a failure message, it may be anything and you need to fix it accordingly.
  * **White:** It comes with multiple parameters



To do so, create a playbook directory to keep them all in one place.

```
$ sudo mkdir /etc/ansible/playbooks
```

### Playbook-1: Ansible Playbook to Install Apache Web Server on RHEL Based Systems

This sample playbook allows you to install the Apache web server on a given target node.

```
$ sudo nano /etc/ansible/playbooks/apache.yml

---
- hosts: web
  become: yes
  name: "Install and Configure Apache Web server"
  tasks:
    - name: "Install Apache Web Server"
      yum:
        name: httpd
        state: latest
    - name: "Ensure Apache Web Server is Running"
      service:
        name: httpd
        state: started
```

```
$ ansible-playbook apache1.yml
```

![][3]

### How to Understand Playbook Execution in Ansible

To check the syntax error, run the following command. If it finds no error, it only shows the given file name. If it detects any error, you will get an error as follows, but the contents may differ based on your input file.

```
$ ansible-playbook apache1.yml --syntax-check

ERROR! Syntax Error while loading YAML.
  found a tab character that violate indentation
The error appears to be in '/etc/ansible/playbooks/apache1.yml': line 10, column 1, but may
be elsewhere in the file depending on the exact syntax problem.
The offending line appears to be:
        state: latest
^ here
There appears to be a tab character at the start of the line.

YAML does not use tabs for formatting. Tabs should be replaced with spaces.
For example:
    - name: update tooling
      vars:
        version: 1.2.3
# ^--- there is a tab there.
Should be written as:
    - name: update tooling
      vars:
        version: 1.2.3
# ^--- all spaces here.
```

Alternatively, you can check your ansible-playbook content from online using the following url @ [YAML Lint][4]

Run the following command to perform a **“Dry Run”**. When you run a ansible-playbook with the **“–check”** option, it does not make any changes to the remote machine. Instead, it will tell you what changes they have made rather than create them.

```
$ ansible-playbook apache.yml --check

PLAY [Install and Configure Apache Webserver] ********************************************************************

TASK [Gathering Facts] *******************************************************************************************
ok: [node2.2g.lab]
ok: [node1.2g.lab]

TASK [Install Apache Web Server] *********************************************************************************
changed: [node2.2g.lab]
changed: [node1.2g.lab]

TASK [Ensure Apache Web Server is Running] ***********************************************************************
changed: [node1.2g.lab]
changed: [node2.2g.lab]

PLAY RECAP *******************************************************************************************************
node1.2g.lab               : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
node2.2g.lab               : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

If you want detailed information about your ansible playbook implementation, use the **“-vv”** verbose option. It shows what it really does to gather this information.

```
$ ansible-playbook apache.yml --check -vv

ansible-playbook 2.9.2
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/home/daygeek/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.8/site-packages/ansible
  executable location = /usr/bin/ansible-playbook
  python version = 3.8.1 (default, Jan  8 2020, 23:09:20) [GCC 9.2.0]
Using /etc/ansible/ansible.cfg as config file

PLAYBOOK: apache.yml *****************************************************************************************************
1 plays in apache.yml

PLAY [Install and Configure Apache Webserver] ****************************************************************************

TASK [Gathering Facts] ***************************************************************************************************
task path: /etc/ansible/playbooks/apache.yml:2
ok: [node2.2g.lab]
ok: [node1.2g.lab]
META: ran handlers

TASK [Install Apache Web Server] *****************************************************************************************
task path: /etc/ansible/playbooks/apache.yml:6
changed: [node2.2g.lab] => {"changed": true, "msg": "Check mode: No changes made, but would have if not in check mod
e", "rc": 0, "results": ["Installed: httpd"]}
changed: [node1.2g.lab] => {"changed": true, "changes": {"installed": ["httpd"], "updated": []}, "msg": "", "obsolet
es": {"urw-fonts": {"dist": "noarch", "repo": "@anaconda", "version": "2.4-16.el7"}}, "rc": 0, "results": []}

TASK [Ensure Apache Web Server is Running] *******************************************************************************
task path: /etc/ansible/playbooks/apache.yml:10
changed: [node1.2g.lab] => {"changed": true, "msg": "Service httpd not found on host, assuming it will exist on full run"}
changed: [node2.2g.lab] => {"changed": true, "msg": "Service httpd not found on host, assuming it will exist on full run"}
META: ran handlers
META: ran handlers

PLAY RECAP ***************************************************************************************************************
node1.2g.lab               : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
node2.2g.lab               : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

### Playbook-2: Ansible Playbook to Install Apache Web Server on Ubuntu Based Systems

This sample playbook allows you to install the Apache web server on a given target node.

```
$ sudo nano /etc/ansible/playbooks/apache-ubuntu.yml

---
- hosts: web
  become: yes
  name: "Install and Configure Apache Web Server"
  tasks:
    - name: "Install Apache Web Server"
      yum:
        name: apache2
        state: latest

    - name: "Start the Apache Web Server"
      service:
        name: apaceh2
        state: started

    - name: "Enable mod_rewrite module"
      apache2_module:
        name: rewrite
        state: present

      notify:
      - start apache

  handlers:
    - name: "Ensure Apache Web Server is Running"
      service:
        name: apache2
        state: restarted
        enabled: yes
```

### Playbook-3: Ansible Playbook to Install a List of Packages on Red Hat Based Systems

This sample playbook allows you to install a list of packages on a given target node.

**Method-1:**

```
$ sudo nano /etc/ansible/playbooks/packages-redhat.yml

---
- hosts: web
  become: yes
  name: "Install a List of Packages on Red Hat Based System"
  tasks:
    - name: "Installing a list of packages"
      yum:
        name:
          - curl
          - httpd
          - nano
          - htop
```

**Method-2:**

```
$ sudo nano /etc/ansible/playbooks/packages-redhat-1.yml

---
- hosts: web
  become: yes
  name: "Install a List of Packages on Red Hat Based System"
  tasks:
    - name: "Installing a list of packages"
      yum: name={{ item }} state=latest
      with_items:
        - curl
        - httpd
        - nano
        - htop
```

**Method-3: Using Array Variable**

```
$ sudo nano /etc/ansible/playbooks/packages-redhat-2.yml

---
- hosts: web
  become: yes
  name: "Install a List of Packages on Red Hat Based System"
  vars:
     packages: [ 'curl', 'git', 'htop' ]
  tasks:
     - name: Install a list of packages
       yum: name={{ item }} state=latest
       with_items: "{{ packages }}"
```

### Playbook-4: Ansible Playbook to Install Updates on Linux Systems

This sample playbook allows you to install updates on your Linux systems, running Red Hat and Debian-based client nodes.

```
$ sudo nano /etc/ansible/playbooks/security-update.yml

---
- hosts: web
  become: yes
  name: "Install Security Update"
  tasks:
    - name: "Installing Security Update on Red Hat Based System"
      yum: name=* update_cache=yes security=yes state=latest
      when: ansible_facts['distribution'] == "CentOS"

    - name: "Installing Security Update on Ubuntu Based System"
      apt: upgrade=dist update_cache=yes
      when: ansible_facts['distribution'] == "Ubuntu"
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/ansible-playbooks-quick-start-guide-with-examples/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/install-configure-ansible-automation-tool-linux-quick-start-guide/
[2]: https://www.2daygeek.com/ansible-ad-hoc-command-quick-start-guide-with-examples/
[3]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]: http://www.yamllint.com/
