使用 Ansible 让你的系统管理自动化
======

>精进你的系统管理能力和 Linux 技能，学习如何设置工具来简化管理多台机器。

![配图 ](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_google_wave.png?itok=2oh8TpUi)

你是否想精进你的系统管理能力和 Linux 技能？也许你的本地局域网上跑了一些东西，而你又想让生活更轻松一点--那该怎么办呢？在本文中，我会向你演示如何设置工具来简化管理多台机器。

远程管理工具有很多，SaltStack、Puppet、Chef，以及 Ansible 都是很流行的选择。在本文中，我将重点放在 Ansible 上并会解释它是如何帮到你的，不管你是有 5 台还是 1000 台虚拟机。

让我们从多机（不管这些机器是虚拟的还是物理的）的基本管理开始。我假设你知道要做什么，有基础的 Linux 管理技能（至少要有能找出执行每个任务具体步骤的能力）。我会向你演示如何使用这一工具，而是否使用它由你自己决定。

### 什么是 Ansible？

Ansible 的网站上将之解释为 “一个超级简单的 IT 自动化引擎，可以自动进行云供给、配置管理、应用部署、服务内部编排，以及其他很多 IT 需求。” 通过在一个集中的位置定义好服务器集合，Ansible 可以在多个服务器上执行相同的任务。

如果你对 Bash 的 `for` 循环很熟悉，你会发现 Ansible 操作跟这很类似。区别在于 Ansible 是<ruby>幕等的<rt>idempotent</rt></ruby>。通俗来说就是 Ansible 一般只有在确实会发生改变时才执行所请求的动作。比如，假设你执行一个 Bash 的 for 循环来为多个机器创建用户，像这样子：

```
for server in serverA serverB serverC; do ssh ${server} "useradd myuser"; done
```

这会在 serverA、serverB，以及 serverC 上创建 myuser 用户；然而不管这个用户是否存在，每次运行这个 for 循环时都会执行 `useradd` 命令。一个幕等的系统会首先检查用户是否存在，只有在不存在的情况下才会去创建它。当然，这个例子很简单，但是幕等工具的好处将会随着时间的推移变得越发明显。

#### Ansible 是如何工作的？

Ansible 会将 Ansible playbooks 转换成通过 SSH 运行的命令，这在管理类 UNIX 环境时有很多优势：

1. 绝大多数类 UNIX 机器默认都开了 SSH。
2. 依赖 SSH 意味着远程主机不需要有代理。
3. 大多数情况下都无需安装额外的软件，Ansible 需要 2.6 或更新版本的 Python。而绝大多数 Linux 发行版默认都安装了这一版本（或者更新版本）的 Python。
4. Ansible 无需主节点。他可以在任何安装有 Ansible 并能通过 SSH 访问的主机上运行。
5. 虽然可以在 cron 中运行 Ansible，但默认情况下，Ansible 只会在你明确要求的情况下运行。

#### 配置 SSH 密钥认证

使用 Ansible 的一种常用方法是配置无需密码的 SSH 密钥登录以方便管理。（可以使用 Ansible Vault 来为密码等敏感信息提供保护，但这不在本文的讨论范围之内）。现在只需要使用下面命令来生成一个 SSH 密钥，如示例 1 所示。

```
[09:44 user ~]$ ssh-keygen
Generating public/private rsa key pair。
Enter file in which to save the key (/home/user/.ssh/id_rsa):
Created directory '/home/user/.ssh'。
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/user/.ssh/id_rsa。
Your public key has been saved in /home/user/.ssh/id_rsa.pub。
The key fingerprint is:
SHA256:TpMyzf4qGqXmx3aqZijVv7vO9zGnVXsh6dPbXAZ+LUQ user@user-fedora
The key's randomart image is:
+---[RSA 2048]----+
|                 |
|                 |
|              E  |
|       o .   .。|
|   .  + S    o+。|
|  . .o * .  .+ooo|
| . .+o  o o oo+。*|
|。.ooo* o。*  .*+|
| . o+*BO.o+    .o|
+----[SHA256]-----+
```

*示例 1 ：生成一个 SSH 密钥*


在示例 1 中，直接按下回车键来接受默认值。任何非特权用户都能生成 SSH 密钥，也能安装到远程系统中任何用户的 SSH 的 `authorized_keys` 文件中。生成密钥后，还需要将之拷贝到远程主机上去，运行下面命令：

```
ssh-copy-id root@servera
```

注意：运行 Ansible 本身无需 root 权限；然而如果你使用非 root 用户，你_需要_为要执行的任务配置合适的 sudo 权限。

