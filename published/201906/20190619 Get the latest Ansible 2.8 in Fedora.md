[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11002-1.html)
[#]: subject: (Get the latest Ansible 2.8 in Fedora)
[#]: via: (https://fedoramagazine.org/get-the-latest-ansible-2-8-in-fedora/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

在 Fedora 中获取最新的 Ansible 2.8
======

![][1]

Ansible 是世界上最受欢迎的自动化引擎之一。它能让你自动化几乎任何事情，从本地系统的设置到大量的平台和应用。它是跨平台的，因此你可以将其用于各种操作系统。请继续阅读以获取有关如何在 Fedora 中获取最新 Ansible，以及它的一些更改和改进，以及如何使用它。

### 发布版本和功能

Ansible 2.8 最近发布了，其中包含许多修复、功能和增强。仅仅几天之后，它就可在 Fedora 29 和 30 以及 EPEL 中获取。两周前发布了后续版本 2.8.1。同样，新版本在几天内就可以在 Fedora 中获取。

[使用 sudo][2] 能够非常容易地从官方仓库安装：

```
$ sudo dnf -y install ansible
```

2.8 版本有很长的更新列表，你可以在 [2.8 的迁移指南][3]中阅读查看。但其中包含了一些好东西，比如 *Python 解释器发现功能* 。Ansible 2.8 现在会试图找出哪个 Python 是它所运行的平台的首选版本。如果失败，Ansible 会使用后备列表。但是，你仍然可以使用变量 `ansible_python_interpreter` 来设置 Python 解释器。

另一个变化使 Ansible 在各个平台上更加一致。由于 `sudo` 专用于 UNIX/Linux，而其他平台并没有，因此现在在更多地方使用 `become`。这包括了命令行开关。例如，`-ask-sudo-pass` 已变成了 `-ask-become-pass`，提示符也变成了 `BECOME password:`。

2.8 和 2.8.1 版本中还有许多其他功能。有关所有细节，请查看 [GitHub 上的官方更新日志][4]。

### 使用 Ansible

也许你不确定 Ansible 是否可以实际使用。别担心，你并不是唯一一个这样想的，因为它太强大了。但事实证明，它并不难以使用，在一个家庭内的几台电脑（甚至一台电脑）上设置都可以。

我们之前在 Fedora Magazine 中也讨论过这个话题：

- [使用 Ansible 设置工作站][5]

试试看 Ansible，说下你的想法。很重要的一部分是让 Fedora 保持最新版本。自动化快乐！

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/get-the-latest-ansible-2-8-in-fedora/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/06/ansible28-816x345.jpg
[2]: https://fedoramagazine.org/howto-use-sudo/
[3]: https://docs.ansible.com/ansible/latest/porting_guides/porting_guide_2.8.html
[4]: https://github.com/ansible/ansible/blob/stable-2.8/changelogs/CHANGELOG-v2.8.rst
[5]: https://fedoramagazine.org/using-ansible-setup-workstation/
