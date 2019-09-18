[#]: collector: (lujun9972)
[#]: translator: (heguangzhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11356-1.html)
[#]: subject: (Managing Ansible environments on MacOS with Conda)
[#]: via: (https://opensource.com/article/19/8/using-conda-ansible-administration-macos)
[#]: author: (James Farrell https://opensource.com/users/jamesf)


使用 Conda 管理 MacOS 上的 Ansible 环境
=====

> Conda 将 Ansible 所需的一切都收集到虚拟环境中并将其与其他项目分开。

![](https://img.linux.net.cn/data/attachment/album/201909/18/123838m1bcmke570kl6kzm.jpg)

如果你是一名使用 MacOS 并涉及到 Ansible 管理的 Python 开发人员，你可能希望使用 Conda 包管理器将 Ansible 的工作内容与核心操作系统和其他本地项目分开。

Ansible 基于 Python。要让 Ansible 在 MacOS 上工作，Conda 并不是必须要的，但是它确实让你管理 Python 版本和包依赖变得更加容易。这允许你在 MacOS 上使用升级的 Python 版本，并在你的系统中、Ansible 和其他编程项目之间保持 Python 包的依赖性相互独立。

在 MacOS 上安装 Ansible 还有其他方法。你可以使用 [Homebrew][2]，但是如果你对 Python 开发（或 Ansible 开发）感兴趣，你可能会发现在一个独立 Python 虚拟环境中管理 Ansible 可以减少一些混乱。我觉得这更简单；与其试图将 Python 版本和依赖项加载到系统或 `/usr/local` 目录中 ，还不如使用 Conda 帮助我将 Ansible 所需的一切都收集到一个虚拟环境中，并将其与其他项目完全分开。

本文着重于使用 Conda 作为 Python 项目来管理 Ansible，以保持它的干净并与其他项目分开。请继续阅读，并了解如何安装 Conda、创建新的虚拟环境、安装 Ansible 并对其进行测试。

### 序幕

最近，我想学习 [Ansible][3]，所以我需要找到安装它的最佳方法。

我通常对在我的日常工作站上安装东西很谨慎。我尤其不喜欢对供应商的默认操作系统安装应用手动更新（这是我多年作为 Unix 系统管理的习惯）。我真的很想使用 Python 3.7，但是 MacOS 的 Python 包是旧的 2.7，我不会安装任何可能干扰核心 MacOS 系统的全局 Python 包。

所以，我使用本地 Ubuntu 18.04 虚拟机上开始了我的 Ansible 工作。这提供了真正意义上的的安全隔离，但我很快发现管理它是非常乏味的。所以我着手研究如何在本机 MacOS 上获得一个灵活但独立的 Ansible 系统。

由于 Ansible 基于 Python，Conda 似乎是理想的解决方案。

### 安装 Conda

Conda 是一个开源软件，它提供方便的包和环境管理功能。它可以帮助你管理多个版本的 Python、安装软件包依赖关系、执行升级和维护项目隔离。如果你手动管理 Python 虚拟环境，Conda 将有助于简化和管理你的工作。浏览 [Conda 文档][4]可以了解更多细节。

我选择了 [Miniconda][5] Python 3.7 安装在我的工作站中，因为我想要最新的 Python 版本。无论选择哪个版本，你都可以使用其他版本的 Python 安装新的虚拟环境。

要安装 Conda，请下载 PKG 格式的文件，进行通常的双击，并选择 “Install for me only” 选项。安装在我的系统上占用了大约 158 兆的空间。

安装完成后，调出一个终端来查看你有什么了。你应该看到：

  * 在你的家目录中的 `miniconda3` 目录
  * shell 提示符被修改为 `(base)`
  * `.bash_profile` 文件更新了一些 Conda 特有的设置内容

现在基础已经安装好了，你有了第一个 Python 虚拟环境。运行 Python 版本检查可以证明这一点，你的 `PATH` 将指向新的位置：

```
(base) $ which python
/Users/jfarrell/miniconda3/bin/python
(base) $ python --version
Python 3.7.1
```

现在安装了 Conda，下一步是建立一个虚拟环境，然后安装 Ansible 并运行。

### 为 Ansible 创建虚拟环境

我想将 Ansible 与我的其他 Python 项目分开，所以我创建了一个新的虚拟环境并切换到它:

```
(base) $ conda create --name ansible-env --clone base
(base) $ conda activate ansible-env
(ansible-env) $ conda env list
```

第一个命令将 Conda 库克隆到一个名为 `ansible-env` 的新虚拟环境中。克隆引入了 Python 3.7 版本和一系列默认的 Python 模块，你可以根据需要添加、删除或升级这些模块。

第二个命令将 shell 上下文更改为这个新的环境。它为 Python 及其包含的模块设置了正确的路径。请注意，在 `conda activate ansible-env` 命令后，你的 shell 提示符会发生变化。

第三个命令不是必须的；它列出了安装了哪些 Python 模块及其版本和其他数据。

你可以随时使用 Conda 的 `activate` 命令切换到另一个虚拟环境。这将带你回到基本环境：`conda base`。

### 安装 Ansible 

安装 Ansible 有多种方法，但是使用 Conda 可以将 Ansible 版本和所有需要的依赖项打包在一个地方。Conda 提供了灵活性，既可以将所有内容分开，又可以根据需要添加其他新环境（我将在后面演示）。

要安装 Ansible 的相对较新版本，请使用:

```
(base) $ conda activate ansible-env
(ansible-env) $ conda install -c conda-forge ansible
```

由于 Ansible 不是 Conda 默认通道的一部分，因此 `-c` 用于从备用通道搜索和安装。Ansible 现已安装到 `ansible-env` 虚拟环境中，可以使用了。

### 使用 Ansible

既然你已经安装了 Conda 虚拟环境，就可以使用它了。首先，确保要控制的节点已将工作站的 SSH 密钥安装到正确的用户帐户。

调出一个新的 shell 并运行一些基本的 Ansible 命令：

```
(base) $ conda activate ansible-env
(ansible-env) $ ansible --version
ansible 2.8.1
  config file = None
  configured module search path = ['/Users/jfarrell/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /Users/jfarrell/miniconda3/envs/ansibleTest/lib/python3.7/site-packages/ansible
  executable location = /Users/jfarrell/miniconda3/envs/ansibleTest/bin/ansible
  python version = 3.7.1 (default, Dec 14 2018, 13:28:58) [Clang 4.0.1 (tags/RELEASE_401/final)]
(ansible-env) $ ansible all -m ping -u ansible
192.168.99.200 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
```

现在 Ansible 工作了，你可以在控制台中抽身，并从你的 MacOS 工作站中使用它们。

### 克隆新的 Ansible 进行 Ansible 开发

这部分完全是可选的；只有当你想要额外的虚拟环境来修改 Ansible 或者安全地使用有问题的 Python 模块时，才需要它。你可以通过以下方式将主 Ansible 环境克隆到开发副本中:

```
(ansible-env) $ conda create --name ansible-dev --clone ansible-env
(ansible-env) $ conda activte ansible-dev
(ansible-dev) $
```

### 需要注意的问题

偶尔你可能遇到使用 Conda 的麻烦。你通常可以通过以下方式删除不良环境：

```
$ conda activate base
$ conda remove --name ansible-dev --all
```

如果出现无法解决的错误，通常可以通过在 `~/miniconda3/envs` 中找到该环境并删除整个目录来直接删除环境。如果基础环境损坏了，你可以删除整个 `~/miniconda3`，然后从 PKG 文件中重新安装。只要确保保留 `~/miniconda3/envs` ，或使用 Conda 工具导出环境配置并在以后重新创建即可。

MacOS 上不包括 `sshpass` 程序。只有当你的 Ansible 工作要求你向 Ansible 提供 SSH 登录密码时，才需要它。你可以在 SourceForge 上找到当前的 [sshpass 源代码][6]。

最后，基础的 Conda Python 模块列表可能缺少你工作所需的一些 Python 模块。如果你需要安装一个模块，首选命令是 `conda install package`，但是需要的话也可以使用 `pip`，Conda 会识别安装的模块。

### 结论

Ansible 是一个强大的自动化工具，值得我们去学习。Conda 是一个简单有效的 Python 虚拟环境管理工具。

在你的 MacOS 环境中保持软件安装分离是保持日常工作环境的稳定性和健全性的谨慎方法。Conda 尤其有助于升级你的 Python 版本，将 Ansible 从其他项目中分离出来，并安全地使用 Ansible。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/using-conda-ansible-administration-macos

作者：[James Farrell][a]
选题：[lujun9972][b]
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jamesf
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cicd_continuous_delivery_deployment_gears.png?itok=kVlhiEkc (CICD with gears)
[2]: https://brew.sh/
[3]: https://docs.ansible.com/?extIdCarryOver=true&sc_cid=701f2000001OH6uAAG
[4]: https://conda.io/projects/conda/en/latest/index.html
[5]: https://docs.conda.io/en/latest/miniconda.html
[6]: https://sourceforge.net/projects/sshpass/
