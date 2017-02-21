Ansible 起步指南
==========

这是一篇关于 Ansible 的速成课程，你可以用作小项目的模板，或者帮你深入了解这个神奇的工具。阅读了本指南之后，你将对自动化服务器配置、部署等有足够的了解。

### Ansible 是什么，为什么你该了解？

Ansible 简单的说是一个配置管理系统（configuration management system）。你只需要可以使用 ssh 访问你的服务器或设备就行。它也不同于其他工具，因为它使用推送的方式，而不是像 puppet 或 chef 那样使用拉取的方式。你可以将代码部署到任意数量的服务器上，配置网络设备或在基础架构中自动执行任何操作。

### 前置要求

假设你使用 Mac 或 Linux 作为你的工作站，Ubuntu Trusty 作为你的服务器，并有一些安装软件包的经验。此外，你的计算机上将需要以下软件。所以，如果你还没有它们，请先安装：

- [Virtualbox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/downloads.html)
- Mac 用户：[Homebrew](http://brew.sh/)

### 情景

我们将模拟 2 个连接到 MySQL 数据库的 Web 应用程序服务器。Web 应用程序使用 Rails 5 和 Puma。

### 准备

#### Vagrantfile

为这个项目创建一个文件夹，并将下面的内容保存到名为 `Vagrantfile` 的文件。

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

#### 配置你的虚拟网络

我们希望我们的虚拟机能互相交互，但不要让流量流出到真实的网络，所以我们将在 Virtualbox 中创建一个仅主机（HOST-Only）的网络适配器。

1. 打开 Virtualbox
2. 转到 Preferences
3. 转到 Network
4. 单击 Host-Only
5. 单击添加网络
6. 单击 Adapter
7. 将 IPv4 设置为 `10.1.1.1`，IPv4 网络掩码：`255.255.255.0`
8. 单击 “OK”

#### 测试虚拟机及虚拟网络

在终端中，在存放 `Vagrantfile` 的项目目录中，输入下面的命令：

```
vagrant up
```

它会创建你的虚拟机，因此会花费一会时间。输入下面的命令并验证输出内容以检查是否已经工作：

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

现在使用 `vagrant` 的用户名和密码 ，按 `Vagrantfile` 中的 IP 登录其中一台虚拟机，这将验证虚拟机并将它们的密钥添加到你的已知主机（`known_hosts`）文件中。

```
ssh vagrant@10.1.1.11 # password is `vagrant`
ssh vagrant@10.1.1.12
ssh vagrant@10.1.1.21
```

恭喜你！现在你已经有可以实验的服务器了。下面的剩下的部分！

### 安装 Ansible

对于 Mac 用户:

```
$ brew install ansible
```

对于 Ubuntu 用户:

```
$ sudo apt install ansible
```

确保你使用了ansible 最近的版本 2.1 或者更高的版本：

```
$ ansible --version
ansible 2.1.1.0
```

### 清单

Ansible 使用清单文件来了解要使用的服务器，以及如何将它们分组以并行执行任务。让我们为这个项目创建我们的清单文件 `inventory`，并将它放在与 `Vagrantfile` 相同的文件夹中：

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

- `[all：children]` 定义一个组的组（`all`）
- `[all：vars]` 定义属于组 `all` 的变量
- `[webs]` 定义一个组，就像 `[db]` 一样
- 文件的其余部分只是主机的声明，带有它们的名称和 IP
- 空行表示声明结束

现在我们有了一个清单，我们可以从命令行开始使用 ansible，指定一个主机或一个组来执行命令。以下是检查与服务器的连接的命令示例：

```
$ ansible -i inventory all -m ping
```
- `-i` 指定清单文件
- `all` 指定要操作的服务器或服务器组
- `-m' 指定一个 ansible 模块，在这种情况下为 `ping`

下面是命令输出：

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

服务器以不同的顺序响应，这只取决于谁先响应，但是这个没有关系，因为 ansible 独立保持每台服务器的状态。

你也可以使用另外一个选项来运行任何命令：

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

这是只有一台服务器的另外一个例子：

```
$ ansible -i inventory dbserver -a "df -h /"
dbserver | SUCCESS | rc=0 >>
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        40G  1.4G   37G   4% /
```

### 剧本

剧本（playbook）只是个 YAML 文件，它将清单文件中的服务器组与命令关联。在 ansible 中的对于关键字是 `tasks`，它可以是一个预期的状态、shell 命令或许多其它的选项。有关 ansible 可做的所有事情列表，可以查看[所有模块的列表](http://docs.ansible.com/ansible/list_of_all_modules.html)。

下面是一个运行 shell 命令的剧本示例，将其保存为 `playbook1.yml`：

```
---
- hosts: all
  tasks:
    - shell: uptime
```

- `---` 是 YAML 文件的开始
- ` - hosts`：指定要使用的组
- `tasks`：标记任务列表的开始
- ` - shell`：指定第一个任务使用 [shell] (http://docs.ansible.com/ansible/shell_module.html) 模块
- **记住：YAML 需要缩进结构，确保你始终遵循剧本中的正确结构**

用下面的命令运行它：

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

正如你所见，ansible 运行了 2 个任务，而不是只有剧本中的一个。`TASK [setup]` 是一个隐式任务，它会首先运行以捕获服务器的信息，如主机名、IP、发行版和更多详细信息，然后可以使用这些信息运行条件任务。

还有最后的 `PLAY RECAP`，其中 ansible 显示了运行了多少个任务以及每个对应的状态。在我们的例子中，因为我们运行了一个 shell 命令，ansible 不知道结果的状态，它被认为是 `changed`。

#### 安装软件

我们将使用 [apt](http://docs.ansible.com/ansible/apt_module.html) 在我们的服务器上安装软件，因为我们需要 root 权限，所以我们必须使用 `become` 语句，将这个内容保存在 `playbook2.yml` 中并运行它（`ansible-playbook playbook2.yml`）：

```
---
- hosts: webs
  become_user: root
  become: true
  tasks:
    - apt: name=git state=present
```

有一些语句可以应用于 ansible 中所有模块；一个是 `name` 语句，可以让我们输出关于正在执行的任务的更具描述性的文本。要使用它，保持任务内容一样，但是添加 `name ：描述性文本` 作为第一行，所以我们以前的文本将改成：

```
---
- hosts: webs
  become_user: root
  become: true
  tasks:
    - name: This task will make sure git is present on the system
      apt: name=git state=present
```

#### 使用 `with_items`

当你要处理一个列表时，比如要安装的项目和软件包、要创建的文件，可以用 ansible 提供的 `with_items`。下面是我们如何在 `playbook3.yml` 中使用它，同时添加一些我们已经知道的其他语句：

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

#### 使用 `template` 和 `vars`

`vars` 是一个定义变量语句，可以在 `task` 语句或 `template` 文件中使用。 [Jinja2](http://jinja.pocoo.org/docs/dev/) 是 Ansible 中使用的模板引擎，但是关于它你不需要学习很多。在你的剧本中定义变量，如下所示：

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

正如你看到的，我可以使用 `{{path_to_vault}}` 作为剧本的一部分，但也因为我使用了 `template`语句，我可以使用 `myconfig.j2` 中的任何变量，该文件必须存在一个名为 `templates` 的子文件夹中。你项目树应该如下所示：

```
├── Vagrantfile
├── inventory
├── playbook1.yml
├── playbook2.yml
└── templates
    └── myconfig.j2
```

当 ansible 找到一个 `template` 语句后它会在  `templates` 文件夹内查找，并将把被 `{{` 和 `}}` 括起来的变量展开来。

示例模板：

```
this is just an example vault_dir: {{path_to_vault}} secret_password: {{secret_key}}
```

即使你不扩展变量你也可以使用  `template`。考虑到将来会添加所以我先做了。比如创建一个 `hosts.j2` 模板并加入主机名和 IP。

```
10.1.1.11 web1
10.1.1.12 web2
10.1.1.21 dbserver
```

这里要用像这样的语句：

```
  -  name: Installing the hosts file in all servers
     template: src=hosts.j2 dest=/etc/hosts mode=644
```

#### shell 命令

你应该尽量使用模块，因为 Ansible 可以跟踪任务的状态，并避免不必要的重复，但有时 shell 命令是不可避免的。 对于这些情况，Ansible 提供两个选项：

- [command](http://docs.ansible.com/ansible/command_module.html)：直接运行一个命令，没有环境变量或重定向（`|`，`<`，`>` 等）
- [shell](http://docs.ansible.com/ansible/shell_module.html)：运行 `/bin/sh` 并展开变量和支持重定向

#### 其他有用的模块

- [apt_repository](http://docs.ansible.com/ansible/apt_repository_module.html) - 在 Debian 系的发行版中添加/删除包仓库
- [yum_repository](https://docs.ansible.com/ansible/yum_repository_module.html) - 在 RedHat 系的发行版中添加/删除包仓库
- [service](http://docs.ansible.com/ansible/service_module.html) - 启动/停止/重新启动/启用/禁用服务
- [git](http://docs.ansible.com/ansible/git_module.html) - 从 git 服务器部署代码
- [unarchive](http://docs.ansible.com/ansible/unarchive_module.html) - 从 Web 或本地源解开软件包

#### 只在一台服务器中运行任务

Rails 使用 [migrations](http://edgeguides.rubyonrails.org/active_record_migrations.html) 来逐步更改数据库，但由于你有多个应用程序服务器，因此这些迁移任务不能被分配为组任务，而我们只需要一个服务器来运行迁移。在这种情况下，当使用 `run_once` 时，`run_once` 将分派任务到一个服务器，并直到这个任务完成继续下一个任务。你只需要在你的任务中设置 `run_once：true`。

```
    - name: 'Run db:migrate'
      shell: cd {{appdir}};rails db:migrate
      run_once: true
```

#### 会失败的任务

通过指定 `ignore_errors：true`，你可以运行可能会失败的任务，但不会影响剧本中剩余的任务完成。这是非常有用的，例如，当删除最初并不存在的日志文件时。

```
    - name: 'Delete logs'
      shell: rm -f /var/log/nginx/errors.log
      ignore_errors: true
```

### 放到一起

现在用我们先前学到的，这里是每个文件的最终版：

`Vagrantfile`：

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

`inventory`：

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

`templates/hosts.j2`:

```
10.1.1.11 web1
10.1.1.12 web2
10.1.1.21 dbserver
```

`templates/my.cnf.j2`：

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
```

`final-playbook.yml`：

```
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

### 放在你的环境中

将这些文件放在相同的目录，运行下面的命令打开你的开发环境：

```
vagrant up
ansible-playbook -i inventory final-playbook.yml
```

### 部署新的代码

确保修改了代码并推送到了仓库中。接下来，确保你 git 语句中使用了正确的分支：

```
    - name: 'Clone app repo'
      git:
           repo=https://github.com/c0d5x/rails_dummyapp.git
           dest={{appdir}}
           version=staging
           force=yes
```

作为一个例子，你可以修改 `version` 字段为 `master`，再次运行剧本：

```
ansible-playbook -i inventory final-playbook.yml
```

检查所有的 web 服务器上的页面是否已更改：`http://10.1.1.11` 或 `http://10.1.1.12`。将其更改为 `version = staging` 并重新运行剧本并再次检查页面。

你还可以创建只包含与部署相关的任务的替代剧本，以便其运行更快。

### 接下来是什么 ？！

这只是可以做的很小一部分。我们没有接触角色（role）、过滤器（filter）、调试等许多其他很棒的功能，但我希望它给了你一个良好的开始！所以，请继续学习并使用它。如果你有任何问题，你可以在 [twitter](https://twitter.com/c0d5x) 或评论栏联系我，让我知道你还想知道哪些关于 ansible 的东西！


--------------------------------------------------------------------------------

via: https://gorillalogic.com/blog/getting-started-with-ansible/?utm_source=webopsweekly&utm_medium=email

作者：[JOSE HIDALGO][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://gorillalogic.com/author/josehidalgo/
