[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13163-1.html"
[#]: subject: "Ansible Ad-hoc Command Quick Start Guide with Examples"
[#]: via: "https://www.2daygeek.com/ansible-ad-hoc-command-quick-start-guide-with-examples/"
[#]: author: "Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/"

Ansible 点对点命令快速入门指南示例
======

![](https://img.linux.net.cn/data/attachment/album/202102/28/221449b8ldh7v4ll8dw774.jpg)

之前，我们写了一篇有关 [Ansible 安装和配置][1] 的文章。在那个教程中只包含了一些使用方法的示例。如果你是 Ansible 新手，建议你阅读上篇文章。一旦你熟悉了，就可以继续阅读本文了。

默认情况下，Ansible 仅使用 5 个并行进程。如果要在多个主机上执行任务，需要通过添加 `-f [进程数]` 选项来手动设置进程数。

### 什么是<ruby>点对点<rt>ad-hoc</rt></ruby>命令？ 

点对点命令用于在一个或多个受控节点上自动执行任务。它非常简单，但是不可重用。它使用 `/usr/bin/ansible` 二进制文件执行所有操作。

点对点命令最适合运行一次的任务。例如，如果要检查指定用户是否可用，你可以使用一行命令而无需编写剧本。

#### 为什么你要了解点对点命令？

点对点命令证明了 Ansible 的简单性和强大功能。从 2.9 版本开始，它支持 3389 个模块，因此你需要了解和学习要定期使用的 Ansible 模块列表。

如果你是一个 Ansible 新手，可以借助点对点命令轻松地练习这些模块及参数。

你在这里学习到的概念将直接移植到剧本中。

**点对点命令的一般语法：**

```
ansible [模式] -m [模块] -a "[模块选项]"
```

点对点命令包含四个部分，详细信息如下：

|    部分   |           描述                    |
|----------|-----------------------------------|
| `ansible`| 命令                               |
| 模式      | 输入清单或指定组                    |
| 模块      | 运行指定的模块名称                  |
| 模块选项   | 指定模块参数                       |

#### 如何使用 Ansible 清单文件

如果使用 Ansible 的默认清单文件 `/etc/ansible/hosts`，你可以直接调用它。否则你可以使用 `-i` 选项指定 Ansible 清单文件的路径。

#### 什么是模式以及如何使用它？

Ansible 模式可以代指某个主机、IP 地址、清单组、一组主机或者清单中的所有主机。它允许你对它们运行命令和剧本。模式非常灵活，你可以根据需要使用它们。

例如，你可以排除主机、使用通配符或正则表达式等等。

下表描述了常见的模式以及用法。但是，如果它不能满足你的需求，你可以在 `ansible-playbook` 中使用带有 `-e` 参数的模式中的变量。

| 描述 | 模式 | 目标 |
|-----|------|-----|
| 所有主机 | `all`（或 `*`） | 对清单中的所有服务器运行 Ansible |
| 一台主机 | `host1` | 只针对给定主机运行 Ansible |
| 多台主机 | `host1:host2`（或 `host1,host2`）| 对上述多台主机运行 Ansible |
| 一组 | `webservers` | 在 `webservers` 群组中运行 Ansible |
| 多组 | `webservers:dbservers` | `webservers` 中的所有主机加上 `dbservers` 中的所有主机 |
| 排除组 | `webservers:!atlanta` | `webservers` 中除 `atlanta` 以外的所有主机 |
| 组之间的交集 | `webservers:&staging` | `webservers` 中也在 `staging` 的任何主机 |

#### 什么是 Ansible 模块，它干了什么？

模块，也称为“任务插件”或“库插件”，它是一组代码单元，可以直接或通过剧本在远程主机上执行指定任务。

Ansible 在远程目标节点上执行指定模块并收集其返回值。

每个模块都支持多个参数，可以满足用户的需求。除少数模块外，几乎所有模块都采用 `key=value` 参数。你可以一次添加带有空格的多个参数，而 `command` 或 `shell` 模块会直接运行你输入的字符串。

我们将添加一个包含最常用的“模块选项”参数的表。

列出所有可用的模块，运行以下命令：

```
$ ansible-doc -l
```

运行以下命令来阅读指定模块的文档：

```
$ ansible-doc [模块]
```

### 1）如何在 Linux 上使用 Ansible 列出目录的内容

可以使用 Ansible `command` 模块来完成这项操作，如下所示。我们列出了 `node1.2g.lab` 和 `nod2.2g.lab`* 远程服务器上 `daygeek` 用户主目录的内容。

```
$ ansible web -m command -a "ls -lh /home/daygeek"

node1.2g.lab | CHANGED | rc=0 >>
total 12K
drwxr-xr-x. 2 daygeek daygeek   6 Feb 15  2019 Desktop
drwxr-xr-x. 2 daygeek daygeek   6 Feb 15  2019 Documents
drwxr-xr-x. 2 daygeek daygeek   6 Feb 15  2019 Downloads
drwxr-xr-x. 2 daygeek daygeek   6 Feb 15  2019 Music
-rwxr-xr-x. 1 daygeek daygeek 159 Mar  4  2019 passwd-up.sh
drwxr-xr-x. 2 daygeek daygeek   6 Feb 15  2019 Pictures
drwxr-xr-x. 2 daygeek daygeek   6 Feb 15  2019 Public
drwxr-xr-x. 2 daygeek daygeek   6 Feb 15  2019 Templates
-rwxrwxr-x. 1 daygeek daygeek 138 Mar 10  2019 user-add.sh
-rw-rw-r--. 1 daygeek daygeek  18 Mar 10  2019 user-list1.txt
drwxr-xr-x. 2 daygeek daygeek   6 Feb 15  2019 Videos

node2.2g.lab | CHANGED | rc=0 >>
total 0
drwxr-xr-x. 2 daygeek daygeek 6 Nov  9 09:55 Desktop
drwxr-xr-x. 2 daygeek daygeek 6 Nov  9 09:55 Documents
drwxr-xr-x. 2 daygeek daygeek 6 Nov  9 09:55 Downloads
drwxr-xr-x. 2 daygeek daygeek 6 Nov  9 09:55 Music
drwxr-xr-x. 2 daygeek daygeek 6 Nov  9 09:55 Pictures
drwxr-xr-x. 2 daygeek daygeek 6 Nov  9 09:55 Public
drwxr-xr-x. 2 daygeek daygeek 6 Nov  9 09:55 Templates
drwxr-xr-x. 2 daygeek daygeek 6 Nov  9 09:55 Videos
```

### 2）如何在 Linux 使用 Ansible 管理文件

Ansible 的 `copy` 模块将文件从本地系统复制到远程系统。使用 Ansible `command` 模块将文件移动或复制到远程计算机。

```
$ ansible web -m copy -a "src=/home/daygeek/backup/CentOS7.2daygeek.com-20191025.tar dest=/home/u1" --become

node1.2g.lab | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "checksum": "ad8aadc0542028676b5fe34c94347829f0485a8c",
    "dest": "/home/u1/CentOS7.2daygeek.com-20191025.tar",
    "gid": 0,
    "group": "root",
    "md5sum": "ee8e778646e00456a4cedd5fd6458cf5",
    "mode": "0644",
    "owner": "root",
    "secontext": "unconfined_u:object_r:user_home_t:s0",
    "size": 30720,
    "src": "/home/daygeek/.ansible/tmp/ansible-tmp-1579726582.474042-118186643704900/source",
    "state": "file",
    "uid": 0
}

node2.2g.lab | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": true,
    "checksum": "ad8aadc0542028676b5fe34c94347829f0485a8c",
    "dest": "/home/u1/CentOS7.2daygeek.com-20191025.tar",
    "gid": 0,
    "group": "root",
    "md5sum": "ee8e778646e00456a4cedd5fd6458cf5",
    "mode": "0644",
    "owner": "root",
    "secontext": "unconfined_u:object_r:user_home_t:s0",
    "size": 30720,
    "src": "/home/daygeek/.ansible/tmp/ansible-tmp-1579726582.4793239-237229399335623/source",
    "state": "file",
    "uid": 0
}
```

我们可以运行以下命令进行验证：

```
$ ansible web -m command -a "ls -lh /home/u1" --become

node1.2g.lab | CHANGED | rc=0 >>
total 36K
-rw-r--r--. 1 root root 30K Jan 22 14:56 CentOS7.2daygeek.com-20191025.tar
-rw-r--r--. 1 root root  25 Dec  9 03:31 user-add.sh

node2.2g.lab | CHANGED | rc=0 >>
total 36K
-rw-r--r--. 1 root root 30K Jan 23 02:26 CentOS7.2daygeek.com-20191025.tar
-rw-rw-r--. 1 u1   u1    18 Jan 23 02:21 magi.txt
```

要将文件从一个位置复制到远程计算机上的另一个位置，使用以下命令：

```
$ ansible web -m command -a "cp /home/u2/magi/ansible-1.txt /home/u2/magi/2g" --become
```

移动文件，使用以下命令：

```
$ ansible web -m command -a "mv /home/u2/magi/ansible.txt /home/u2/magi/2g" --become
```

在 `u1` 用户目录下创建一个名为 `ansible.txt` 的新文件，运行以下命令：

```
$ ansible web -m file -a "dest=/home/u1/ansible.txt owner=u1 group=u1 state=touch" --become
```

在 `u1` 用户目录下创建一个名为 `magi` 的新目录，运行以下命令：

```
$ ansible web -m file -a "dest=/home/u1/magi mode=755 owner=u2 group=u2 state=directory" --become
```

将 `u1` 用户目录下的 `ansible.txt`* 文件权限更改为 `777`，运行以下命令：

```
$ ansible web -m file -a "dest=/home/u1/ansible.txt mode=777" --become
```

删除 `u1` 用户目录下的 `ansible.txt` 文件，运行以下命令：

```
$ ansible web -m file -a "dest=/home/u2/magi/ansible-1.txt state=absent" --become
```

使用以下命令删除目录，它将递归删除指定目录：

```
$ ansible web -m file -a "dest=/home/u2/magi/2g state=absent" --become
```

### 3）用户管理

你可以使用 Ansible 轻松执行用户管理活动。例如创建、删除用户以及向一个组添加用户。

```
$ ansible all -m user -a "name=foo password=[crypted password here]"
```

运行以下命令删除用户：

```
$ ansible all -m user -a "name=foo state=absent"
```

### 4）管理包

使用合适的 Ansible 包管理器模块可以轻松地管理安装包。例如，我们将使用 `yum` 模块来管理 CentOS 系统上的软件包。

安装最新的 Apache（httpd）：

```
$ ansible web -m yum -a "name=httpd state=latest"
```

卸载 Apache（httpd） 包：

```
$ ansible web -m yum -a "name=httpd state=absent"
```

### 5）管理服务

使用以下 Ansible 模块命令可以在 Linux 上管理任何服务。

停止 httpd 服务：

```
$ ansible web -m service -a "name=httpd state=stopped"
```

启动 httpd 服务：

```
$ ansible web -m service -a "name=httpd state=started"
```

重启 httpd 服务：

```
$ ansible web -m service -a "name=httpd state=restarted"
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/ansible-ad-hoc-command-quick-start-guide-with-examples/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-13142-1.html
