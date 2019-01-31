如何使用 Ansible 管理你的工作站配置
======

> 在这个系列的第一篇中，学习一下管理笔记本电脑和台式机配置的基础内容。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_code_woman.png?itok=vbYz6jjb)

配置管理是服务器管理和 DevOps 的一个非常重要的方面。“<ruby>基础架构即代码<rt>infrastructure as code</rt></ruby>”方法可以轻松地以各种配置部署服务器，并动态扩展组织的资源以满足用户需求。但是，对于希望自动设置自己的笔记本电脑和台式机（工作站）的个人管理员的关注较少。

在本系列中，我将向你展示如何通过 [Ansible][1] 自动化你的工作站设置，如果你想要或需要重新安装你的机器，这可以让你轻松恢复整个配置。此外，如果你有多个工作站，则可以使用相同的方法在每个工作站上进行相同的配置。在第一篇文章中，我们将为个人或工作计算机设置基本的配置管理，并为本系列的其余部分奠定基础。到本文结束时，你将会因此得到一个可以工作的环境。本系列之后的每篇文章都会自动化更多内容并增加复杂性。

### 为什么用 Ansible？

有许多配置管理解决方案，包括 Salt Stack、Chef 和 Puppet。我更喜欢 Ansible，因为它在资源利用方面更轻量级，语法更容易阅读，并且如果正确使用它可以彻底改变你的配置管理。Ansible 的轻量级特性与这个主题特别相关，因为我们可能不希望运行一整台服务器而只是为了自动化我们的笔记本电脑和台式机的设置。一般我们总是想要快一些；我们可以使用某些东西来快速启动和运行，以在我们需要恢复的工作站或在多台机器之间同步我们的配置。我使用 Ansible 的具体方法（我将在本文中演示）非常适用于此，而不需要维护服务器。你只需下载配置并运行它。

### 我的方法

通常，Ansible 运行于中央服务器。它使用一个<ruby>库存清单<rt>inventory</rt></ruby>文件，该文件是一个文本文件，其中包含我们希望 Ansible 管理的所有主机及其 IP 地址或域名的列表。这对于静态环境非常有用，但对于工作站来说并不理想。原因是我们真的不知道我们的工作站在某一时刻的状态。也许我关闭了台式电脑，或者笔记本电脑可能会被挂起并放在我的包里。在任何一种情况下，Ansible 服务器都会抱怨，因为如果它们处于脱机状态，Ansible 就无法联系到我的机器。我们更需要的是按需方式，我们通过利用 `ansible-pull` 来实现这一目标。`ansible-pull` 命令是 Ansible 的一个命令，允许你从 Git 仓库下载配置并立即应用它。你不需要维护服务器或库存清单；你只需运行 `ansible-pull` 命令，给它一个 Git 仓库 URL，它将为你完成剩下的工作。

### 起步

首先，在要管理的计算机上安装 Ansible。有一个问题是许多发行版都附带了旧版本的 Ansible。根据经验，你肯定希望获得最新版本。Ansible 中经常引入新功能，如果你运行的是旧版本，则你在网上找到的示例语法可能无法正常运行，因为它使用的功能未在你安装的版本中实现。甚至发布的小版本都有很多新功能。其中一个例子是 `dconf` 模块，它是从 Ansible 2.4 开始的新功能。如果你尝试使用使用此模块的语法，除非你使用 2.4 或更新版本，否则会失败。在 Ubuntu 及其衍生产品中，我们可以使用官方个人包存档（[PPA][2]）轻松安装最新版本的 Ansible。以下命令可以解决这个问题：

```
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```

如果你没有使用 Ubuntu，请参阅 [Ansible 的文档][3] 了解如何为你的平台获取它。

接下来，我们需要一个 Git 仓库来保存我们的配置。满足此要求的最简单方法是在 GitHub 上创建一个空的仓库，或者如果有的话，也可以使用自己的 Git 服务器。为了简单起见，我假设你正在使用 GitHub，因此如果你正在使用其他仓库，请相应调整命令。在 GitHub 中创建一个仓库；你最终会得到一个与此类似的仓库 URL：

```
git@github.com:<your_user_name>/ansible.git
```

将该仓库克隆到你的本地工作目录（忽略任何抱怨仓库为空的消息）：

```
git clone git@github.com:<your_user_name>/ansible.git
```

现在我们有了一个可以使用的空仓库。将你的工作目录切换到仓库（例如 `cd ./ansible`），并在你喜欢的文本编辑器中创建名为 `local.yml` 的文件。将以下配置放在该文件中：

```
- hosts: localhost
  become: true
  tasks:
  - name: Install htop
    apt: name=htop
```

