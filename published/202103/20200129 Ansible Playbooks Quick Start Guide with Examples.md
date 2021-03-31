[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13167-1.html"
[#]: subject: "Ansible Playbooks Quick Start Guide with Examples"
[#]: via: "https://www.2daygeek.com/ansible-playbooks-quick-start-guide-with-examples/"
[#]: author: "Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/"

Ansible 剧本快速入门指南
======

我们已经写了两篇关于 Ansible 的文章，这是第三篇。

如果你是 Ansible 新手，我建议你阅读下面这两篇文章，它会教你一些 Ansible 的基础以及它是什么。

  * 第一篇: [Ansible 自动化工具安装、配置和快速入门指南][1]
  * 第二篇: [Ansible 点对点命令快速入门指南示例][2]

如果你已经阅读过了，那么在阅读本文时你才不会感到突兀。

### 什么是 Ansible 剧本?

<ruby>剧本<rt>playbook</rt></ruby>比点对点命令模式更强大，而且完全不同。

它使用了 `/usr/bin/ansible-playbook` 二进制文件，并且提供丰富的特性使得复杂的任务变得更容易。

如果你想经常运行一个任务，剧本是非常有用的。此外，如果你想在服务器组上执行多个任务，它也是非常有用的。

剧本是由 YAML 语言编写。YAML 代表一种标记语言，它比其它常见的数据格式（如 XML 或 JSON）更容易读写。

下面这张 Ansible 剧本流程图将告诉你它的详细结构。

![][3]

### 理解 Ansible 剧本的术语

  * <ruby>控制节点<rt>Control node</rt></ruby>：Ansible 安装的机器，它负责管理客户端节点。
  * <ruby>受控节点<rt>Managed node</rt></ruby>：控制节点管理的主机列表。
  * <ruby>剧本<rt>playbook</rt></ruby>：一个剧本文件包含一组自动化任务。
  * <ruby>主机清单<rt>Inventory</rt></ruby>：这个文件包含有关管理的服务器的信息。
  * <ruby>任务<rt>Task</rt></ruby>：每个剧本都有大量的任务。任务在指定机器上依次执行（一个主机或多个主机）。
  * <ruby>模块<rt>Module</rt></ruby>： 模块是一个代码单元，用于从客户端节点收集信息。
  * <ruby>角色<rt>Role</rt></ruby>：角色是根据已知文件结构自动加载一些变量文件、任务和处理程序的方法。
  * <ruby>动作<rt>Play</rt></ruby>：每个剧本含有大量的动作，一个动作从头到尾执行一个特定的自动化。
  * <ruby>处理程序<rt>Handler</rt></ruby>： 它可以帮助你减少在剧本中的重启任务。处理程序任务列表实际上与常规任务没有什么不同，更改由通知程序通知。如果处理程序没有收到任何通知，它将不起作用。

### 基本的剧本是怎样的？

下面是一个剧本的模板：

```
---                                [YAML 文件应该以三个破折号开头]
- name:                            [脚本描述]
  hosts: group                     [添加主机或主机组]
  become: true                     [如果你想以 root 身份运行任务，则标记它]
  tasks:                           [你想在任务下执行什么动作]
    - name:                        [输入模块选项]
      module:                      [输入要执行的模块]
        module_options-1: value    [输入模块选项]
        module_options-2: value
        .
        module_options-N: value
```

### 如何理解 Ansible 的输出

Ansible 剧本的输出有四种颜色，下面是具体含义：

  * **绿色**：`ok` 代表成功，关联的任务数据已经存在，并且已经根据需要进行了配置。
  * **黄色**：`changed` 指定的数据已经根据任务的需要更新或修改。
  * **红色**：`FAILED` 如果在执行任务时出现任何问题，它将返回一个失败消息，它可能是任何东西，你需要相应地修复它。
  * **白色**：表示有多个参数。

为此，创建一个剧本目录，将它们都放在同一个地方。

```
$ sudo mkdir /etc/ansible/playbooks
```

### 剧本-1：在 RHEL 系统上安装 Apache Web 服务器

这个示例剧本允许你在指定的目标机器上安装 Apache Web 服务器：

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

### 如何理解 Ansible 中剧本的执行

使用以下命令来查看语法错误。如果没有发现错误，它只显示剧本文件名。如果它检测到任何错误，你将得到一个如下所示的错误，但内容可能根据你的输入文件而有所不同。

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

或者，你可以使用这个 URL [YAML Lint][4] 在线检查 Ansible 剧本内容。

执行以下命令进行“演练”。当你运行带有 `--check` 选项的剧本时，它不会对远程机器进行任何修改。相反，它会告诉你它将要做什么改变但不是真的执行。

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

如果你想要知道 ansible 剧本实现的详细信息，使用 `-vv` 选项，它会展示如何收集这些信息。

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

### 剧本-2：在 Ubuntu 系统上安装 Apache Web 服务器

这个示例剧本允许你在指定的目标节点上安装 Apache Web 服务器。

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

### 剧本-3：在 Red Hat 系统上安装软件包列表

这个示例剧本允许你在指定的目标节点上安装软件包。

**方法-1：**

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

**方法-2：**

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

**方法-3：使用数组变量**

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

### 剧本-4：在 Linux 系统上安装更新

这个示例剧本允许你在基于 Red Hat 或 Debian 的 Linux 系统上安装更新。

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
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-13142-1.html
[2]: https://linux.cn/article-13163-1.html
[3]: https://www.2daygeek.com/wp-content/uploads/2020/01/ansible-playbook-structure-flow-chart-explained.png
[4]: http://www.yamllint.com/
