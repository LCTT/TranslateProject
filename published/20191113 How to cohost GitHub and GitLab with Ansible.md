[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11735-1.html)
[#]: subject: (How to cohost GitHub and GitLab with Ansible)
[#]: via: (https://opensource.com/article/19/11/how-host-github-gitlab-ansible)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

如何使用 Ansible 同步 GitHub 和 GitLab
======

> 通过使用 Ansible 镜像 Git 存储库，保护对重要项目的访问。

![](https://img.linux.net.cn/data/attachment/album/202001/01/104040fbdu68wosg8o99wg.jpg)

开源无处不在。它在家里的计算机上、在工作场所的计算机上、在互联网上，并且很多都由 [Git][2] 管理。由于 Git 是分布式的，因此许多人也将其视为一种众包的备份解决方案。从理论上讲，每当有人将 Git 存储库克隆到其本地计算机时，他们就创建了该项目源代码的备份。如果有 100 个人这样做，则存储库就有 100 个备份副本。

从理论上讲，这可以缓解“灾难”的影响，例如当项目维护者[突然决定删除存储库][3]或[莫名其妙地阻止所有流量][4]，导致开发人员们无头苍蝇般地寻找谁拥有主分支的最新版本。类似的，整个代码托管站点也会消失。没有人会想到 Google Code、Microsoft CodePlex 或 Gitorious 会在鼎盛时期将被关闭。

简而言之，如果在过去的几十年中互联网教给了我们一些东西，那就是依靠互联网神奇地创建备份并不是冗余的最可靠途径。

此外，对于许多人来说，很多开源项目都托管在 GitHub 上是个问题 —— GitHub 并不是开放平台。许多开发人员和用户都希望支持诸如 GitLab 之类的堆栈并与之交互，它具有开源社区版本。

### 使用 Ansible 管理 Git

Git 的去中心方式对于解决这个问题很有用。使用纯 Git，你可以使用一个 `push` 命令轻松地将其推到两个或多个存储库。但是，为了使其在发生意外故障时有用，你必须经常与 Git 存储库进行交互（特别是推送）。此外，即使你可能永远不会自己推送或拉出代码，也可能有一些要备份的存储库。

但是，使用 Ansible，你可以自动执行项目主分支（或其他任何分支）的 Git 拉取，然后自动进行存储库到“异地”镜像的 Git 推送。换句话说，你可以让你的计算机定期从 GitHub 拉取并推送到 GitLab 或 [Gitolite][5] 或 Gitea（或你喜欢的任何 Git 托管主机）。

### Ansible 模块

如果不是因其出色的模块集合，那么 Ansible 就没那么出色。像 Python 的第三方库或 Linux 的应用程序一样，这个技术引擎的一个有用而令人惊讶的简单技巧是，Ansible 以其他人贡献的组件而闻名。因为本文正在研究如何有效和可靠地备份 Git 存储库，所以这里使用的模块是 [Git 模块][6]和 [ini_file][7] 模块。

首先，创建一个名为 `mirror.yaml` 的文件作为<ruby>剧本<rt>playbook</rt></ruby>。你可以像通常使用 Ansible 一样，从 `name` 和 `task` 条目开始。本示例将 `localhost` 添加到 `hosts` 列表中，以便在控制器计算机（你现在坐在前面的计算机）上运行<ruby>动作<rt>play</rt></ruby>，但是在现实生活中，你可能会在特定的主机或一组网络上的主机上运行它。

```
---
- name: "Mirror a Git repo with Ansible"
  hosts: localhost
  tasks:
```

### Git 拉取和克隆

如果要进行备份，则需要最新代码的副本。明显，在 Git 仓库中实现这一目标的方法是执行 `git pull`。 但是，`pull` 会假定克隆已经存在，而写得很好的 Ansible 动作（Ansible 脚本）则尽可能少的假定。最好告诉 Ansible 先克隆存储库。

将你的第一个任务添加到剧本：

```
---
- name: "Mirror a Git repo with Ansible"
  hosts: localhost
  vars:
    git_dir: /tmp/soso.git
  tasks:

  - name: "Clone the git repo"
    git:
       repo: 'https://github.com/ozkl/soso.git'
       dest: '{{ git_dir }}'
       clone: yes
       update: yes
```

这个例子使用了开源的、类似于 Unix 的操作系统 soso 作为我要镜像的存储库。这是一个完全任意的选择，绝不意味着我对该存储库的未来缺乏信心。它还使用变量来引用目标文件夹 `/tmp/soso.git`，这很方便，并且如果以后你希望将它扩展为一个通用的镜像脚本也会受益。在现实生活中，你的工作机上可能会比 `/tmp` 具有更永久的位置，例如 `/home/gitmirrors/soso.git` 或 `/opt/gitmirrors/soso.git`。

运行你的剧本：

```
$ ansible-playbook mirror.yaml
```

首次运行该剧本时，Ansible 会正确检测到 Git 存储库在本地尚不存在，因此将其克隆。

```
PLAY [Ansible Git mirror] ********

TASK [Gathering Facts] ***********
ok: [localhost]

TASK [Clone git repo] ************
changed: [localhost]

PLAY RECAP ***********************
localhost: ok=2 changed=1 failed=0 [...]
```

如果你再次运行该剧本，Ansible 会正确检测到自上次运行以来没有任何更改，并且会报告未执行任何操作：

```
localhost: ok=2 changed=0 failed=0 [...]
```

接下来，必须指示 Ansible 将存储库推送到另一个 Git 服务器。

### Git 推送

Ansible 中的 Git 模块不提供 `push` 功能，因此该过程的一部分是手动的。但是，在将存储库推送到备用镜像之前，你必须具有一个镜像，并且必须将镜像配置为备用<ruby>远程服务器<rt>remote</rt></ruby>。

首先，必须将备用的远程服务器添加到 Git 配置。因为 Git 配置文件是 INI 样式的配置，所以你可以使用 `ini_file` Ansible 模块轻松地添加所需的信息。将此添加到你的剧本：

```
 - name: "Add alternate remote"
    ini_file: dest={{ git_dir }}/.git/config section='remote \"mirrored\"' option=url value='git@gitlab.com:example/soso-mirror.git'
    tags: configuration
```

为此，你必须在目标服务器上有一个空的存储库（在本例中为 [GitLab.com][9]）。如果需要在剧本中创建目标存储库，可以按照 Steve Ovens 的出色文章《[如何使用 Ansible 通过 SSH 设置 Git 服务器][10]》来完成。

最后，直接使用 Git 将 HEAD 推送到备用远程服务器：

```
 - name: "Push the repo to alternate remote"
    shell: 'git --verbose --git-dir={{ git_dir }}/.git push mirrored HEAD'
```

像往常一样运行该剧本，然后使该过程自动化，这样你就不必再次直接运行它了。你可以使用变量和特定的 Git 命令来调整脚本以适应你的需求，但是通过常规的拉取和推送操作，可以确保驻留在一台服务器上的重要项目可以安全地镜像到另一台服务器上。

这是完整的剧本，供参考：

```
---
- name: "Mirror a Git repository with Ansible"
  hosts: localhost
  vars:
    git_dir: /tmp/soso.git

  tasks:

  - name: "Clone the Git repo"
    git:
       repo: 'https://github.com/ozkl/soso.git'
       dest: '{{ git_dir }}'
       clone: yes
       update: yes

  - name: "Add alternate remote"
    ini_file: dest={{ git_dir }}/.git/config section='remote \"mirrored\"' option=url value='git@gitlab.com:example/soso-mirror.git'
    tags: configuration
 
  - name: "Push the repo to alternate remote"
    shell: 'git --verbose --git-dir={{ git_dir }}/.git push mirrored HEAD'
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/how-host-github-gitlab-ansible

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop.png?itok=pGfEfu2S (Hands programming)
[2]: https://opensource.com/resources/what-is-git
[3]: https://github.com/AntiMicro/antimicro/issues/3
[4]: https://opensource.com/article/19/10/how-community-saved-artwork-creative-commons
[5]: https://opensource.com/article/19/4/server-administration-git
[6]: https://docs.ansible.com/ansible/latest/modules/git_module.html
[7]: https://docs.ansible.com/ansible/latest/modules/ini_file_module.html
[8]: mailto:git@gitlab.com
[9]: http://GitLab.com
[10]: https://opensource.com/article/17/8/ansible-environment-management
