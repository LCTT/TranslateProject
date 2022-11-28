[#]: subject: (How to use Poetry to manage your Python projects on Fedora)
[#]: via: (https://fedoramagazine.org/how-to-use-poetry-to-manage-your-python-projects-on-fedora/)
[#]: author: (Kader Miyanyedi https://fedoramagazine.org/author/moonkat/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13202-1.html)

如何在 Fedora 上使用 Poetry 来管理你的 Python 项目？
======

![Python & Poetry on Fedora][1]

Python 开发人员经常创建一个新的虚拟环境来分离项目依赖，然后用 `pip`、`pipenv` 等工具来管理它们。Poetry 是一个简化 Python 中依赖管理和打包的工具。这篇文章将向你展示如何在 Fedora 上使用 Poetry 来管理你的 Python 项目。

与其他工具不同，Poetry 只使用一个配置文件来进行依赖管理、打包和发布。这消除了对不同文件的需求，如 `Pipfile`、`MANIFEST.in`、`setup.py` 等。这也比使用多个工具更快。

下面详细介绍一下开始使用 Poetry 时使用的命令。

### 在 Fedora 上安装 Poetry

如果你已经使用 Fedora 32 或以上版本，你可以使用这个命令直接从命令行安装 Poetry：

```
$ sudo dnf install poetry
```

编者注：在 Fedora Silverblue 或 CoreOs上，Python 3.9.2 是核心提交的一部分，你可以用下面的命令安装 Poetry：

```
rpm-ostree install poetry
```

### 初始化一个项目

使用 `new` 命令创建一个新项目：

```
$ poetry new poetry-project
```

用 Poetry 创建的项目结构是这样的：

```
├── poetry_project
│   └── init.py
├── pyproject.toml
├── README.rst
└── tests
    ├── init.py
    └── test_poetry_project.py
```

Poetry 使用 `pyproject.toml` 来管理项目的依赖。最初，这个文件看起来类似于这样：

```
[tool.poetry]
name = "poetry-project"
version = "0.1.0"
description = ""
authors = ["Kadermiyanyedi <kadermiyanyedi@hotmail.com>"]

[tool.poetry.dependencies]
python = "^3.9"

[tool.poetry.dev-dependencies]
pytest = "^5.2"

[build-system]
requires = ["poetry>=0.12"]
build-backend = "poetry.masonry.api"
```

这个文件包含 4 个部分：

  * 第一部分包含描述项目的信息，如项目名称、项目版本等。
  * 第二部分包含项目的依赖。这些依赖是构建项目所必需的。
  * 第三部分包含开发依赖。
  * 第四部分描述的是符合 [PEP 517][2] 的构建系统。

如果你已经有一个项目，或者创建了自己的项目文件夹，并且你想使用 Poetry，请在你的项目中运行 `init` 命令。

```
$ poetry init
```

在这个命令之后，你会看到一个交互式的 shell 来配置你的项目。

### 创建一个虚拟环境

如果你想创建一个虚拟环境或激活一个现有的虚拟环境，请使用以下命令：

```
$ poetry shell
```

Poetry 默认在 `/home/username/.cache/pypoetry` 项目中创建虚拟环境。你可以通过编辑 Poetry 配置来更改默认路径。使用下面的命令查看配置列表：

```
$ poetry config --list

cache-dir = "/home/username/.cache/pypoetry"
virtualenvs.create = true
virtualenvs.in-project = true
virtualenvs.path = "{cache-dir}/virtualenvs"
```

修改 `virtualenvs.in-project` 配置变量，在项目目录下创建一个虚拟环境。Poetry 命令是：

```
$ poetry config virtualenv.in-project true
```

### 添加依赖

使用 `poetry add` 命令为项目安装一个依赖：

```
$ poetry add django
```

你可以使用带有 `--dev` 选项的 `add` 命令来识别任何只用于开发环境的依赖：

```
$ poetry add black --dev
```

`add` 命令会创建一个 `poetry.lock` 文件，用来跟踪软件包的版本。如果 `poetry.lock` 文件不存在，那么会安装 `pyproject.toml` 中所有依赖项的最新版本。如果 `poetry.lock` 存在，Poetry 会使用文件中列出的确切版本，以确保每个使用这个项目的人的软件包版本是一致的。

使用 `poetry install` 命令来安装当前项目中的所有依赖：

```
$ poetry install
```

通过使用 `--no-dev` 选项防止安装开发依赖：

```
$ poetry install --no-dev
```

### 列出软件包

`show` 命令会列出所有可用的软件包。`--tree` 选项将以树状列出软件包：

```
$ poetry show --tree

django 3.1.7 A high-level Python Web framework that encourages rapid development and clean, pragmatic design.
├── asgiref >=3.2.10,<4
├── pytz *
└── sqlparse >=0.2.2
```

包含软件包名称，以列出特定软件包的详细信息：

```
$ poetry show requests

name         : requests
version      : 2.25.1
description  : Python HTTP for Humans.

dependencies
 - certifi >=2017.4.17
 - chardet >=3.0.2,<5
 - idna >=2.5,<3
 - urllib3 >=1.21.1,<1.27
```

最后，如果你想知道软件包的最新版本，你可以通过 `--latest` 选项：

```
$ poetry show --latest

idna     2.10      3.1    Internationalized Domain Names in Applications
asgiref  3.3.1     3.3.1  ASGI specs, helper code, and adapters
```

### 更多信息

Poetry 的更多详情可在[文档][3]中获取。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-use-poetry-to-manage-your-python-projects-on-fedora/

作者：[Kader Miyanyedi][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/moonkat/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/03/Poetry_Python-816x345.jpg
[2]: https://www.python.org/dev/peps/pep-0517/
[3]: https://python-poetry.org/docs/
