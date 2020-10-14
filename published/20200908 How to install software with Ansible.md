[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12703-1.html)
[#]: subject: (How to install software with Ansible)
[#]: via: (https://opensource.com/article/20/9/install-packages-ansible)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

如何使用 Ansible 安装软件
======

> 使用 Ansible 剧本自动安装和更新设备上的软件。

![](https://img.linux.net.cn/data/attachment/album/202010/10/095024hh65atkh6cc8ntn9.jpg)

Ansible 是系统管理员和开发人员用来保持计算机系统处于最佳状态的一种流行的自动化工具。与可扩展框架一样，[Ansible][2] 本身功能有限，它真正的功能体现在许多模块中。在某种程度上，Ansible 模块就是 [Linux][3] 系统的命令。它们针对特定问题提供解决方案，而维护计算机时的一项常见任务是使所有计算机的更新和一致。

我曾经使用软件包的文本列表来保持系统或多或少的同步：我会列出笔记本电脑上安装的软件包，然后将其与台式机或另一台服务器之间进行交叉参考，手动弥补差异。当然，在 Linux 机器上安装和维护应用程序是 Ansible 的一项基本功能，这意味着你可以在自己关心的计算机上列出所需的内容。

### 寻找正确的 Ansible 模块

Ansible 模块的数量非常庞大，如何找到能完成你任务的模块？在 Linux 中，你可以在应用程序菜单或 `/usr/bin` 中查找要运行的应用程序。使用 Ansible 时，你可以参考 [Ansible 模块索引][4]。

这个索引按照类别列出。稍加搜索，你就很可能找到所需的模块。对于包管理，[Packaging 模块][5]几乎适用于所有带包管理器的系统。

### 动手写一个 Ansible 剧本

首先，选择本地计算机上的包管理器。例如，如果你打算在运行 Fedora 的笔记本电脑上编写 Ansible 指令（在 Ansible 中称为“<ruby>剧本<rt>playbook</rt></ruby>”），那么从 `dnf` 模块开始。如果你在 Elementary OS 上编写，使用 `apt` 模块，以此类推。这样你就可以开始进行测试和验证，并可以在以后扩展到其它计算机。

第一步是创建一个代表你的剧本的目录。这不是绝对必要的，但这是一个好习惯。Ansible 只需要一个配置文件就可以运行在 YAML 中，但是如果你以后想要扩展剧本，你就可以通过改变目录和文件的方式来控制 Ansible。现在，只需创建一个名为 `install_packages` 或类似的目录：

```
$ mkdir ~/install_packages
```

你可以根据自己的喜好来命名 Ansible 的剧本，但通常将其命名为 `site.yml`：

```
$ touch ~/install_packages/site.yml
```

在你最喜欢的文本编辑器中打开 `site.yml`，添加以下内容：

```
---
- hosts: localhost
  tasks:
    - name: install packages
      become: true
      become_user: root
      dnf:
        state: present
        name:
         - tcsh
         - htop
```

你必须调整使用的模块名称以匹配你使用的发行版。在此示例中，我使用 `dnf` 是因为我在 Fedora Linux 上编写剧本。

就像 Linux 终端中的命令一样，知道 **如何** 来调用 Ansible 模块就已经成功了一半。这个示例剧本遵循标准剧本格式：

  * `hosts` 是一台或多台计算机。在本示例中，目标计算机是 `localhost`，即你当前正在使用的计算机（而不是你希望 Ansible 连接的远程系统）。
  * `tasks` 是你要在主机上执行的任务列表。
    * `name` 是任务的人性化名称。在这种情况下，我使用 `install packages`，因为这就是该任务正在做的事情。
    * `become` 允许 Ansible 更改运行此任务的用户。
    * `become_user` 允许 Ansible 成为 `root` 用户来运行此任务。这是必须的，因为只有 root 用户才能使用 `dnf` 安装应用程序。
    * `dnf` 是模块名称，你可以在 Ansible 网站上的模块索引中找到。

`dnf` 下的节点是 `dnf` 模块专用的。这是模块文档的关键所在。就像 Linux 命令的手册页一样，模块文档会告诉你可用的选项和所需的参数。

![Ansible 文档][6]

安装软件包是一个相对简单的任务，仅需要两个元素。`state` 选项指示 Ansible 检查系统上是否存在 **软件包**，而 `name` 选项列出要查找的软件包。Ansible 会针对机器的 **状态** 进行调整，因此模块指令始终意味着更改。假如 Ansible 扫描了系统状态，发现剧本里描述的系统（在本例中，`tcsh` 和 `htop` 存在）与实际状态存在冲突，那么 Ansible 的任务是进行必要的更改来使系统与剧本匹配。Ansible 可以通过 `dnf`（或 `apt` 或者其它任何包管理器）模块进行更改。

每个模块可能都有一组不同的选项，所以在编写剧本时，要经常参考模块文档。除非你对模块非常熟悉，否则这是期望模块完成工作的唯一合理方法。

### 验证 YAML

剧本是用 YAML 编写的。因为 YAML 遵循严格的语法，所以安装 `yamllint` 来检查剧本是很有帮助的。更妙的是，有一个专门针对 Ansible 的检查工具称为 `ansible-lint`，它专门为剧本而生。在继续之前，安装它。

在 Fedora 或 CentOs 上：

```
$ sudo dnf ins tall yamllint python3-ansible-lint
```

在 Debian、Elementary 或 Ubuntu 上，同样的：

```
$ sudo apt install yamllint ansible-lint
```

使用 `ansible-link` 来验证你的剧本。如果你无法使用 `ansible-lint`，你可以使用 `yamllint`。

```
$ ansible-lint ~/install_packages/site.yml
```

成功则不返回任何内容，但如果文件中有错误，则必须先修复它们，然后再继续。复制和粘贴过程中的常见错误包括在最后一行的末尾省略换行符、使用制表符而不是空格来缩进。在文本编辑器中修复它们，重新运行 `ansible-lint`，重复这个过程，直到 `ansible-lint` 或 `yamllint` 没有返回为止。

### 使用 Ansible 安装一个应用

现在你有了一个可验证的有效剧本，你终于可以在本地计算机上运行它了，因为你碰巧知道该剧本定义的任务需要 root 权限，所以在调用 Ansible 时必须使用 `--ask-become-pass` 选项，因此系统会提示你输入管理员密码。

开始安装：

```
$ ansible-playbook --ask-become-pass ~/install_packages/site.yml
BECOME password:
PLAY [localhost] ******************************

TASK [Gathering Facts] ******************************
ok: [localhost]

TASK [install packages] ******************************
ok: [localhost]

PLAY RECAP ******************************
localhost: ok=0 changed=2 unreachable=0 failed=0 [...]
```

这些命令被执行后，目标系统将处于与剧本中描述的相同的状态。

### 在远程系统上安装应用程序

通过这么多操作来替换一个简单的命令可能会适得其反，但是 Ansible 的优势是它可以在你的所有系统中实现自动化。你可以使用条件语句使 Ansible 在不同的系统上使用特定的模块，但是现在，假定所有计算机都使用相同的包管理器。

要连接到远程系统，你必须在 `/etc/ansible/hosts` 文件中定义远程系统，该文件与 Ansible 是一起安装的，所以它已经存在了，但它可能是空的，除了一些解释性注释之外。使用 `sudo` 在你喜欢的文本编辑器中打开它。

你可以通过其 IP 地址或主机名（只要主机名可以解析）定义主机。例如，如果你已经在 `/etc/hosts` 中定义了 `liavara` 并可以成功 `ping` 通，那么你可以在 `/etc/ansible/hosts` 中将 `liavara` 设置为主机。或者，如果你正在运行一个域名服务器或 Avahi 服务器并且可以 `ping` 通 `liavara`，那么你就可以在 `/etc/ansible/hosts` 中定义它。否则，你必须使用它的 IP 地址。

你还必须成功地建立与目标主机的安全 shell（SSH）连接。最简单的方法是使用 `ssh-copy-id` 命令，但是如果你以前从未与主机建立 SSH 连接，[阅读我关于如何创建自动 SSH 连接的文章][8]。

一旦你在 `/etc/ansible/hosts` 文件中输入了主机名或 IP 地址后，你就可以在剧本中更改 `hosts` 定义：

```
---
- hosts: all
  tasks:
    - name: install packages
      become: true
      become_user: root
      dnf:
        state: present
        name:
         - tcsh
         - htop
```

再次运行 `ansible-playbook`：

```
$ ansible-playbook --ask-become-pass ~/install_packages/site.yml
```

这次，剧本会在你的远程系统上运行。

如果你添加更多主机，则有许多方法可以过滤哪个主机执行哪个任务。例如，你可以创建主机组（服务器的 `webserves`，台式机的 `workstations`等）。

### 适用于混合环境的 Ansible

到目前为止，我们一直假定 Ansible 配置的所有主机都运行相同的操作系统（都是是使用 `dnf` 命令进行程序包管理的操作系统）。那么，如果你要管理不同发行版的主机，例如 Ubuntu（使用 `apt`）或 Arch（使用 `pacman`），或者其它的操作系统时，该怎么办？

只要目标操作系统具有程序包管理器（[MacOs 有 Homebrew][9]，[Windows 有 Chocolatey][10]），Ansible 就能派上用场。

这就是 Ansible 优势最明显的地方。在 shell 脚本中，你必须检查目标主机上有哪些可用的包管理器，即使使用纯 Python，也必须检查操作系统。Ansible 不仅内置了这些功能，而且还具有在剧本中使用命令结果的机制。你可以使用 `action` 关键字来执行由 Ansible 事实收集子系统提供的变量定义的任务，而不是使用 `dnf` 模块。

```
---
- hosts: all
  tasks:
    - name: install packages
      become: true
      become_user: root
      action: >
       {{ ansible_pkg_mgr }} name=htop,transmission state=present update_cache=yes
```

`action` 关键字会加载目标插件。在本例中，它使用了 `ansible_pkg_mgr` 变量，该变量由 Ansible 在初始 **收集信息** 期间填充。你不需要告诉 Ansible 收集有关其运行操作系统的事实，所以很容易忽略这一点，但是当你运行一个剧本时，你会在默认输出中看到它：

```
TASK [Gathering Facts] *****************************************
ok: [localhost]
```

`action` 插件使用来自这个探针的信息，使用相关的包管理器命令填充 `ansible_pkg_mgr`，以安装在 `name` 参数之后列出的程序包。使用 8 行代码，你可以克服在其它脚本选项中很少允许的复杂跨平台难题。

### 使用 Ansible

现在是 21 世纪，我们都希望我们的计算机设备能够互联并且相对一致。无论你维护的是两台还是 200 台计算机，你都不必一次又一次地执行相同的维护任务。使用 Ansible 来同步生活中的计算机设备，看看 Ansible 还能为你做些什么。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/install-packages-ansible

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://opensource.com/resources/what-ansible
[3]: https://opensource.com/resources/linux
[4]: https://docs.ansible.com/ansible/latest/modules/modules_by_category.html
[5]: https://docs.ansible.com/ansible/latest/modules/list_of_packaging_modules.html
[6]: https://opensource.com/sites/default/files/uploads/ansible-module.png (Ansible documentation)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/article/20/8/how-ssh
[9]: https://opensource.com/article/20/6/homebrew-mac
[10]: https://opensource.com/article/20/3/chocolatey