你刚刚创建的文件被称为<ruby>剧本<rt>playbook</rt></ruby>，安装 `htop` 的指令（我任意选择的一个包作为例子）被称为<ruby>动作<rt>play</rt></ruby>。剧本本身是一个 YAML 格式的文件，它是一种易于阅读的标记语言。对 YAML 的完整讲述超出了本文的范围，但你无需专业理解即可熟练使用 Ansible。该配置易于阅读；只需查看此文件，你就可以轻松理解我们正在安装的 `htop` 软件包。要注意一下最后一行的 `apt` 模块，它只适用于基于 Debian 的系统。如果你使用的是 Red Hat 平台，你可以将其更改为 `yum` 而不是 `apt`，或者如果你正在使用 Fedora，则将其更改为 `dnf`。`name` 行只是提供有关我们任务的信息，并将显示在输出中。因此，你需要确保名称具有描述性，以便在需要对多个动作进行故障排除时很容易找到。

接下来，让我们将新文件提交到我们的仓库：

```
git add local.yml
git commit -m "initial commit"
git push origin master
```

现在我们的新剧本应该出现在我们的 GitHub 上的仓库中。我们可以使用以下命令应用我们创建的剧本：

```
sudo ansible-pull -U https://github.com/<your_user_name>/ansible.git
```

如果执行正确，`htop`包应该会安装在你的系统上。你可能会在开头附近看到一些警告，抱怨缺少库存清单文件。这很好，因为我们没有使用库存清单文件（我们也不需要这样做）。在输出结束时，它将概述它做的内容。如果 `htop` 安装正确，你应该在输出的最后一行看到 `changed = 1`。

它是如何工作的呢？`ansible-pull` 命令使用了 `-U` 选项，它需要一个仓库 URL。出于安全考虑，我给它提供了仓库 URL 的 https 版本，因为我不希望任何主机对仓库具有写访问权限（默认情况下 https 是只读的）。`local.yml` 是预设的剧本名称，因此我们不需要为剧本提供文件名：如果它在仓库的根目录中找到名为 `local.yml` 的剧本，它将自动运行它。接下来，我们在命令前面使用了 `sudo`，因为我们正在修改系统。

让我们继续为我们的剧本添加更多的包。我将添加两个包，使它看起来像这样：

```
- hosts: localhost
  become: true
  tasks:
  - name: Install htop
    apt: name=htop

  - name: Install mc
    apt: name=mc
   
  - name: Install tmux
    apt: name=tmux
```

我添加了更多的动作（任务）来安装另外两个包，`mc` 和 `tmux`。在此剧本中选择安装的哪些软件包并不重要；我只是随意挑选这些。你应该安装你希望所有的系统都具有的软件包。唯一需要注意的是，在你分发前，你必须知道那个包存在于软件仓库中。

在我们提交并应用这个更新的剧本之前，我们应该整理一下它。它可以很好地工作，但（说实话）它看起来有点混乱。让我们尝试在一个动作中安装所有三个包。用下面这个替换你的 `local.yml` 的内容：

```
- hosts: localhost
  become: true
  tasks:
  - name: Install packages
    apt: name={{item}}
    with_items:
      - htop
      - mc
      - tmux
```

现在看起来更干净、更有效率了。我们使用 `with_items` 将我们的包列表合并为一个动作。如果我们想要添加其他包，我们只需添加另一个带有连字符和包名称的行。可以把 `with_items` 看做类似于 `for` 循环。我们列出的每个包都将安装。

将我们的新更改提交回仓库：

```
git add local.yml
git commit -m "added additional packages, cleaned up formatting"
git push origin master
```

现在我们可以运行我们的剧本以接受新的新配置：

```
sudo ansible-pull -U https://github.com/<your_user_name>/ansible.git
```

不可否认，这个例子还没有做多少事情；它所做的就是安装一些软件包。你可以使用包管理器更快地安装这些包。然而，随着这个系列的继续，这些例子将变得更加复杂，我们将自动化更多的东西。最后，你创建的 Ansible 配置将自动执行越来越多的任务。例如，我自己使用的那个配置可以自动安装数百个软件包、设置cron 作业、处理桌面配置等等。

从我们迄今为止所取得的成就来看，你可能已经有了大概了解。我们所要做的就是创建一个仓库，在该仓库中放置一个剧本，然后利用 `ansible-pull` 命令拉取该仓库并将其应用到我们的机器上。我们不需要设置服务器。将来，如果我们想要更改配置，我们可以拉取该仓库、更新它，然后将其推回到我们的仓库并应用它。如果我们要设置新机器，我们只需要安装 Ansible 并应用配置。

在下一篇文章中，我们将通过 cron 和一些其他项目进一步自动化。与此同时，我已将本文的代码复制到
[我的 GitHub 仓库][4] 中，以便你可以用你的语法对比一下我的。随着我们的进展，我会不断更新代码。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/manage-workstation-ansible

作者：[Jay LaCroix][a]
译者：[wxy](https://github.com/)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jlacroix
[1]:https://www.ansible.com/
[2]:https://launchpad.net/ubuntu/+ppas
[3]:http://docs.ansible.com/ansible/latest/intro_installation.html
[4]:https://github.com/jlacroix82/ansible_article