输入 servera 的 root 密码，这条命令会将你的 SSH 密钥安装到远程主机上去。安装好 SSH 密钥后，再通过 SSH 登录远程主机就不再需要输入 root 密码了。

### 安装 Ansible

只需要在示例 1 中生成 SSH 密钥的那台主机上安装 Ansible。若你使用的是 Fedora，输入下面命令：

```
sudo dnf install ansible -y
```

若运行的是 CentOS，你需要为 EPEL 仓库配置额外的包：

```
sudo yum install epel-release -y
```

然后再使用 yum 来安装 Ansible：

```
sudo yum install ansible -y
```

对于基于 Ubuntu 的系统，可以从 PPA 上安装 Ansible：

```
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible -y
```

若你使用的是 macOS，那么推荐通过 Python PIP 来安装：

```
sudo pip install ansible
```

对于其他发行版，请参见 [Ansible 安装文档 ][2]。

### Ansible Inventory

Ansible 使用一个 INI 风格的文件来追踪要管理的服务器，这种文件被称之为<ruby>库存清单<rt>Inventory</rt></ruby>。默认情况下该文件位于 `/etc/ansible/hosts`。本文中，我使用示例 2 中所示的 Ansible 库存清单来对所需的主机进行操作（为了简洁起见已经进行了裁剪）：

```
[arch]
nextcloud
prometheus
desktop1
desktop2
vm-host15

[fedora]
netflix

[centos]
conan
confluence
7-repo
vm-server1
gitlab

[ubuntu]
trusty-mirror
nwn
kids-tv
media-centre
nas

[satellite]
satellite

[ocp]
lb00
ocp_dns
master01
app01
infra01
```

*示例 2 ： Ansible 主机文件*

每个分组由中括号和组名标识（像这样 `[group1]` )，是应用于一组服务器的任意组名。一台服务器可以存在于多个组中，没有任何问题。在这个案例中，我有根据操作系统进行的分组（`arch`、`ubuntu`、`centos`、`fedora`），也有根据服务器功能进行的分组（`ocp`、`satellite`）。Ansible 主机文件可以处理比这复杂的多的情况。详细内容，请参阅 [库存清单文档][3]。

### 运行命令

将你的 SSH 密钥拷贝到库存清单中所有服务器上后，你就可以开始使用 Ansible 了。Ansible 的一项基本功能就是运行特定命令。语法为：

```
ansible -a "some command"
```
例如，假设你想升级所有的 CentOS 服务器，可以运行：

```
ansible centos -a 'yum update -y'
```

_注意：不是必须要根据服务器操作系统来进行分组的。我下面会提到，[Ansible Facts][4] 可以用来收集这一信息；然而，若使用 Facts 的话，则运行特定命令会变得很复杂，因此，如果你在管理异构环境的话，那么为了方便起见，我推荐创建一些根据操作系统来划分的组。_

这会遍历 `centos` 组中的所有服务器并安装所有的更新。一个更加有用的命令应该是 Ansible 的 `ping` 模块了，可以用来验证服务器是否准备好接受命令了：

```
ansible all -m ping
```

这会让 Ansible 尝试通过 SSH 登录库存清单中的所有服务器。在示例 3 中可以看到 `ping` 命令的部分输出结果。

```
nwn | SUCCESS => {
    "changed":false，
    "ping":"pong"
}
media-centre | SUCCESS => {
    "changed":false，
    "ping":"pong"
}
nas | SUCCESS => {
    "changed":false，
    "ping":"pong"
}
kids-tv | SUCCESS => {
    "changed":false，
    "ping":"pong"
}
...
```

*示例 3 ：Ansible ping 命令输出*

运行指定命令的能力有助于完成快速任务（LCTT 译注：应该指的那种一次性任务），但是如果我想在以后也能以同样的方式运行同样的任务那该怎么办呢？Ansible [playbooks][5] 就是用来做这个的。

### 复杂任务使用 Ansible playbooks

Ansible <ruby>剧本<rt>playbook<rt></ruby> 就是包含 Ansible 指令的 YAML 格式的文件。我这里不打算讲解类似 Roles 和 Templates 这些比较高深的内容。有兴趣的话，请阅读 [Ansible 文档][6]。

在前一章节，我推荐你使用 `ssh-copy-id` 命令来传递你的 SSH 密钥；然而，本文关注于如何以一种一致的、可重复性的方式来完成任务。示例 4 演示了一种以冥等的方式，即使 SSH 密钥已经存在于目标主机上也能保证正确性的实现方法。

