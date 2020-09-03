[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12540-1.html)
[#]: subject: (Come test a new release of pipenv, the Python development tool)
[#]: via: (https://fedoramagazine.org/come-test-a-new-release-of-pipenv-the-python-development-tool/)
[#]: author: (torsava https://fedoramagazine.org/author/torsava/)

快来测试 Python 开发工具 pipenv 的新版本
======

![][1]

[pipenv][2] 是一个可帮助 Python 开发人员维护具有特定一组依赖关系的隔离虚拟环境，以实现可重新复制的开发和部署环境的工具。它类似于其他编程语言中的工具如 bundler、composer、npm、cargo、yarn 等。

最近发布了新版本的 pipenv 2020.6.2。现在可以在 Fedora 33 和 Rawhide 中使用它。对于较旧的 Fedora，维护人员决定打包到 [COPR][3] 中来先进行测试。所以在他们把它推送到稳定的Fedora版本之前，来试试吧。新版本没有带来任何新颖的功能，但是经过两年的开发，它解决了许多问题，并且在底层做了很多不同的事情。之前可以正常工作的应该可以继续工作，但是可能会略有不同。

### 如何获取

如果你已经在运行 Fedora 33 或 Rawhide，请运行 `$ sudo dnf upgrade pipenv` 或者 `$ sudo dnf install pipenv`，你将获得新版本。

在 Fedora 31 或 Fedora 32 上，你需要使用 [copr 仓库][3]，直到经过测试的包出现在官方仓库中为止。要启用仓库，请运行：

```
$ sudo dnf copr enable @python/pipenv
```

然后将 `pipenv` 升级到新版本，运行：

```
$ sudo dnf upgrade pipenv
```

或者，如果尚未安装，请通过以下方式安装：

```
$ sudo dnf install pipenv
```

如果你需要回滚到官方维护的版本，可以运行：

```
$ sudo dnf copr disable @python/pipenv
$ sudo dnf distro-sync pipenv
```

*COPR 不受 Fedora 基础架构的官方支持。使用软件包需要你自担风险。*

### 如何使用

如果你有用旧版本 `pipenv` 管理的项目，你应该可以毫无问题地使用新版本。如果有问题请让我们知道。

如果你还不熟悉 `pipenv` 或想开始一个新项目，请参考以下快速指南：

创建一个工作目录：

```
$ mkdir new-project && cd new-project
```

使用 Python 3 初始化 `pipenv`：

```
$ pipenv --three
```

安装所需的软件包，例如：

```
$ pipenv install six
```

生成 `Pipfile.lock` 文件：

```
$ pipenv lock
```

现在，你可以将创建的 `Pipfile` 和 `Pipfile.lock` 文件提交到版本控制系统（例如 git）中，其他人可以在克隆的仓库中使用此命令来获得相同的环境：

```
$ pipenv install
```

有关更多示例，请参见 [pipenv 的文档][4]。

### 如何报告问题

如果你使用新版本的 `pipenv` 遇到任何问题，请[在 Fedora 的 Bugzilla中 报告问题][5]。Fedora 官方仓库和 copr 仓库中 `pipenv` 软件包的维护者是相同的人。请在报告中指出是新版本。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/come-test-a-new-release-of-pipenv-the-python-development-tool/

作者：[torsava][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/torsava/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2018/06/pipenv-install-816x345.jpg
[2]: https://github.com/pypa/pipenv
[3]: https://copr.fedorainfracloud.org/coprs/g/python/pipenv/
[4]: https://pipenv.pypa.io/en/latest/install/
[5]: https://bugzilla.redhat.com/enter_bug.cgi?product=Fedora&component=pipenv
