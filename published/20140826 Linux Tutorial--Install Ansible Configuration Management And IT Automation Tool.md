Ansible ：一个配置管理和IT自动化工具
================================================================================
![](http://s0.cyberciti.org/uploads/cms/2014/08/ansible_core_circle.png)

今天我来谈谈 ansible，一个由 Python 编写的强大的配置管理解决方案。尽管市面上已经有很多可供选择的配置管理解决方案，但他们各有优劣，而 ansible 的特点就在于它的简洁。让 ansible 在主流的配置管理系统中与众不同的一点便是，它并不需要你在想要配置的每个节点上安装自己的组件。同时提供的一个优点在于，如果需要的话，你可以在不止一个地方控制你的整个基础架构。最后一点是它的正确性，或许这里有些争议，但是我认为在大多数时候这仍然可以作为它的一个优点。说得足够多了，让我们来着手在 RHEL/CentOS 和基于 Debian/Ubuntu 的系统中安装和配置 Ansible。

### 准备工作 ####

1. 发行版：RHEL/CentOS/Debian/Ubuntu Linux
1. Jinja2：Python 的一个对设计师友好的现代模板语言
1. PyYAML：Python 的一个 YAML 编码/反编码函数库
1. paramiko：纯 Python 编写的 SSHv2 协议函数库 （译者注：原文对函数库名有拼写错误）
1. httplib2：一个功能全面的 HTTP 客户端函数库
1. 本文中列出的绝大部分操作已经假设你将在 bash 或者其他任何现代的 shell 中以 root 用户执行。

### Ansible 如何工作 ###

Ansible 工具并不使用守护进程，它也不需要任何额外的自定义安全架构，因此它的部署可以说是十分容易。你需要的全部东西便是 SSH 客户端和服务器了。

     +-----------------+                    +---------------+
     |安装了 Ansible 的|       SSH          | 文件服务器1   |
     |Linux/Unix 工作站|<------------------>| 数据库服务器2 | 在本地或远程
     +-----------------+       模块         | 代理服务器3   | 数据中心的
        192.168.1.100                       +---------------+ Unix/Linux 服务器

其中：

1. 192.168.1.100 - 在你本地的工作站或服务器上安装 Ansible。
1. 文件服务器1到代理服务器3 - 使用 192.168.1.100 和 Ansible 来自动管理所有的服务器。
1. SSH - 在 192.168.1.100 和本地/远程的服务器之间设置 SSH 密钥。

### Ansible 安装教程 ###

ansible 的安装轻而易举，许多发行版的第三方软件仓库中都有现成的软件包，可以直接安装。其他简单的安装方法包括使用 pip 安装它，或者从 github 里获取最新的版本。若想使用你的软件包管理器安装，在[基于 RHEL/CentOS Linux 的系统里你很可能需要 EPEL 仓库][1]。

#### 在基于 RHEL/CentOS Linux 的系统中安装 ansible ####

输入如下 [yum 命令][2]:

    $ sudo yum install ansible

#### 在基于 Debian/Ubuntu Linux 的系统中安装 ansible ####

输入如下 [apt-get 命令][3]:

    $ sudo apt-get install software-properties-common
    $ sudo apt-add-repository ppa:ansible/ansible
    $ sudo apt-get update
    $ sudo apt-get install ansible

#### 使用 pip 安装 ansible ####

[pip 命令是一个安装和管理 Python 软件包的工具][4]，比如它能管理 Python Package Index 中的那些软件包。如下方式在 Linux 和类 Unix 系统中通用：

    $ sudo pip install ansible

#### 从源代码安装最新版本的 ansible ####

你可以通过如下命令从 github 中安装最新版本：

    $ cd ~
    $ git clone git://github.com/ansible/ansible.git
    $ cd ./ansible
    $ source ./hacking/env-setup

当你从一个 git checkout 中运行 ansible 的时候，请记住你每次用它之前都需要设置你的环境，或者你可以把这个设置过程加入你的 bash rc 文件中：

    # 加入 BASH RC
    $ echo "export ANSIBLE_HOSTS=~/ansible_hosts" >> ~/.bashrc
    $ echo "source ~/ansible/hacking/env-setup" >> ~/.bashrc

ansible 的 hosts 文件包括了一系列它能操作的主机。默认情况下 ansible 通过路径 /etc/ansible/hosts 查找 hosts 文件，不过这个行为也是可以更改的，这样当你想操作不止一个 ansible 或者针对不同的数据中心的不同客户操作的时候也是很方便的。你可以通过命令行参数 -i 指定 hosts 文件：

    $ ansible all -m shell -a "hostname" --ask-pass -i /etc/some/other/dir/ansible_hosts

不过我更倾向于使用一个环境变量，这可以在你想要通过 source 一个不同的文件来切换工作目标的时候起到作用。这里的环境变量是 $ANSIBLE_HOSTS，可以这样设置：

    $ export ANSIBLE_HOSTS=~/ansible_hosts

一旦所有需要的组件都已经安装完毕，而且你也准备好了你的 hosts 文件，你就可以来试一试它了。为了快速测试，这里我把 127.0.0.1 写到了 ansible 的 hosts 文件里：

    $ echo "127.0.0.1" > ~/ansible_hosts

现在来测试一个简单的 ping：

    $ ansible all -m ping

或者提示 ssh 密码：

    $ ansible all -m ping --ask-pass

我在刚开始的设置中遇到过几次问题，因此这里强烈推荐为 ansible 设置 SSH 公钥认证。不过在刚刚的测试中我们使用了 --ask-pass，在一些机器上你会需要[安装 sshpass][5] 或者像这样指定 -c paramiko：

    $ ansible all -m ping --ask-pass -c paramiko

当然你也可以[安装 sshpass][6]，然而 sshpass 并不总是在标准的仓库中提供，因此 paramiko 可能更为简单。

### 设置 SSH 公钥认证 ###

于是我们有了一份配置，以及一些基础的其他东西。现在让我们来做一些实用的事情。ansible 的强大很大程度上体现在 playbooks 上，后者基本上就是一些写好的 ansible 脚本（大部分来说），不过在制作一个 playbook 之前，我们将先从一些一句话脚本开始。现在让我们创建和配置 SSH 公钥认证，以便省去 -c 和 --ask-pass 选项：

    $ ssh-keygen -t rsa

样例输出：

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

现在显然有很多种方式来把它放到远程主机上应该的位置。不过既然我们正在使用 ansible，就用它来完成这个操作吧：

    $ ansible all -m copy -a "src=/home/mike/.ssh/id_rsa.pub dest=/tmp/id_rsa.pub" --ask-pass -c paramiko

样例输出：

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

下一步，把公钥文件添加到远程服务器里。输入：

    $ ansible all -m shell -a "cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys" --ask-pass -c paramiko

样例输出：

    SSH password:
    127.0.0.1 | FAILED | rc=1 >>
    /bin/sh: /root/.ssh/authorized_keys: Permission denied

矮油，我们需要用 root 来执行这个命令，所以还是加上一个 -u 参数吧：

    $ ansible all -m shell -a "cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys" --ask-pass -c paramiko -u root

样例输出：

    SSH password:
    127.0.0.1 | success | rc=0 >>

请注意，我刚才这是想要演示通过 ansible 来传输文件的操作。事实上 ansible 有一个更加方便的内置 SSH 密钥管理支持：

    $ ansible all -m authorized_key -a "user=mike key='{{ lookup('file', '/home/mike/.ssh/id_rsa.pub') }}' path=/home/mike/.ssh/authorized_keys manage_dir=no" --ask-pass -c paramiko

样例输出：

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

现在这些密钥已经设置好了。我们来试着随便跑一个命令，比如 hostname，希望我们不会被提示要输入密码

    $ ansible all -m shell -a "hostname" -u root

样例输出：

    127.0.0.1 | success | rc=0 >>

成功！！！现在我们可以用 root 来执行命令，并且不会被输入密码的提示干扰了。我们现在可以轻易地配置任何在 ansible hosts 文件中的主机了。让我们把 /tmp 中的公钥文件删除：

    $ ansible all -m file -a "dest=/tmp/id_rsa.pub state=absent" -u root

样例输出：

    127.0.0.1 | success >> {
        "changed": true,
        "path": "/tmp/id_rsa.pub",
        "state": "absent"
    }

下面我们来做一些更复杂的事情，我要确定一些软件包已经安装了，并且已经是最新的版本：

    $ ansible all -m zypper -a "name=apache2 state=latest" -u root

样例输出：

    127.0.0.1 | success >> {
        "changed": false,
        "name": "apache2",
        "state": "latest"
    }

很好，我们刚才放在 /tmp 中的公钥文件已经消失了，而且我们已经安装好了最新版的 apache。下面我们来看看前面命令中的 -m zypper，一个让 ansible 非常灵活，并且给了 playbooks 更多能力的功能。如果你不使用 openSuse 或者 Suse enterprise 你可能还不熟悉 zypper, 它基本上就是 suse 世界中相当于 yum 的存在。在上面所有的例子中，我的 hosts 文件中都只有一台机器。除了最后一个命令外，其他所有命令都应该在任何标准的 *nix 系统和标准的 ssh 配置中使用，这造成了一个问题。如果我们想要同时管理多种不同的机器呢？这便是 playbooks 和 ansible 的可配置性闪闪发光的地方了。首先我们来少许修改一下我们的 hosts 文件：

    $ cat ~/ansible_hosts

样例输出：

    [RHELBased]
    10.50.1.33
    10.50.1.47

    [SUSEBased]
    127.0.0.1

首先，我们创建了一些分组的服务器，并且给了他们一些有意义的标签。然后我们来创建一个为不同类型的服务器执行不同操作的 playbook。你可能已经发现这个 yaml 的数据结构和我们之前运行的命令行语句中的相似性了。简单来说，-m 是一个模块，而 -a 用来提供模块参数。在 YAML 表示中你可以先指定模块，然后插入一个冒号 :，最后指定参数。

    ---
    - hosts: SUSEBased
      remote_user: root
      tasks:
        - zypper: name=apache2 state=latest
    - hosts: RHELBased
      remote_user: root
      tasks:
        - yum: name=httpd state=latest

现在我们有一个简单的 playbook 了，我们可以这样运行它：

    $ ansible-playbook testPlaybook.yaml -f 10

样例输出：

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

注意，你会看到 ansible 联系到的每一台机器的输出。-f 参数让 ansible 在多台主机上同时运行指令。除了指定全部主机，或者一个主机分组的名字以外，你还可以把导入 ssh 公钥的操作从命令行里转移到 playbook 中，这将在设置新主机的时候提供很大的方便，甚至让新主机直接可以运行一个 playbook。为了演示，我们把我们之前的公钥例子放进一个 playbook 里：

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

除此之外还有很多可以做的事情，比如在启动的时候把公钥配置好，或者引入其他的流程来让你按需配置一些机器。不过只要 SSH 被配置成接受密码登陆，这些几乎可以用在所有的流程中。在你准备开始写太多 playbook 之前，另一个值得考虑的事情是，代码管理可以有效节省你的时间。机器需要不断变化，然而你并不需要在每次机器发生变化时都重新写一个 playbook，只需要更新相关的部分并提交这些修改。与此相关的另一个好处是，如同我之前所述，你可以从不同的地方管理你的整个基础结构。你只需要将你的 playbook 仓库 git clone 到新的机器上，就完成了管理所有东西的全部设置流程。

#### 现实中的 ansible 例子 ####

我知道很多用户经常使用 pastebin 这样的服务，以及很多公司基于显而易见的理由配置了他们内部使用的类似东西。最近，我遇到了一个叫做 showterm 的程序，巧合之下我被一个客户要求配置它用于内部使用。这里我不打算赘述这个应用程序的细节，不过如果你感兴趣的话，你可以使用 Google 搜索 showterm。作为一个合理的现实中的例子，我将会试图配置一个 showterm 服务器，并且配置使用它所需要的客户端应用程序。在这个过程中我们还需要一个数据库服务器。现在我们从配置客户端开始：

    ---
    - hosts: showtermClients
      remote_user: root
      tasks:
        - yum: name=rubygems state=latest
        - yum: name=ruby-devel state=latest
        - yum: name=gcc state=latest
        - gem: name=showterm state=latest user_install=no

这部分很简单。下面是主服务器：

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

还凑合。请注意，从某种意义上来说这是一个任意选择的程序，然而我们现在已经可以持续地在任意数量的机器上部署它了，这便是配置管理的好处。此外，在大多数情况下这里的定义语法几乎是不言而喻的，wiki 页面也就不需要加入太多细节了。当然在我的观点里，一个有太多细节的 wiki 页面绝不会是一件坏事。

### 扩展配置 ###

我们并没有涉及到这里所有的细节。Ansible 有许多选项可以用来配置你的系统。你可以在你的 hosts 文件中内嵌变量，而 ansible 将会把它们应用到远程节点。如：

    [RHELBased]
    10.50.1.33  http_port=443
    10.50.1.47  http_port=80  ansible_ssh_user=mdonlon

    [SUSEBased]
    127.0.0.1  http_port=443

尽管这对于快速配置来说已经非常方便，你还可以将变量分成存放在 yaml 格式的多个文件中。在你的 hosts 文件路径里，你可以创建两个子目录 group_vars 和 host_vars。在这些路径里放置的任何文件，只要能对得上一个主机分组的名字，或者你的 hosts 文件中的一个主机名，它们都会在运行时被插入进来。所以前面的一个例子将会变成这样：

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

### 改善 Playbooks ###

组织 playbooks 也已经有很多种现成的方式。在前面的例子中我们用了一个单独的文件，因此这方面被大幅地简化了。组织这些文件的一个常用方式是创建角色。简单来说，你将一个主文件加载为你的 playbook，而它将会从其它文件中导入所有的数据，这些其他的文件便是角色。举例来说，如果你有了一个 wordpress 网站，你需要一个 web 前端，和一个数据库。web 前端将包括一个 web 服务器，应用程序代码，以及任何需要的模块。数据库有时候运行在同一台主机上，有时候运行在远程的主机上，这时候角色就可以派上用场了。你创建一个目录，并对每个角色创建对应的小 playbook。在这个例子中我们需要一个 apache 角色，mysql 角色，wordpress 角色，mod_php，以及 php 角色。最大的好处是，并不是每个角色都必须被应用到同一台机器上。在这个例子中，mysql 可以被应用到一台单独的机器。这同样为代码重用提供了可能，比如你的 apache 角色还可以被用在 python 和其他相似的 php 应用程序中。展示这些已经有些超出了本文的范畴，而且做一件事总是有很多不同的方式，我建议搜索一些 ansible 的 playbook 例子。有很多人在 github 上贡献代码，当然还有其他一些网站。

### 模块 ###

在 ansible 中，对于所有完成的工作，幕后的工作都是由模块主导的。Ansible 有一个非常丰富的内置模块仓库，其中包括软件包安装，文件传输，以及我们在本文中做的所有事情。但是对一部分人来说，这些并不能满足他们的配置需求，ansible 也提供了方法让你添加自己的模块。Ansible 的 API 有一个非常棒的事情是，它并没有限制模块也必须用编写它的语言 Python 来编写，也就是说，你可以用任何语言来编写模块。Ansible 模块通过传递 JSON 数据来工作，因此你只需要用想用的语言生成一段 JSON 数据。我很确定任何脚本语言都可以做到这一点，因此你现在就可以开始写点什么了。在 Ansible 的网站上有很多的文档，包括模块的接口是如何工作的，以及 Github 上也有很多模块的例子。注意一些小众的语言可能没有很好的支持，不过那只可能是因为没有多少人在用这种语言贡献代码。试着写点什么，然后把你的结果发布出来吧！

### 总结 ###

总的来说，虽然在配置管理方面已经有很多解决方案，我希望本文能显示出 ansible 简单的设置过程，在我看来这是它最重要的一个要点。请注意，因为我试图展示做一件事的不同方式，所以并不是前文中所有的例子都是适用于你的个别环境或者对于普遍情况的最佳实践。这里有一些链接能让你对 ansible 的了解进入下一个层次：

- [Ansible 项目][7]主页.
- [Ansible 项目文档][8].
- [多级环境与 Ansible][9].


--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/python-tutorials/linux-tutorial-install-ansible-configuration-management-and-it-automation-tool/

作者：[Nix Craft][a]
译者：[felixonmars](https://github.com/felixonmars)
校对：[wxy](https://github.com/wxy)

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
