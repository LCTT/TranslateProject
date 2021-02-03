[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13079-1.html"
[#]: subject: "My first day using Ansible"
[#]: via: "https://opensource.com/article/20/10/first-day-ansible"
[#]: author: "David Both https://opensource.com/users/dboth"

使用 Ansible 的第一天
======

> 一名系统管理员分享了如何使用 Ansible 在网络中配置计算机并把其带入实际工作的信息和建议。

![](https://img.linux.net.cn/data/attachment/album/202102/03/105826sn41jj0i8evu19nn.jpg)

无论是第一次还是第五十次，启动并运行一台新的物理或虚拟计算机都非常耗时，而且需要大量的工作。多年来，我一直使用我创建的一系列脚本和 RPM 来安装所需的软件包，并为我喜欢的工具配置各种选项。这种方法效果很好，简化了我的工作，而且还减少了在键盘上输入命令的时间。

我一直在寻找更好的工作方式。近几年来，我一直在听到并且读到有关 [Ansible][2] 的信息，它是一个自动配置和管理系统的强大工具。Ansible 允许系统管理员在一个或多个<ruby>剧本<rt>playbook</rt></ruby>中为每个主机指定一个特定状态，然后执行各种必要的任务，使主机进入该状态。这包括安装或删除各种资源，例如 RPM 或 Apt 软件包、配置文件和其它文件、用户、组等等。

因为一些琐事，我推迟了很长一段时间学习如何使用它。直到最近，我遇到了一个我认为 Ansible 可以轻松解决的问题。

这篇文章并不会完整地告诉你如何入门 Ansible，相反，它只是对我遇到的问题和我在一些隐秘的地方发现的信息的做了一些记录。我在各种在线讨论和问答小组中找到的有关 Ansible 的许多信息都是错误的。错误范围包括明显的老旧信息（没有任何日期或来源的迹象），还有一些是完全错误的信息。

本文所介绍的内容是有用的，尽管可能还有其它方法可以完成相同的事情，但我使用的是 Ansible 2.9.13 和 [Python][3] 3.8.5。

### 我的问题

我所有的最佳学习经历都始于我需要解决的问题，这次也不例外。

我一直在做一个小项目，修改 [Midnight Commander][4] 文件管理器的配置文件，并将它们推送到我网络上的各种系统中进行测试。尽管我有一个脚本可以自动执行这个操作，但它仍然需要使用命令行循环来提供我想要推送新代码的系统名称。我对配置文件进行了大量的更改，这使我必须频繁推送新的配置文件。但是，就在我以为我的新配置刚刚好时，我发现了一个问题，所以我需要在修复后再进行一次推送。

这种环境使得很难跟踪哪些系统有新文件，哪些没有。我还有几个主机需要区别对待。我对 Ansible 的一点了解表明，它可能能够满足我的全部或大部分工作。

### 开始

我读过许多有关 Ansible 的好文章和书籍，但从来没有在“我必须现在就把这个做好！”的情况下读过。而现在 —— 好吧，就是现在！

在重读这些文档时，我发现它们主要是在讨论如何从 GitHub 开始安装并使用 Ansible，这很酷。但是我真的只是想尽快开始，所以我使用 DNF 和 Fedora 仓库中的版本在我的 Fedora 工作站上安装了它，非常简单。

但是后来我开始寻找文件位置，并尝试确定需要修改哪些配置文件、将我的剧本保存在什么位置，甚至一个剧本怎么写以及它的作用，我脑海中有一大堆（到目前为止）悬而未决的问题。

因此，不不需要进一步描述我的困难的情况下，以下是我发现的东西以及促使我继续前进的东西。

### 配置

Ansible 的配置文件保存在 `/etc/ansible` 中，这很有道理，因为 `/etc/` 是系统程序应该保存配置文件的地方。我需要使用的两个文件是 `ansible.cfg` 和 `hosts`。

#### ansible.cfg

在进行了从文档和线上找到的一些实践练习之后，我遇到了一些有关弃用某些较旧的 Python 文件的警告信息。因此，我在 `ansible.cfg` 中将 `deprecation_warnings` 设置为 `false`，这样那些愤怒的红色警告消息就不会出现了：

```
deprecation_warnings = False
```

这些警告很重要，所以我稍后将重新回顾它们，并弄清楚我需要做什么。但是现在，它们不会再扰乱屏幕，也不会让我混淆实际上需要关注的错误。

#### hosts 文件

与 `/etc/hosts` 文件不同，`hosts` 文件也被称为<ruby>清单<rt>inventory</rt></ruby>文件，它列出了网络上的主机。此文件允许将主机分组到相关集合中，例如“servers”、“workstations”和任何你所需的名称。这个文件包含帮助和大量示例，所以我在这里就不详细介绍了。但是，有些事情你必须知道。

主机也可以列在组之外，但是组对于识别具有一个或多个共同特征的主机很有帮助。组使用 INI 格式，所以服务器组看起来像这样：

```
[servers]
server1
server2
......
```

这个文件中必须有一个主机名，这样 Ansible 才能对它进行操作。即使有些子命令允许指定主机名，但除非主机名在 `hosts` 文件中，否则命令会失败。一个主机也可以放在多个组中。因此，除了 `[servers]` 组之外，`server1` 也可能是 `[webservers]` 组的成员，还可以是 `[ubuntu]` 组的成员，这样以区别于 Fedora 服务器。

Ansible 很智能。如果 `all` 参数用作主机名，Ansible 会扫描 `hosts` 文件并在它列出的所有主机上执行定义的任务。Ansible 只会尝试在每个主机上工作一次，不管它出现在多少个组中。这也意味着不需要定义 `all` 组，因为 Ansible 可以确定文件中的所有主机名，并创建自己唯一的主机名列表。

另一件需要注意的事情是单个主机的多个条目。我在 DNS 文件中使用 `CNAME` 记录来创建别名，这些别名指向某些主机的 [A 记录][5]，这样，我可以将一个主机称为 `host1` 或 `h1` 或 `myhost`。如果你在 `hosts` 文件中为同一主机指定多个主机名，则 Ansible 将尝试在所有这些主机名上执行其任务，它无法知道它们指向同一主机。好消息是，这并不会影响整体结果；它只是多花了一点时间，因为 Ansible 会在次要主机名上工作，它会确定所有操作均已执行。

### Ansible 实情

我阅读过 Ansible 的大多数材料都谈到了 Ansible <ruby>[实情][6]<rt>facts</rt></ruby>，它是与远程系统相关的数据，包括操作系统、IP 地址、文件系统等等。这些信息可以通过其它方式获得，如 `lshw`、`dmidecode` 或 `/proc` 文件系统等。但是 Ansible 会生成一个包含此信息的 JSON 文件。每次 Ansible 运行时，它都会生成这些实情数据。在这个数据流中，有大量的信息，都是以键值对形式出现的：`<"variable-name": "value">`。所有这些变量都可以在 Ansible 剧本中使用，理解大量可用信息的最好方法是实际显示一下：

```
# ansible -m setup <hostname> | less
```

明白了吗？你想知道的有关主机硬件和 Linux 发行版的所有内容都在这里，它们都可以在剧本中使用。我还没有达到需要使用这些变量的地步，但是我相信在接下来的几天中会用到。

### 模块

上面的 `ansible` 命令使用 `-m` 选项来指定 `setup` 模块。Ansible 已经内置了许多模块，所以你对这些模块不需要使用 `-m`。也可以安装许多下载的模块，但是内置模块可以完成我目前项目所需的一切。

### 剧本

<ruby>剧本<rt>playbook</rt></ruby>几乎可以放在任何地方。因为我需要以 root 身份运行，所以我将它放在了 `/root/ansible` 下。当我运行 Ansible 时，只要这个目录是当前的工作目录（PWD），它就可以找到我的剧本。Ansible 还有一个选项，用于在运行时指定不同的剧本和位置。

剧本可以包含注释，但是我看到的文章或书籍很少提及此。但作为一个相信记录一切的系统管理员，我发现使用注释很有帮助。这并不是说在注释中做和任务名称同样的事情，而是要确定任务组的目的，并确保我以某种方式或顺序记录我做这些事情的原因。当我可能忘记最初的想法时，这可以帮助以后解决调试问题。

剧本只是定义主机所需状态的任务集合。在剧本的开头指定主机名或清单组，并定义 Ansible 将在其上运行剧本的主机。

以下是我的一个剧本示例：

```
################################################################################
# This Ansible playbook updates Midnight commander configuration files.        #
################################################################################
- name: Update midnight commander configuration files
  hosts: all
 
  tasks:
  - name: ensure midnight commander is the latest version
    dnf:
      name: mc
      state: present

  - name: create ~/.config/mc directory for root
    file:
      path: /root/.config/mc
      state: directory
      mode: 0755
      owner: root
      group: root

  - name: create ~/.config/mc directory for dboth
    file:
      path: /home/dboth/.config/mc
      state: directory
      mode: 0755
      owner: dboth
      group: dboth

  - name: copy latest personal skin
    copy:
      src: /root/ansible/UpdateMC/files/MidnightCommander/DavidsGoTar.ini
      dest: /usr/share/mc/skins/DavidsGoTar.ini
      mode: 0644
      owner: root
      group: root

  - name: copy latest mc ini file
    copy:
      src: /root/ansible/UpdateMC/files/MidnightCommander/ini
      dest: /root/.config/mc/ini
      mode: 0644
      owner: root
      group: root

  - name: copy latest mc panels.ini file
    copy:
      src: /root/ansible/UpdateMC/files/MidnightCommander/panels.ini
      dest: /root/.config/mc/panels.ini
      mode: 0644
      owner: root
      group: root
<截断>
```

剧本从它自己的名字和它将要操作的主机开始，在本文中，所有主机都在我的 `hosts` 文件中。`tasks` 部分列出了使主机达到所需状态的特定任务。这个剧本从使用 DNF 更新 Midnight Commander 开始（如果它不是最新的版本的话）。下一个任务确保创建所需的目录（如果它们不存在），其余任务将文件复制到合适的位置，这些 `file` 和 `copy` 任务还可以为目录和文件设置所有权和文件模式。

剧本细节超出了本文的范围，但是我对这个问题使用了一点蛮力。还有其它方法可以确定哪些用户需要更新文件，而不是对每个用户的每个文件使用一个任务。我的下一个目标是简化这个剧本，使用一些更先进的技术。

运行剧本很容易，只需要使用 `ansible-playbook` 命令。`.yml` 扩展名代表 YAML，我看到过它的几种不同含义，但我认为它是“<ruby>另一种标记语言<rt>Yet Another Markup Language</rt></ruby>”，尽管有些人声称 YAML 不是这种语言。

这个命令将会运行剧本，它会更新 Midnight Commander 文件：

```
# ansible-playbook -f 10 UpdateMC.yml
```

`-f` 选项指定 Ansible 使用 10 个线程来执行操作。这可以大大加快整个任务的完成速度，特别是在多台主机上工作时。

### 输出

剧本运行时会列出每个任务和执行结果。`ok` 代表任务管理的机器状态已经完成，因为在任务中定义的状态已经为真，所以 Ansible 不需要执行任何操作。

`changed` 表示 Ansible 已经执行了指定的任务。在这种情况下，任务中定义的机器状态不为真，所以执行指定的操作使其为真。在彩色终端上，`TASK` 行会以彩色显示。我的终端配色为“amber-on-black”，`TASK` 行显示为琥珀色，`changed` 是棕色，`ok` 为绿色，错误是红色。

下面的输出是我最终用于在新主机执行安装后配置的剧本：

```
PLAY [Post-installation updates, package installation, and configuration]

TASK [Gathering Facts]
ok: [testvm2]

TASK [Ensure we have connectivity]
ok: [testvm2]

TASK [Install all current updates]
changed: [testvm2]

TASK [Install a few command line tools]
changed: [testvm2]

TASK [copy latest personal Midnight Commander skin to /usr/share]
changed: [testvm2]

TASK [create ~/.config/mc directory for root]
changed: [testvm2]

TASK [Copy the most current Midnight Commander configuration files to /root/.config/mc]
changed: [testvm2] =&gt; (item=/root/ansible/PostInstallMain/files/MidnightCommander/DavidsGoTar.ini)
changed: [testvm2] =&gt; (item=/root/ansible/PostInstallMain/files/MidnightCommander/ini)
changed: [testvm2] =&gt; (item=/root/ansible/PostInstallMain/files/MidnightCommander/panels.ini)

TASK [create ~/.config/mc directory in /etc/skel]
changed: [testvm2]

<截断>
```

### cowsay

如果你的计算机上安装了 [cowsay][7] 程序，你会发现 `TASK` 的名字出现在奶牛的语音泡泡中：

```
 ____________________________________
< TASK [Ensure we have connectivity] >
 ------------------------------------
        \   ^__^
         \  (oo)\\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

如果你没有这个有趣的程序，你可以使用发行版的包管理器安装 Cowsay 程序。如果你有这个程序但不想要它，可以通过在 `/etc/ansible/ansible.cfg` 文件中设置 `nocows=1` 将其禁用。

我喜欢这头奶牛，它很有趣，但是它会占用我的一部分屏幕。因此，在它开始妨碍我使用时，我就把它禁用了。

### 目录

与我的 Midnight Commander 任务一样，经常需要安装和维护各种类型的文件。创建用于存储剧本的目录树的“最佳实践”和系统管理员一样多，至少与编写有关 Ansible 书和文章的作者数量一样多。

我选择了一个对我有意义的简单结构：

```bash
/root/ansible
└── UpdateMC
    ├── files
    │   └── MidnightCommander
    │       ├── DavidsGoTar.ini
    │       ├── ini
    │       └── panels.ini
    └── UpdateMC.yml
```

你可以使用任何结构。但是请注意，其它系统管理员可能需要使用你设置的剧本来工作，所以目录应该具有一定程度的逻辑。当我使用 RPM 和 Bash 脚本执行安装任务后，我的文件仓库有点分散，绝对没有任何逻辑结构。当我为许多管理任务创建剧本时，我将介绍一个更有逻辑的结构来管理我的目录。

### 多次运行剧本

根据需要或期望多次运行剧本是安全的。只有当主机状态与任务中指定的状态不匹配时，才会执行每个任务。这使得很容易从先前的剧本运行中遇到的错误中恢复。因为当剧本遇到错误时，它将停止运行。

在测试我的第一个剧本时，我犯了很多错误并改正了它们。假设我的修正正确，那么剧本每次运行，都会跳过那些状态已与指定状态匹配的任务，执行不匹配状态的任务。当我的修复程序起作用时，之前失败的任务就会成功完成，并且会执行此任务之后的任务 —— 直到遇到另一个错误。

这使得测试变得容易。我可以添加新任务，并且在运行剧本时，只有新任务会被执行，因为它们是唯一与测试主机期望状态不匹配的任务。

### 一些思考

有些任务不适合用 Ansible，因为有更好的方法可以实现特定的计算机状态。我想到的场景是使 VM 返回到初始状态，以便可以多次使用它来执行从已知状态开始的测试。让 VM 进入特定状态，然后对此时的计算机状态进行快照要容易得多。还原到该快照与 Ansible 将主机返回到之前状态相比，通常还原到快照通常会更容易且更快。在研究文章或测试新代码时，我每天都会做几次这样的事情。

在完成用于更新 Midnight Commander 的剧本之后，我创建了一个新的剧本，用于在新安装的 Fedora 主机上执行安装任务。我已经取得了不错的进步，剧本比我第一个的更加复杂，但没有那么粗暴。

在使用 Ansible 的第一天，我创建了一个解决问题的剧本，我还开始编写第二个剧本，它将解决安装后配置的大问题，在这个过程中我学到了很多东西。

尽管我真的很喜欢使用 [Bash][8] 脚本来管理任务，但是我发现 Ansible 可以完成我想要的一切，并且可以使系统保持在我所需的状态。只用了一天，我就成为了 Ansible 的粉丝。

### 资源

我找到的最完整、最有用的参考文档是 Ansible 网站上的[用户指南][9]。本文仅供参考，不作为入门文档。

多年来，我们已经发布了许多[有关 Ansible 的文章][10]，我发现其中大多数对我的需求很有帮助。Enable Sysadmin 网站上也有很多对我有帮助 [Ansible 文章][11]。你可以通过查看本周（2020 年 10 月 13 日至 14 日）的 [AnsibleFest][12] 了解更多信息。该活动完全是线上的，可以免费注册。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/first-day-ansible

作者：[David Both][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux11x_cc.png?itok=XMDOouJR "People work on a computer server with devices"
[2]: https://www.ansible.com/
[3]: https://www.python.org/
[4]: https://midnight-commander.org/
[5]: https://en.wikipedia.org/wiki/List_of_DNS_record_types
[6]: https://docs.ansible.com/ansible/latest/user_guide/playbooks_vars_facts.html#ansible-facts
[7]: https://en.wikipedia.org/wiki/Cowsay
[8]: https://opensource.com/downloads/bash-cheat-sheet
[9]: https://docs.ansible.com/ansible/latest/user_guide/index.html
[10]: https://opensource.com/tags/ansible
[11]: https://www.redhat.com/sysadmin/topics/ansible
[12]: https://www.ansible.com/ansiblefest
