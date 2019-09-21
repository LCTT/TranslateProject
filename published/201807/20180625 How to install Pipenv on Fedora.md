如何在 Fedora 上安装 Pipenv
======

![](https://fedoramagazine.org/wp-content/uploads/2018/06/pipenv-install-816x345.jpg)

Pipenv 的目标是将打包界（bundler、composer、npm、cargo、yarn 等）最好的东西带到 Python 世界来。它试图解决一些问题，并简化整个管理过程。

目前，Python 程序依赖项的管理有时似乎是一个挑战。开发人员通常为每个新项目创建一个[虚拟环境][1]，并使用 [pip][2] 将依赖项安装到其中。此外，他们必须将已安装的软件包的集合保存到 `requirements.txt` 文件中。我们看到过许多旨在自动化此工作流程的工具和包装程序。但是，仍然需要结合多个程序，并且 `requirements.txt` 格式本身并不适用于更复杂的场景。

### 一个统治它们的工具

Pipenv 可以正确地管理复杂的相互依赖关系，它还提供已安装包的手动记录。例如，开发、测试和生产环境通常需要一组不同的包。过去，每个项目需要维护多个 `requirements.txt`。Pipenv 使用 [TOML][4] 语法引入了新的 [Pipfile][3] 格式。多亏这种格式，你终于可以在单个文件中维护不同环境的多组需求。

在将第一行代码提交到项目中仅一年后，Pipenv 已成为管理 Python 程序依赖关系的官方推荐工具。现在它终于在 Fedora 仓库中提供。

### 在 Fedora 上安装 Pipenv

在全新安装 Fedora 28 及更高版本后，你只需在终端上运行此命令即可安装 Pipenv：

```
$ sudo dnf install pipenv
```

现在，你的系统已准备好在 Pipenv 的帮助下开始使用新的 Python 3 程序。

重要的是，虽然这个工具为程序提供了很好的解决方案，但它并不是为处理库需求而设计的。编写 Python 库时，不需要固定依赖项。你应该在 `setup.py` 文件中指定 `install_requires`。

### 基本依赖管理

首先为项目创建一个目录：

```
$ mkdir new-project && cd new-project
```

接下来是为此项目创建虚拟环境：

```
$ pipenv --three
```

这里的 `-three` 选项将虚拟环境的 Python 版本设置为 Python 3。

安装依赖项：

```
$ pipenv install requests
Installing requests…
Adding requests to Pipfile's [packages]…
Pipfile.lock not found, creating…
Locking [dev-packages] dependencies…
Locking [packages] dependencies…
```

最后生成 lockfile：

```
$ pipenv lock
Locking [dev-packages] dependencies…
Locking [packages] dependencies…
Updated Pipfile.lock (b14837)
```

你还可以检查依赖关系图：

```
$ pipenv graph
- certifi [required: >=2017.4.17, installed: 2018.4.16]
- chardet [required: <3.1.0,>=3.0.2, installed: 3.0.4]
- idna [required: <2.8,>=2.5, installed: 2.7]
- urllib3 [required: >=1.21.1,<1.24, installed: 1.23]
```

有关 Pipenv 及其命令的更多详细信息，请参见[文档][5]。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/install-pipenv-fedora/

作者：[Michal Cyprian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/mcyprian/
[1]:https://packaging.python.org/tutorials/installing-packages/#creating-virtual-environments
[2]:https://developer.fedoraproject.org/tech/languages/python/pypi-installation.html
[3]:https://github.com/pypa/pipfile
[4]:https://github.com/toml-lang/toml
[5]:https://docs.pipenv.org/