```
---
- hosts:all
  gather_facts:false
  vars:
    ssh_key:'/root/playbooks/files/laptop_ssh_key'
  tasks:
    - name:copy ssh key
      authorized_key:
        key:"{{ lookup('file'，ssh_key) }}"
        user:root
```

*示例 4：Ansible 剧本 “push_ssh_keys.yaml”*

`- hosts:` 行标识了这个剧本应该在那个主机组上执行。在这个例子中，它会检查库存清单里的所有主机。

`gather_facts:` 行指明 Ansible 是否去搜索每个主机的详细信息。我稍后会做一次更详细的检查。现在为了节省时间，我们设置 `gather_facts` 为 `false`。

`vars:` 部分，顾名思义，就是用来定义剧本中所用变量的。在示例 4 的这个简短剧本中其实不是必要的，但是按惯例我们还是设置了一个变量。

最后由 `tasks:` 标注的这个部分，是存放主体指令的地方。每个任务都有一个 `-name:`。Ansbile 在运行剧本时会显示这个名字。

`authorized_key:` 是剧本所使用 Ansible 模块的名字。可以通过命令 `ansible-doc -a` 来查询 Ansible 模块的相关信息； 不过通过网络浏览器查看 [文档 ][7] 可能更方便一些。[authorized_key 模块][8] 有很多很好的例子可以参考。要运行示例 4 中的剧本，只要运行 `ansible-playbook` 命令就行了：

```
ansible-playbook push_ssh_keys.yaml
```

如果是第一次添加 SSH 密钥，SSH 会提示你输入 root 用户的密码。

现在 SSH 密钥已经传输到服务器中去了，可以来做点有趣的事了。

### 使用 Ansible 收集信息

Ansible 能够收集目标系统的各种信息。如果你的主机数量很多，那它会特别的耗时。按我的经验，每台主机大概要花个 1 到 2 秒钟，甚至更长时间；然而有时收集信息是有好处的。考虑下面这个剧本，它会禁止 root 用户通过密码远程登录系统：

```
---
- hosts:all
  gather_facts:true
  vars:
  tasks:
    - name:Enabling ssh-key only root access
      lineinfile:
        dest:/etc/ssh/sshd_config
        regexp:'^PermitRootLogin'
        line:'PermitRootLogin without-password'
      notify:
        - restart_sshd
        - restart_ssh

  handlers:
    - name:restart_sshd
      service:
        name:sshd
        state:restarted
        enabled:true
      when:ansible_distribution == 'RedHat'
    - name:restart_ssh
      service:
        name:ssh
        state:restarted
        enabled:true
      when:ansible_distribution == 'Debian'
```

*示例 5：锁定 root 的 SSH 访问*

在示例 5 中 `sshd_config` 文件的修改是有[条件][9] 的，只有在找到匹配的发行版的情况下才会执行。在这个案例中，基于 Red Hat 的发行版与基于 Debian 的发行版对 SSH 服务的命名是不一样的，这也是使用条件语句的目的所在。虽然也有其他的方法可以达到相同的效果，但这个例子很好演示了 Ansible 信息的作用。若你想查看 Ansible 默认收集的所有信息，可以在本地运行 `setup` 模块：

```
ansible localhost -m setup |less
```

Ansible 收集的所有信息都能用来做判断，就跟示例 4 中 `vars:` 部分所演示的一样。所不同的是，Ansible 信息被看成是**内置** 变量，无需由系统管理员定义。

### 更近一步

现在可以开始探索 Ansible 并创建自己的基本了。Ansible 是一个富有深度、复杂性和灵活性的工具，只靠一篇文章不可能就把它讲透。希望本文能够激发你的兴趣，鼓励你去探索 Ansible 的功能。在下一篇文章中，我会再聊聊 `Copy`、`systemd`、`service`、`apt`、`yum`、`virt`，以及 `user` 模块。我们可以在剧本中组合使用这些模块，还可以创建一个简单的 Git 服务器来存储这些所有剧本。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/7/automate-sysadmin-ansible

作者：[Steve Ovens][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/stratusss
[1]:https://opensource.com/tags/ansible
[2]:http://docs.ansible.com/ansible/intro_installation.html
[3]:http://docs.ansible.com/ansible/intro_inventory.html
[4]:http://docs.ansible.com/ansible/playbooks_variables.html#information-discovered-from-systems-facts
[5]:http://docs.ansible.com/ansible/playbooks.html
[6]:http://docs.ansible.com/ansible/playbooks_roles.html
[7]:http://docs.ansible.com/ansible/modules_by_category.html
[8]:http://docs.ansible.com/ansible/authorized_key_module.html
[9]:http://docs.ansible.com/ansible/lineinfile_module.html
