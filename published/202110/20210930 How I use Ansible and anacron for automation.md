[#]: subject: "How I use Ansible and anacron for automation"
[#]: via: "https://opensource.com/article/21/9/ansible-anacron-automation"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13879-1.html"

我如何使用 Ansible 和 anacron 实现自动化
======

> 有了 anacron，我可以把脚本和 Ansible 剧本放到合适的地方，以完成各种琐碎的任务。

![](https://img.linux.net.cn/data/attachment/album/202110/13/155036tc0c7th906cc96mm.jpg)

自动化是伟大的 IT 和 DevOps 理想，但根据我的经验，可能根本不存在什么不方便的东西。有很多次，我为某些任务想出了一个很好的解决方案，我甚至会编写脚本，但我没有让它真正实现自动化，因为在我工作的机器上不存在易于自动化的基础设施。

我最喜欢的简易自动化工具曾经是 cron 系统，它古老、可靠、面向用户，而且简单（除了一个我永远无法记住的调度语法之外）。然而，cron 的问题是，它假定一台电脑每天 24 小时都在工作。在错过了太多预定的备份之后，我发现了 [anacron][2]，一个基于时间戳而非预定时间的 cron 系统。如果你的电脑在通常情况下运行时处于关闭状态，anacron 会确保它在电脑重新开启时运行。创建一个作业只需要简单地把一个 shell 脚本放到三个目录中：`cron.day`、`cron.weekly` 或者 `cron.monthly` （如果你想的话，你可以定义更多）。有了 anacron，我发现自己把脚本和 Ansible 剧本用在了各种琐碎的任务中，包括弹出到期和事件提醒。

这是一个现代问题的简单而明显的解决方案，但如果 anacron 没有安装在电脑上，那它对我就没有用。

### 用 Ansible 进行软件设置

任何时候我设置一台新的计算机，无论是笔记本电脑、工作站还是服务器，我都会安装 anacron。这很简单，但是 anacron 的安装只提供了 `anacron` 命令。它并没有设置 anacron 的用户环境。所以我创建了一个 Ansible 剧本来设置用户需要什么来使用 anacron 并安装 `anacron` 命令。

首先，标准的 Ansible 模板：

```
---
- hosts: localhost
  tasks:
```

### 用 Ansible 创建目录

接下来，我创建了用于 Anacron 的目录树。你可以把它看成是一种透明的 crontab。

```
    - name: create directory tree
      ansible.builtin.file:
        path: "{{ item }}"
        state: directory
      with_items:
        - '~/.local/etc/cron.daily'
        - '~/.local/etc/cron.weekly'
        - '~/.local/etc/cron.monthly'
        - '~/.var/spool/anacron'
```

这个语法可能看起来有点奇怪，但它实际上是一个循环。`with_items:` 指令定义了四个要创建的目录，Ansible 在 `ansible.buildin.file:` 指令中为每个目录迭代一次（目录名填充了 `{{ item }}` 变量）。与 Ansible 中的一切一样，如果目录已经存在，不会有错误或冲突。

### 用 Ansible 复制文件

`ansible.buildin.copy` 模块将文件从一个地方复制到另一个地方。为了让它工作，我需要创建一个叫做 `anacrontab` 的文件。它不是 Ansible 剧本，所以我把它放在我的 `~/Ansible/data` 目录下，那里是我的剧本的支持文件。

```
  - name: copy anacrontab into place
   ansible.builtin.copy:
    src: ~/Ansible/data/anacrontab
    dest: ~/.local/etc/anacrontab
    mode: '0755'
```

我的 `anacrontab` 文件很简单，模仿了一些发行版默认安装在 `/etc/anacron` 中的文件：

```
SHELL=/bin/sh
PATH=/sbin:/bin:/usr/sbin:/usr/bin
1  0  cron.day    run-parts $HOME/.local/etc/cron.daily/
7  0  cron.wek    run-parts $HOME/.local/etc/cron.weekly/
30 0  cron.mon    run-parts $HOME/.local/etc/cron.monthly/
```

### 登录时运行 anacron

大多数 Linux 发行版将 anacron 配置为从 `/etc/anacron` 读取作业。我主要是作为一个普通用户使用 anacron，所以我从我的登录账号 `~/.profile` 启动 anacron。我不想让自己记住这些配置，所以我让 Ansible 来做。我使用 `ansible.buildin.lineinfile` 模块，它会在 `~/.profile` 不存在时创建它，并插入 anacron 的启动行。

```
    - name: add local anacrontab to .profile
      ansible.builtin.lineinfile:
        path: ~/.profile
        regexp: '^/usr/sbin/anacron'
        line: '/usr/sbin/anacron -t ~/.local/etc/anacrontab'
        create: true
```

### 用 Ansible 安装 anacron

对于我的大多数系统来说，`dnf` 模块可以用来安装软件包，但我的工作站运行的是 Slackware（使用 `slackpkg`），有时不同的 Linux 发行版也会进入我的收藏。`ansible.buildin.package` 模块提供了一个安装软件包的通用接口，所以我把它用在这个剧本上。幸运的是，我还没有遇到一个名为 `anacron` 的仓库不是 `anacron`，所以现在，我不必考虑软件包名称的潜在差异。

这实际上是一个单独的剧本，因为软件包的安装需要权限升级，它由 `becomes: true` 指令提供。

```
- hosts: localhost
  become: true
  tasks:
    - name: install anacron
      ansible.builtin.package:
        name: anacron
        state: present
```

### 使用 anacron 和 Ansible 实现轻松自动化

为了用 Ansible 安装 anacron，我运行该剧本：

```
$ ansible-playbook ~/Ansible/setup-anacron.yaml
```

从此，我就可以编写 shell 脚本来执行一些琐碎但重复的任务，然后把它复制到 `~/.local/etc/cron.daily`，让它每天自动运行一次（或者大约如此）。我还为诸如 [清理下载文件夹][3] 之类的任务编写了 Ansible 剧本。我把我的剧本放在 `~/Ansible` 里，这是我保存 Ansible 剧本的地方，然后在 `~/.local/etc/cron.daily` 里创建一个 shell 脚本来执行这个剧本。这很简单，不费吹灰之力，而且很快成为习惯。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/ansible-anacron-automation

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (Woman programming)
[2]: https://opensource.com/article/21/2/linux-automation
[3]: https://opensource.com/article/21/9/keep-folders-tidy-ansible
